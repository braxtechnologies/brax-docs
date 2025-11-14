# LineageOS for BraX3

LineageOS is a free and open-source operating system for smartphones, tablets, and set-top boxes, based on the Android mobile platform. This page provides information about LineageOS support for the BraX3 device.

---

## About the Project

LineageOS is the successor to CyanogenMod and one of the most popular custom Android ROMs. It provides a clean, near-stock Android experience with additional customization options and privacy features.

**Key Benefits:**
- Privacy-focused Android distribution
- Regular security updates
- Customizable user interface
- No Google services by default
- Large community support
- Extended device lifecycle support

---

## Program

**Status:** Community Build

LineageOS for BraX3 is currently maintained by the community. It is not an official LineageOS build but follows LineageOS guidelines and standards.

---

## Maintainer

**Current Maintainer:** Unassigned (seeking maintainer)

**Contact / Get involved:**
- Open an issue or PR in this docs repo to volunteer as maintainer
- Community Forum: https://community.braxtech.net/
- Optional: link your GitHub/XDA thread here once a device tree exists

Interested in becoming a maintainer? See the [How to Contribute](#how-to-contribute) section below.

---

## Build Version Official

**Official LineageOS Build:** Not available

The BraX3 device does not currently have official LineageOS builds. Official builds are only available for devices approved by the LineageOS team and listed on [lineageos.org/devices](https://lineageos.org/devices).

---

## Build Version Community

**Latest Community Build:** [Version to be added]

**Android Version:** [Version to be added]

**LineageOS Version:** [Version to be added]

**Download Link:** [To be added]

**Build Date:** [Date to be added]

**Changelog:** [Link to changelog to be added]

---

## Verified Boot Support

**Status:** AVB (Android Verified Boot) supported at the platform level. Behavior depends on bootloader state and the images you flash.

Verified Boot helps ensure only trusted, untampered images are loaded.

- AVB version: 2.x (typical for modern Android)
- Boot state when unlocked: Orange (verification warnings shown)
- Relocking requires a build with matching vbmeta and properly signed images; otherwise the device may fail to boot

Note: Community builds generally do not use OEM signing keys. Only relock if your LineageOS build explicitly documents relock support and provides a matching vbmeta.

---

## Bootloader Relocking Support

**Status:** Supported by the device, but only safe to use with builds that explicitly support relocking (matching vbmeta/signing).

Warning: Relocking on an incompatible build can brick the device.

- Relocking Supported: Yes (device capability)
- Requirements: Matching vbmeta and signed partitions for the ROM you flashed
- Risks: Boot verification failure on mismatch; full data wipe on relock
- Instructions (generic):
  ```bash
  fastboot flashing lock_critical
  fastboot flashing lock
  ```

Important: See the [Unlock/Relock Guide](../../../guide/posts/unlock-bootloader.md) for details and cautions.

---

## How to Install: SP Flash Tool

If you prefer SP Flash Tool (Windows), follow our detailed step-by-step guide:

- Guide: [Manual Install/Update OS → Install via spflash](../../../guide/posts/manual-install-update-os.md#install-via-spflash)
- Covers: choosing Download only vs Firmware upgrade, preserving user data, driver setup, and flashing steps

Notes:
- Use the LineageOS package that includes the SPFlash scatter/XML provided by the build maintainer
- Some builds may require Firmware upgrade (which wipes data)

---

## How to Install: Command Line

Use our fastboot-based method documented here:

- Guide: [Manual Install/Update OS → Install via fastboot](../../../guide/posts/manual-install-update-os.md#install-via-fastboot)
- Prereqs: unlocked bootloader, platform-tools installed
- Tip: to preserve user data during updates, follow the guide notes about removing `fastboot format userdata` from the script

Related:
- [Unlock/Relock Bootloader](../../../guide/posts/unlock-bootloader.md)

---

## How to Contribute

### Ways to Contribute

#### For Developers

1. **Bug Fixes and Features**
   - Fork the repository
   - Create a feature branch
   - Submit pull requests
   - Follow LineageOS coding guidelines

2. **Device Maintenance**
   - Test builds on actual hardware
   - Report bugs with detailed logs
   - Update device tree for new LineageOS versions

3. **Building**
   ```bash
   # Set up build environment
   repo init -u https://github.com/LineageOS/android.git -b lineage-21.0
   repo sync
   
   # Add device tree
   # [Device-specific instructions to be added]
   
   # Build
   source build/envsetup.sh
   breakfast brax3
   brunch brax3
   ```

#### For Non-Developers

1. **Testing & Bug Reports**
   - Test builds and report issues
   - Provide detailed bug reports with logs
   - Document reproducible steps

2. **Documentation**
   - Improve installation guides
   - Write tutorials
   - Translate documentation

3. **Community Support**
   - Help users on forums
   - Answer questions
   - Share experiences

### Resources

- [LineageOS Wiki](https://wiki.lineageos.org/)
- [LineageOS Gerrit](https://review.lineageos.org/)
- [Build Guide](https://wiki.lineageos.org/devices/)
- [Submitting Patches](https://wiki.lineageos.org/submitting-patch-howto.html)

---

## Usability

### What Works ✅

- [To be documented based on testing]

### What Doesn't Work ❌

- [To be documented based on testing]

### Partially Working ⚠️

- [To be documented based on testing]

### Performance

- **Boot Time:** [To be measured]
- **Battery Life:** [To be tested]
- **Stability:** [To be assessed]
- **Daily Driver Ready:** [Yes/No - to be determined]

---

## Known Issues

### Critical Issues 🔴

- [Issues to be documented]

### Major Issues 🟡

- [Issues to be documented]

### Minor Issues 🟢

- [Issues to be documented]

### Workarounds

- [Workarounds to be documented]

### Reporting Issues

When reporting issues, please include:

1. **Device Information**
   - Build version
   - Build date
   - Device variant (if applicable)

2. **Issue Description**
   - What you expected to happen
   - What actually happened
   - Steps to reproduce

3. **Logs**
   ```bash
   adb logcat > logcat.txt
   adb shell dmesg > dmesg.txt
   ```

---

## Additional Resources

- **Official LineageOS Website:** [lineageos.org](https://lineageos.org)
- **LineageOS Wiki:** [wiki.lineageos.org](https://wiki.lineageos.org)
- **XDA Forums:** [Link to be added]
- **GitHub Repository:** [Link to be added]
- **Community Chat:** [Link to be added]

---

## Support & Community

For support with LineageOS on BraX3:

- **Brax Community Forums:** [Link to be added]
- **GitHub Issues:** [Link to be added]
- **XDA Thread:** [Link to be added]

---

{% include alerts/warning.html content="Installing custom ROMs requires unlocking your bootloader, which may void your warranty and will erase all data on your device. Proceed at your own risk." %}

{% include alerts/note.html content="This is community-maintained software. While efforts are made to ensure stability, issues may occur. Always backup your data before installing." %}
