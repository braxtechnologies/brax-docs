---
date: 2025-01-08
authors:
  - brax-team
categories:
  - Engineering
  - Hardware
  - Security
tags:
  - qualcomm
  - bootloader
  - security
  - firmware
  - trustzone
---

# Qualcomm's Chain of Trust

Understanding Qualcomm's boot sequence, security mechanisms, and how bootloaders work together to secure modern Android devices.

<!-- more -->

## Glossary

- **Bootloader**: A general term for a link in the boot-chain that has a specific job that is run each cold-boot
- **Cold-boot**: Fresh boot from powered off state
- **QFUSE**: Microscopic hardware fuse that is integrated into the SoC - Once physically blown, impossible to reset or replace
- **SoC**: System-on-chip (your phone's "motherboard" of sorts)
- **EFUSE**: Software based fuse whose data is stored in QFPROM
- **QFPROM**: Qualcomm's fuse region
- **TrustZone**: Qualcomm ARM chipset's "Secure World" implementation
- **QSEECOM**: A Linux kernel driver that lets us communicate with TrustZone, and issue an SCM call to TrustZone to do things like blow fuses. It only will allow signed applets and approved calls to be made
- **SCM**: Secure Channel Manager (note: not related to Linux's SMC calls)
- **DTB**: Device Tree Blob. Its purpose is to "provide a way to describe non-discoverable hardware" to Linux
- **Android Verified Boot (AVB)**: A strict set of checks implemented at the aboot/ABL level to verify the integrity of various parts of the operating system
- **DM-Verity**: A component of Android Verified Boot that checks partitions to see if they have been mounted read/write before
- **system_as_root**: A new mount setup logic for Android that mounts the system partition as '/' as opposed to '/system'. This means that system files now live at '/system/system'

## Introduction

The Qualcomm chain of trust is a complex, yet straightforward to understand set of processes. Many of you have likely heard the term "bootloader" but have no clue what it actually is, or does. In today's post, we'll cover how Qualcomm's boot sequence works and the security mechanisms that protect modern Android devices.

## What is a Bootloader?

A bootloader by definition is a program that loads an operating system, or chain-loads another bootloader when a device is turned on. In modern smartphones, the boot process involves multiple bootloaders, each with specific responsibilities and security checks.

## Qualcomm's Boot Chain

Qualcomm devices use fuse-based logic to dictate permanent feature configurations and cryptographic key sets. The physical version is called a **QFUSE**, stored in a region on the SoC called **QFPROM** in rows.

### The Boot Sequence

#### 1. PBL (Primary Bootloader)

If the QFUSE row labeled "Qualcomm Secure Boot" is blown (which it is on most non-Chinese/OnePlus devices), the boot process begins:

- **PBL** is loaded from **BootROM** (non-writable storage on the SoC)
- PBL verifies and loads into memory
- Brings up minimal hardware
- Verifies the signature of the next bootloader
- Loads and executes the next stage

**Important**: PBL is built and distributed on the SoC by Qualcomm themselves and very rarely sees public exploits.

#### 2. SBL*/XBL (Secondary/eXtensible Bootloader)

These early bootloaders are responsible for:

- Bringing up core hardware (CPU cores, MMU, etc.)
- Initializing **TrustZone** (Qualcomm's Secure World)
- Verifying the signature of aboot/ABL
- Loading and executing aboot/ABL

**Evolution**: Modern devices use XBL (eXtensible Bootloader), which replaced the older SBL chain with better security.

#### 3. Aboot/ABL (Android Bootloader)

This is what most users refer to as "bootloader mode." Aboot/ABL:

- Houses **fastboot** and OEM firmware flashing tools
- Brings up remaining core hardware
- Verifies the boot image signature
- Reports verity status through **dm-verity**
- Loads kernel/ramdisk/DTB into memory

**Key Feature**: Aboot/ABL can be configured to skip cryptographic signature checks (when "unlocked"), allowing custom kernels and ROMs.

#### 4. Kernel & Ramdisk

After aboot loads everything into memory:

- The Linux kernel unpacks the ramdisk
- In **system_as_root** configurations, the system partition is verified and mounted at '/'
- **Init** is executed, bringing up Android

## Bootloader Lock Status

### Locked Devices

When a device is "locked":

- Aboot enforces digital signature integrity checks on the boot image
- Enforces "Green" Android Verified Boot status
- Users cannot flash partitions
- Cannot boot custom unsigned kernels
- AVB reports "Green" for secure devices or "Red" for insecure (preventing boot)

### Unlocked Devices

When a device is "unlocked":

- Aboot allows flashing partitions
- Some OEMs allow booting unsigned images from memory (`fastboot boot`)
- AVB reports "Orange" or "Red" but allows booting to continue

## Evolution of the Chain of Trust

The Qualcomm chain of trust has grown immensely in security over the last decade:

### Pre-2013 Era
- Basic boot chain with minimal verification
- Multiple SBL stages
- Early implementation of secure boot

### 2013-2016 Era
- Condensed attack surface
- Secondary Bootloader (SBL) chain merged into unified SBL
- Introduction of TrustZone enhancements
- Better cryptographic verification

### Modern Era (2016-2018+)
- **SBL replaced with XBL** (eXtensible Bootloader) - mitigating many security issues
- **Aboot evolved to ABL** (Android Bootloader) - fully proprietary solution
- **UEFI support** and enhanced security features
- **system_as_root** implementation for better verification
- Android ramdisk moved to system partition for dm-verity verification

**Note**: The seamless "A/B" update system is separate from system_as_root, though they're commonly seen together. OEMs can implement one without the other.

## TrustZone: The Secure World

TrustZone is Qualcomm's implementation of ARM's security architecture, providing:

- Isolated execution environment
- Secure key storage
- Cryptographic operations
- Protected from normal OS compromise

Communication with TrustZone happens through:
- **QSEECOM**: Kernel driver for TrustZone communication
- **SCM**: Secure Channel Manager for secure calls
- Only signed applets and approved calls are allowed

## OEM Customizations

Many OEMs implement additional security measures or unlock mechanisms:

### Samsung
- Uses eMMC CID/hashed blob in aboot to dictate developer (unlock) status
- **KNOX QFUSE**: Blown on any intrusion, can wipe device if triggered
- Proprietary **Download mode** for firmware flashing

### Motorola
- Uses a single QFUSE that must be blown to unlock
- Permanently voids warranty when unlocked
- Extended fastboot protocol for sparse-chunked system images

### Sony
- Uses cryptographic blob and bit set on "TA" partition for unlock

### LG
- Proprietary **LAF (Download) mode** for firmware flashing
- History of security vulnerabilities in LAF mode

### Google
- Open-source Fastboot mode for firmware flashing
- More transparent implementation

## Security Considerations

### Advantages of OEM Customizations
- Advanced features (like sparse-chunked flashing)
- OEM-specific tools and utilities
- Enhanced security measures

### Risks
- Potential security vulnerabilities (e.g., LG LAF exploits)
- **SamDunk vulnerability** used Samsung's CID method to unlock non-unlockable devices
- Proprietary implementations may have unforeseen issues

### Qualcomm's Role
- **PBL** is built by Qualcomm and very secure
- Public exploits are rare due to Qualcomm's Bug Bounty Program
- Notable exception: Aleph Security's **EDL** (Emergency Download Mode) vulnerabilities

## Android Verified Boot (AVB)

AVB provides strict integrity checks:

### DM-Verity
- Checks if partitions have been mounted read/write
- Verifies partition integrity before mounting
- Reports status to bootloader

### system_as_root
- System partition mounted as '/' instead of '/system'
- Allows dm-verity verification of root filesystem
- Android ramdisk stored on system partition
- Improves security and architecture

### Boot States
- **Green**: Device is secure and unmodified
- **Orange**: Device is unlocked but booting signed images
- **Red**: Device is booting unsigned/modified images
- **Yellow**: Device uses custom root of trust

## Practical Implications

### For Users
- **Unlocking** enables custom ROMs but may void warranty
- Some devices require blowing fuses (permanent)
- Security features may be disabled when unlocked
- Some banking/payment apps may not work on unlocked devices

### For Developers
- Understanding boot chain is crucial for ROM development
- Must work within constraints of locked vs unlocked devices
- Need to consider AVB and dm-verity in custom ROMs
- Different OEMs require different approaches

### For Security
- Chain of trust prevents unauthorized system modifications
- TrustZone provides hardware-backed security
- Multiple verification layers protect against attacks
- Even root compromise doesn't bypass bootloader security

## Best Practices

1. **Understand Your Device**: Different OEMs implement security differently
2. **Backup Before Unlocking**: Unlocking often wipes data
3. **Consider Warranty**: Unlocking may void warranty permanently
4. **Security Trade-offs**: Unlocked devices have reduced security
5. **Keep Firmware Updated**: Security patches address vulnerabilities

## Common Issues

### Unable to Unlock Bootloader
- Check if OEM allows unlocking
- Some carriers lock bootloaders
- Some devices require special procedures

### Device Won't Boot After Unlocking
- AVB may be enforcing checks
- May need to disable dm-verity
- Check for proper signing of boot images

### Lost DRM Keys
- Some OEMs (Sony, some Xiaomi) lose DRM keys on unlock
- Affects camera quality, DRM content playback
- Usually irreversible

## Conclusion

Qualcomm's chain of trust represents a sophisticated security architecture that has evolved significantly over the past decade. Understanding how PBL, SBL/XBL, aboot/ABL, and TrustZone work together provides crucial insight into Android device security.

Key takeaways:
- Multiple bootloader stages each verify the next
- Hardware fuses provide permanent security configurations
- TrustZone creates an isolated secure environment
- OEM customizations add both features and complexity
- Modern implementations are significantly more secure than earlier versions

Whether you're a developer working on custom ROMs, a security researcher, or simply an enthusiast wanting to understand your device better, knowledge of the boot chain is fundamental to working with Android devices.

## Further Reading

- [Android Verified Boot Documentation](https://source.android.com/security/verifiedboot)
- [ARM TrustZone Documentation](https://developer.arm.com/ip-products/security-ip/trustzone)
- [Qualcomm Security Resources](https://www.qualcomm.com/products/technology/mobile-security)
- [Aleph Security's EDL Research](https://alephsecurity.com/vulns/aleph-2018025)

---

*This article is based on boot chain analysis from LineageOS and AOSP development.*
