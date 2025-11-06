# How to Unlock the Bootloader of your BraX3

Unlocking your BraX3 bootloader gives you full access to the system and allows advanced operations like flashing custom ROMs, rooting, or performing deep-level maintenance. This guide will walk you through the official unlock method for BraX3.

{% include alerts/warning.html content="Unlocking the bootloader disables certain security features. While it gives advanced users full control of the device, it also increases the risk of security and data compromise. We recommend relocking the bootloader once you've completed the task that required unlocking it. Please note that locking or relocking your bootloader will erase all stored data on the device." %}

## Prerequisites

- Android Platform Tools downloaded and extracted to your Desktop folder.
- You have installed the latest MediaTek USB driver (Windows driver or Linux driver, depending on your Operating System)

## 1. Enable OEM Unlocking & USB debugging

1. Open **Settings** on your BraX3.
2. Tap **About phone**.
3. Tap **Build number** seven times.
4. You'll be prompted to enter your screen lock PIN, password, or pattern.
5. After unlocking, a message will appear: "You are now a developer!"
6. Go back to **Settings > System > Developer options**.
7. Scroll down and enable **OEM unlocking**.
8. Also enable **USB debugging**.

## 2. Unlocking the bootloader

1. Connect your BraX3 to your PC by using a reliable USB data cable.
2. Press **Allow** when you're prompted to Allow USB debugging.
3. Open the Command Prompt (press `Win + R`, type `cmd`, and hit Enter) for Windows or Open your Terminal for Linux.
4. Navigate to the Platform Tools folder using the following commands:

   **For Windows:**
   ```
   cd C:\Users\[Your Username]\Desktop\platform-tools-latest-windows\platform-tools
   ```
   
   **Tip:** You can get the path to your folder by clicking on the navigation bar in your file explorer.
   
   **For Linux:**
   ```
   cd ~/Desktop/platform-tools_r34.0.4-windows/platform-tools
   ```

5. Type `adb devices` and press enter.
   - If successful, you should see an identifier of your connected device, with the word "device" on its right.
   - If you see a device serial number and the word "unauthorized", make sure to click on **Allow** in the pop up on your BraX3.
   - Run `adb devices` one more time to confirm that your device is authorized (the word "device" should show up to the right of the serial number string).

6. Type `adb reboot bootloader` and press enter.
   - The phone will now reboot into fastboot mode (when you're in fastboot, you will see the "Brax" logo and a text "FASTBOOT MODE" at the bottom left of your screen).

7. Type `fastboot flashing unlock` in your terminal and press enter.
   - Within 3 seconds, press the **Volume Up** button on your BraX3 to confirm the unlock.

8. Type `fastboot flashing unlock_critical` in your terminal and press enter.
   - Within 3 seconds, press the **Volume Up** button on your BraX3 to confirm the unlock.

## Congratulations – Your Bootloader is Now Unlocked!

You can now flash custom ROMs, root your device, or perform other advanced operations. If you only needed to unlock temporarily, we recommend relocking the bootloader after you're done.

## Want to Relock the Bootloader?

To relock your bootloader, simply follow the same steps used for unlocking, but replace the command on step 7 with `fastboot flashing lock_critical` and Step 8 with `fastboot flashing lock`.

As with unlocking, you'll need to press the **Volume Up** button within 3 seconds on your BraX3 to confirm each action.

## Common Issues When Unlocking the Bootloader (and How to Fix Them)

Even though the unlock process may seem straightforward, a few things can still go wrong. Here are the most common problems users run into — and how to fix them:

### 1. Device Not Recognized by ADB or Fastboot

**Problem:** The `adb devices` or `fastboot devices` command doesn't detect your BraX3.

**Fix:**
- Ensure USB debugging is enabled in Developer Options (see step 1).
- Make sure you're using a high-quality USB data cable — not just a charging cable.
- Try switching USB ports, especially using USB 2.0 instead of 3.0.
- Reinstall or update your Mediatek USB drivers on your PC.
