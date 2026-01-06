# How to Unlock the Bootloader of Your Brax Device

Unlocking your Brax device bootloader gives you full access to the system and allows advanced operations like flashing custom ROMs, rooting, or performing deep level maintenance. This guide walks through the standard approach used on Brax devices.

!!! warning "Security Warning"
    Unlocking the bootloader disables certain security features. While it gives advanced users full control of the device, it also increases the risk of security and data compromise. We recommend relocking the bootloader once you've completed the task that required unlocking it. 
    
**Please note:** Locking or relocking your bootloader will erase all stored data on the device.

!!! note "Applies to all Brax devices"
    This guide applies to all Brax devices. Where a step or confirmation differs for a specific model, we call it out explicitly.

!!! warning "Model note: BraX3 OTAs"
    Due to a known Mediatek firmware issue, unlocking the bootloader can break over-the-air (OTA) update installs (slot b becomes unusable). If you keep the bootloader unlocked, plan to update by flashing full stock firmware (for example via SP Flash Tool) instead of OTA. If you want OTA updates to work, keep the bootloader locked.

## Prerequisites

- [Android Platform Tools](./Tools%20%26%20Resources.md) downloaded and extracted to your Desktop folder.
- You have installed the latest MediaTek USB driver (Windows: MediaTek-SP-Driver-v5.2307.zip) or the appropriate Linux driver

!!! info
    All tools and resources are available on our [Tools & Resources](./Tools%20%26%20Resources.md) page.


## 1. Enable OEM Unlocking & USB debugging

1. Open **Settings** on your device.
2. Tap **About phone**.
3. Tap **Build number** seven times.
4. You'll be prompted to enter your screen lock PIN, password, or pattern.
5. After unlocking, a message will appear: "You are now a developer!"
6. Go back to **Settings > System > Developer options**.
7. Scroll down and enable **OEM unlocking**.
8. Also enable **USB debugging**.

## 2. Unlocking the bootloader

1. Connect your device to your PC by using a reliable USB data cable.
2. Press **Allow** when you're prompted to Allow USB debugging.
3. Open the Command Prompt (press `Win + R`, type `cmd`, and hit Enter) for Windows or Open your Terminal for Linux.
4. Navigate to the Platform Tools folder using the following cd command.
5. Type `adb devices` and press enter. If successful, you should see an identifier of your connected device, with the word "device" on its right. If you see a device serial number and the word "unauthorized", make sure to tap **Allow** on the device.

6. Type `adb reboot bootloader` and press enter.
- The phone will now reboot into fastboot mode (you should see a "FASTBOOT MODE" indicator on screen).

7. Type `fastboot flashing unlock` in your terminal and press enter.
- Within 3 seconds, press the **Volume Up** button on the device to confirm the unlock.

8. Type `fastboot flashing unlock_critical` in your terminal and press enter.
- Within 3 seconds, press the **Volume Up** button on the device to confirm the unlock.

## Congratulations – Your Bootloader is Now Unlocked!

You can now flash custom ROMs, root your device, or perform other advanced operations. If you only needed to unlock temporarily, we recommend relocking the bootloader after you're done.

## Want to Relock the Bootloader?

To relock your bootloader, simply follow the same steps used for unlocking, but replace the command on step 7 with `fastboot flashing lock_critical` and Step 8 with `fastboot flashing lock`.

As with unlocking, you'll need to press the **Volume Up** button within 3 seconds on the device to confirm each action.

## Common Issues When Unlocking the Bootloader (and How to Fix Them)

Even though the unlock process may seem straightforward, a few things can still go wrong. Here are the most common problems users run into - and how to fix them:

**1. Device Not Recognized by ADB or Fastboot**

**Problem:** The `adb devices` or `fastboot devices` command doesn't detect your device.

**Fix:**
- Ensure USB debugging is enabled in Developer Options (see step 1).
- Make sure you're using a high-quality USB data cable - not just a charging cable.
- Try switching USB ports, especially using USB 2.0 instead of 3.0.
- Reinstall or update your Mediatek USB drivers on your PC.

**2. "Waiting for device" in Fastboot Mode**

**Problem:** Fastboot commands hang and display "waiting for device".

**Fix:**
- Use official Mediatek USB drivers (or reinstall them).
- Make sure your device is properly in Fastboot mode (black screen with FASTBOOT MODE text in lower left corner).
- Some systems require admin privileges - try running the Command Prompt as Administrator.

**3. Didn't Press Volume Up in Time**

**Problem:** You missed the 3-second confirmation window after running the `fastboot flashing unlock` or `unlock_critical` command.

**Fix:**
- Re-run the command and be ready to press the Volume Up button quickly.
- If the device reboots before you can respond, repeat the fastboot command.

**4. Bootloader Unlock Options Not Available**

**Problem:** The device doesn't show the option to unlock even after sending the command.

**Fix:** Double-check that OEM unlocking is enabled in Developer Options.

**5. Command Not Recognized**

**Problem:** You see an error like `'adb' is not recognized as an internal or external command`.

**Fix:** Ensure you're in the correct directory - where the `platform-tools` folder is located.

**6. Stuck in Bootloop After Unlock**

**Problem:** After unlocking, the device doesn't boot properly or loops at the startup screen.

**Fix:**
- This is rare, but if it happens, try entering recovery mode and doing a factory reset.
- If that doesn't work, you may need to flash stock firmware using SP Flash Tool or a similar utility.
