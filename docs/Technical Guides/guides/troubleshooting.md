---
title: How to troubleshoot your Brax device
---

!!! warning
    In most cases, issues are caused by software, configuration or apps rather than failed hardware. Working through software troubleshooting first helps avoid unnecessary disassembly and saves time, shipping costs and spare parts.

!!! note "Applies to all Brax devices"
    This guide applies to all Brax devices. Where a step or key combination differs for a specific model (for example BraX3), the model is called out explicitly.

This page focuses on **troubleshooting** your Brax device before you open the device or start a warranty claim. Often, software tools and built in diagnostics can identify whether a problem is caused by configuration, apps or hardware.

!!! info
    Use the checks below to gather evidence and narrow down the issue. This will make any later repair or support request faster and more accurate.

## Recovery mode and safe boot options

Recovery and bootloader modes are your first line of defense when the phone does not start normally.

- From power off, **hold the Power button and Volume Up key together** to enter **recovery mode**.

In recovery you can perform actions such as:

- Navigating the menu with the volume keys and confirming with the power button
- Clearing cache or temporary data (where supported)
- Performing a **factory reset** after backing up important data

From recovery or with other key combinations documented for your operating system you can enter **bootloader / fastboot** mode, where you can check whether the device is detected by a computer and, if needed, reflash a known good operating system build.

If the phone can still enter recovery or bootloader, there is a good chance the underlying hardware is intact and the problem is software related.

## Phone information and basic diagnostics

Android exposes a built in diagnostic menu that can help validate radios and basic device status.

1. Open the Phone app.
2. Dial `*#*#4636#*#*`.
3. The **Testing** menu opens automatically.

From here you can typically see:

- **Phone information** - network type, signal strength, radio status and preferred network mode.
- **Wi-Fi information** - access to Wi-Fi API, current Wi-Fi configuration and Wi-Fi status views that help diagnose wireless issues.
- **Usage statistics** - app usage patterns that may explain performance or battery drain.

If mobile connectivity problems occur, this menu helps confirm whether the modem is registered on the network and whether radio settings look correct before assuming a hardware fault.

## Other useful tools

Depending on the operating system you use on your Brax device, you may also have access to:

- **Built in hardware test apps** that can check display, touch, sensors, cameras, speakers and microphones.
- **Safe mode** boot, which temporarily disables third party apps so you can see if an issue is caused by installed software.
- **Storage and memory overviews** in Settings that show whether low free space or background apps are contributing to slowdowns or instability.

Consult your OS specific documentation for the exact steps to access these tools.

## When to collect logs

If troubleshooting tools suggest a software or driver problem, collect logs before making major changes or reflashing:

- Enable developer options and USB debugging in your current OS.
- Install the Android platform tools on a computer.
- Capture logs while reproducing the issue, for example:

```bash
adb logcat > logcat.txt
adb shell dmesg > dmesg.txt
```

Attach these files when contacting Brax support or posting on the community forums. They help distinguish between software bugs and true hardware defects.

## When to move to repair or warranty

If, after using recovery, the testing menu and other diagnostics:

- The device still cannot boot a clean OS,
- Radios or sensors fail consistently across different operating systems, or
- Obvious physical damage is present,

then a **hardware repair or warranty evaluation** may be appropriate.

In that case, keep any notes from your troubleshooting steps, they are valuable for technicians and for validating warranty claims.
