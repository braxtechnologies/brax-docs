---
date: 2025-01-07
authors:
  - brax-team
categories:
  - Engineering
  - Android
  - Security
tags:
  - selinux
  - android
  - security
  - development
---

# Working with SELinux on Android

Understanding and working with Security-Enhanced Linux (SELinux) in Android development - from basics to advanced policy writing.

<!-- more -->

## Glossary

- **AOSP**: Android Open Source Project
- **AVC**: Access Vector Cache - SELinux component that caches access decisions
- **CTS**: Compatibility Test Suite - Google's test suite for Android compatibility
- **DAC**: Discretionary Access Control - Traditional Linux permission system
- **Domain**: SELinux security context for processes
- **Enforcing**: SELinux mode that blocks and logs policy violations
- **Label**: SELinux security context assigned to files, processes, and other objects
- **MAC**: Mandatory Access Control - Security architecture that restricts operations based on policy
- **NSA**: National Security Agency - Original developer of SELinux
- **Permissive**: SELinux mode that logs but doesn't block policy violations
- **Policy**: Set of rules that define what access is allowed
- **Security Context**: Label assigned to subjects and objects (format: user:role:type:level)
- **Type**: The third component of a security context, most commonly used in Android SELinux

## What is SELinux?

Security-Enhanced Linux (SELinux) is a Linux kernel security module that provides a mechanism for supporting access control security policies. It implements Mandatory Access Control (MAC), which means access decisions are based on a centralized security policy rather than user discretion.

### History of SELinux in Android

SELinux was originally developed by the NSA to demonstrate the value of MAC and how it can be applied to Linux. It was merged into Linux 2.6 in August 2003. Red Hat and McAfee Corp. are among the significant contributors to SELinux development.

A separate project called Security Enhancements (SE) for Android was led by the NSA to integrate SELinux into Android. This integration resulted in:

- **Android 4.3**: SELinux introduced, defaulting to Permissive mode
- **Android 4.4**: Optionally Enforcing mode available
- **Android 5.0**: Required by Google's CTS to be in Enforcing mode

## Why SELinux Matters

Traditional Linux security (DAC) relies on file permissions and process ownership. However, if a privileged process is compromised, an attacker gains full system access. SELinux adds an additional layer of security by:

1. **Limiting Damage**: Even if a process runs as root, SELinux restricts what it can access
2. **Principle of Least Privilege**: Processes only get the minimum permissions needed
3. **Defense in Depth**: Multiple security layers protect the system
4. **Audit Trail**: All denials are logged for security analysis

## SELinux Modes

### Enforcing
- Policy violations are **blocked** and **logged**
- Required for production Android devices
- Provides active security protection

### Permissive
- Policy violations are **logged but not blocked**
- Useful for development and debugging
- Helps identify what policies are needed

### Disabled
- SELinux is completely turned off
- Not recommended and will fail CTS

## Understanding SELinux Contexts

Every file, process, and object in Android has a security context with four components:

```
user:role:type:level
```

Example: `u:r:system_app:s0`

- **user**: Usually `u` in Android
- **role**: Usually `r` in Android
- **type**: The most important component in Android SELinux (e.g., `system_app`, `untrusted_app`)
- **level**: Multi-Level Security (MLS) level, usually `s0`

### Viewing Contexts

```bash
# View file context
ls -Z /system/bin/app_process

# View process context
ps -Z

# View current process context
id -Z
```

## SELinux Policy Language

SELinux policies use a simple rule-based language. The most common rule is `allow`:

```
allow source_type target_type:class permissions;
```

### Example Policy Rules

```selinux
# Allow system_server to read system_data_file
allow system_server system_data_file:file read;

# Allow init to execute shell commands
allow init shell_exec:file { read open execute };

# Allow apps to use the network
allow untrusted_app node:tcp_socket node_bind;
```

### Common Classes and Permissions

**File Operations:**
- `file`: Regular files
- `dir`: Directories
- `lnk_file`: Symbolic links

**Common Permissions:**
- `read`, `write`, `open`, `execute`
- `getattr`, `setattr`
- `create`, `unlink`, `rename`

**Process Operations:**
- `process`: Process control
- `capability`: Linux capabilities

**Network Operations:**
- `tcp_socket`, `udp_socket`
- `node`, `netif`

## Working with SELinux Policies in Android

### File Locations

SELinux policy files in Android are typically located in:

```
device/<manufacturer>/<device>/sepolicy/
```

Common policy files:
- `file_contexts`: Labels for files
- `*.te`: Type Enforcement files (domain definitions and rules)
- `genfs_contexts`: Labels for filesystems
- `service_contexts`: Labels for system services

### Creating Custom Policies

1. **Identify the denial** in logcat or dmesg:

```
avc: denied { read } for pid=1234 comm="my_process" 
name="my_file" dev="sda1" ino=5678 
scontext=u:r:my_domain:s0 
tcontext=u:object_r:my_type:s0 
tclass=file permissive=0
```

2. **Analyze the denial**:
   - `scontext`: Source domain (process trying to access)
   - `tcontext`: Target type (object being accessed)
   - `tclass`: Object class (file, dir, socket, etc.)
   - `denied`: Permission being denied

3. **Create the policy rule**:

```selinux
# Allow my_process to read my_file
allow my_domain my_type:file read;
```

4. **Add to appropriate .te file** in your device's sepolicy directory

### Policy File Organization

```
sepolicy/
├── file_contexts          # File labels
├── init.te               # Init domain rules
├── system_server.te      # System server rules
├── untrusted_app.te      # Untrusted app rules
├── my_custom_domain.te   # Custom domain rules
└── service_contexts      # Service labels
```

## Debugging SELinux Issues

### Checking SELinux Status

```bash
# Check if SELinux is enabled
adb shell getenforce

# Set to permissive (for debugging only!)
adb shell setenforce 0

# Set to enforcing
adb shell setenforce 1
```

### Finding SELinux Denials

```bash
# View all AVC denials
adb logcat | grep avc:

# View denials with more context
adb logcat | grep -i "avc\|selinux"

# Check kernel logs
adb shell dmesg | grep avc
```

### Using audit2allow

`audit2allow` is a tool that generates policy rules from denials:

```bash
# Generate policy from denials
adb logcat | grep avc | audit2allow

# More readable format
adb logcat | grep avc | audit2allow -p policy.conf
```

**Warning**: Don't blindly add all rules suggested by audit2allow. Always understand what access you're granting and why.

## Best Practices

### 1. Follow the Principle of Least Privilege
Only grant the minimum permissions necessary for functionality.

```selinux
# Bad - too broad
allow my_domain domain:file *;

# Good - specific permissions
allow my_domain my_type:file { read open };
```

### 2. Use Appropriate Types
Don't use generic types when specific ones exist.

```selinux
# Bad
allow my_app system_file:file read;

# Good
allow my_app app_data_file:file read;
```

### 3. Never Use Permissive Domains in Production
Permissive domains bypass SELinux protection.

```selinux
# Never do this in production!
permissive my_domain;
```

### 4. Document Your Policies
Add comments explaining why rules are needed.

```selinux
# Allow camera HAL to access camera device
# Required for camera preview and capture
allow hal_camera camera_device:chr_file { read write ioctl open };
```

### 5. Test Thoroughly
Always test in Enforcing mode before releasing.

## Common Issues and Solutions

### Issue: App Crashes with "Permission Denied"

**Solution**: Check for SELinux denials in logcat and add appropriate policy.

### Issue: Service Won't Start

**Solution**: 
1. Check service_contexts for correct label
2. Verify init domain has permission to start the service
3. Check the service domain has access to required resources

### Issue: File Access Denied

**Solution**:
1. Verify file_contexts labels the file correctly
2. Add policy allowing the domain to access the file type
3. Ensure file permissions (DAC) are also correct

## Advanced Topics

### Macros

SELinux policies support macros for common patterns:

```selinux
# Define a macro
define(`my_macro', `
  allow $1 $2:file read;
  allow $1 $2:dir search;
')

# Use the macro
my_macro(my_domain, my_type)
```

### Attributes

Group multiple types under a common attribute:

```selinux
# Define attribute
attribute my_attribute;

# Assign types to attribute
typeattribute my_domain_1 my_attribute;
typeattribute my_domain_2 my_attribute;

# Write rules for all types with the attribute
allow my_attribute system_file:file read;
```

### Booleans

Allow runtime policy switching:

```selinux
# Define boolean
bool my_feature_enabled true;

# Conditional rule
if (my_feature_enabled) {
    allow my_domain my_type:file write;
}
```

## Conclusion

SELinux is a powerful security feature that's essential for modern Android devices. While it can seem complex at first, understanding the basics of contexts, policies, and debugging techniques will make working with SELinux much more manageable.

Key takeaways:
- SELinux provides mandatory access control beyond traditional permissions
- Always test in Enforcing mode before production
- Follow the principle of least privilege
- Document your policies for future maintenance
- Use SELinux as one layer of a defense-in-depth strategy

## Resources

- [Android SELinux Documentation](https://source.android.com/security/selinux)
- [SELinux Project](https://selinuxproject.org/)
- [NSA SELinux Resources](https://www.nsa.gov/what-we-do/research/selinux/)
- [Android CTS Requirements](https://source.android.com/compatibility/cts)

---

*This article is based on SELinux implementation practices in LineageOS and AOSP.*
