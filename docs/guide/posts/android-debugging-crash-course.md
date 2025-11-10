---
date: 2025-01-06
authors:
  - brax-team
categories:
  - Engineering
  - Android
  - Debugging
tags:
  - debugging
  - android
  - development
  - adb
  - logcat

---
comments: true
---

# 🐛 Android Debugging Crash Course

<div style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); padding: 1.75rem; border-radius: 10px; margin-bottom: 1.5rem; color: white;">
  <h2 style="color: white; margin: 0 0 .5rem 0;">Master Android debugging from logs to kernel panics</h2>
  <p style="margin: 0; opacity: .95;">Learn the tools, techniques, and best practices for diagnosing issues at every level of the Android stack.</p>
</div>

<!-- more -->

## Glossary

Before diving into debugging, let's familiarize ourselves with key terms:

- **ADB**: Android Debug Bridge - Command-line tool for communicating with Android devices
- **Buffer**: A fixed size storage area in memory
- **CLI**: Command-line interface
- **Commits**: An atomic change to a codebase, used for version control
- **Debugging**: The process of finding and fixing errors, bugs, and unintended behavior
- **Device block files**: Special files in the /dev directory that allow for standardized interaction with kernel drivers
- **DTS**: Device Tree Source
- **EDL**: Qualcomm's Emergency Download mode
- **gdb**: GNU Debugger
- **HAL**: Hardware Abstraction Layer
- **Kernel Space**: Space where kernel runs and interacts with device drivers
- **Logging**: Recording and storing events that occur when running software, such as error messages, warnings, and debugging information
- **Memory Address**: A unique identifier that specifies the location in memory where data or instructions are stored
- **OEM**: Original equipment manufacturer (e.g., Google, Fairphone, Samsung, etc.)
- **PID**: Process ID
- **pstore**: Persistent Store
- **Rebase**: The process of moving commits from one branch to another branch
- **Stack Trace**: Shows the sequence of function calls that led to an error or exception in a program
- **TID**: Thread ID
- **UART**: Universal Asynchronous Receiver / Transmitter
- **User Space**: Space where normal user processes run, such as applications

## What is Debugging?

Debugging is the systematic process of identifying, analyzing, and fixing bugs or issues in software. In Android development, debugging can range from simple application crashes to complex kernel panics.

## Essential Debugging Tools

### Android Debug Bridge (ADB)

ADB is your primary tool for debugging Android devices. It allows you to:

- Access device logs
- Install and debug applications
- Execute shell commands on the device
- Transfer files between computer and device

**Basic ADB Commands:**

```bash
# Check connected devices
adb devices

# Access device shell
adb shell

# View logs
adb logcat

# Install an APK
adb install app.apk

# Reboot device
adb reboot
```

### Logcat

Logcat is Android's logging system that displays system and application log messages.

**Filtering Logcat:**

```bash
# View all logs
adb logcat

# Filter by priority (V=Verbose, D=Debug, I=Info, W=Warning, E=Error, F=Fatal)
adb logcat *:E

# Filter by tag
adb logcat ActivityManager:I *:S

# Clear logs
adb logcat -c

# Save logs to file
adb logcat > logs.txt
```

## Debugging User Space Issues

### Application Crashes

When an app crashes, look for stack traces in logcat:

```bash
adb logcat | grep -i "exception\|error\|crash"
```

Key information to look for:
- Exception type
- Stack trace showing the call sequence
- Line numbers in source code
- Thread information

### Performance Issues

For performance debugging:

```bash
# CPU profiling
adb shell top

# Memory usage
adb shell dumpsys meminfo <package_name>

# Battery usage
adb shell dumpsys batterystats
```

## Debugging Kernel Space Issues

### Kernel Logs

Access kernel logs with:

```bash
adb shell dmesg
```

### Kernel Panics

When the kernel crashes, it generates a panic log. You can access this through:

- **pstore**: Persistent storage that survives reboots
- **Last kmsg**: `/proc/last_kmsg` or `/sys/fs/pstore/`

```bash
adb shell cat /proc/last_kmsg
adb shell ls /sys/fs/pstore/
```

### UART Debugging

For low-level kernel debugging, UART (serial console) access is invaluable:

1. Locate UART pins on device (requires hardware documentation)
2. Connect USB-to-UART adapter
3. Use terminal program (minicom, screen, etc.)
4. View kernel boot messages and panics in real-time

## Advanced Debugging Techniques

### GDB Debugging

For native code debugging:

```bash
# Attach to running process
adb shell gdbserver :5039 --attach <PID>

# On host machine
gdb
(gdb) target remote :5039
```

### SELinux Debugging

SELinux denials can cause mysterious failures:

```bash
# Check for denials
adb logcat | grep avc:

# Temporarily set to permissive (for debugging only!)
adb shell setenforce 0
```

### Hardware Abstraction Layer (HAL) Issues

Debug HAL issues by:

1. Checking HAL service status: `adb shell lshal`
2. Examining HAL logs in logcat
3. Verifying device permissions and SELinux contexts

## Best Practices

1. **Always start with logs**: Check logcat, dmesg, and kernel logs first
2. **Reproduce consistently**: Find reliable steps to reproduce the issue
3. **Isolate the problem**: Narrow down to specific components
4. **Use proper tools**: Choose the right debugging tool for the problem
5. **Document findings**: Keep notes on what you've tried and learned
6. **Test incrementally**: Make small changes and test frequently

## Common Debugging Scenarios

### Device Won't Boot

1. Check bootloader logs via UART
2. Try recovery mode
3. Check for kernel panics in pstore
4. Verify partition integrity

### Service Crashes Repeatedly

1. Check logcat for crash dumps
2. Verify dependencies are running
3. Check SELinux denials
4. Examine service initialization sequence

### Performance Degradation

1. Profile CPU usage with `top`
2. Check memory leaks with `dumpsys meminfo`
3. Analyze wake locks for battery drain
4. Review I/O performance with `iostat`

## Resources and Further Reading

- [Android Debugging Documentation](https://developer.android.com/studio/debug)
- [Linux Kernel Debugging](https://www.kernel.org/doc/html/latest/)
- [ADB Documentation](https://developer.android.com/tools/adb)

## Conclusion

Effective debugging is a critical skill for Android developers and system engineers. By mastering these tools and techniques, you'll be better equipped to diagnose and resolve issues at every level of the Android stack.

Remember: debugging is part science, part art. Practice, patience, and persistence are key to becoming proficient.

---

*This article is based on debugging techniques used in LineageOS and other custom Android ROM development.*
