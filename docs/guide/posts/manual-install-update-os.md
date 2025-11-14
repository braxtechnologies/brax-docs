# 💾 How to Manually Install or Update Your OS on Your BraX3

<div style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); padding: 1.75rem; border-radius: 10px; margin-bottom: 1.5rem; color: white;">
  <h2 style="color: white; margin: 0 0 .5rem 0;">Complete control over your device's operating system</h2>
  <p style="margin: 0; opacity: .95;">Step-by-step instructions for manually installing or updating your OS using fastboot or spflash tool.</p>
</div>

!!! danger "Critical Warning"
    Manually flashing or updating the OS may brick your device, rendering it unusable. By proceeding, you accept full responsibility for any risks involved, including potential data loss or hardware malfunction.
    
    **Back up your data before proceeding!**

## 🔧 Two Installation Methods

<div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 1.5rem; margin-bottom: 2rem;">

<div style="background: #e3f2fd; padding: 1.5rem; border-radius: 8px; border-left: 4px solid #1976d2;">
  <h3 style="color: #1565c0; margin-top: 0;">⚡ Method 1: Fastboot</h3>
  <p style="line-height: 1.6; margin-bottom: 0;">
    <strong>Pros:</strong> Works on all platforms (Windows, Linux, macOS)<br>
    <strong>Cons:</strong> Erases all user data<br>
    <strong>Requires:</strong> Unlocked bootloader
  </p>
</div>

<div style="background: #e8f5e9; padding: 1.5rem; border-radius: 8px; border-left: 4px solid #4caf50;">
  <h3 style="color: #2e7d32; margin-top: 0;">💾 Method 2: SPFlash Tool</h3>
  <p style="line-height: 1.6; margin-bottom: 0;">
    <strong>Pros:</strong> Can preserve user data<br>
    <strong>Cons:</strong> Windows only, more complex<br>
    <strong>Requires:</strong> MediaTek USB drivers
  </p>
</div>

</div>

## ✅ Prerequisites

<div style="background: #fff8e1; padding: 1.5rem; border-left: 4px solid #ff9800; border-radius: 6px; margin-bottom: 2rem;">
  <p style="margin: 0; line-height: 1.8;">
    Before you begin, make sure you have:
  </p>
  <ul style="margin: .5rem 0 0 1.5rem; line-height: 1.8;">
    <li>BraX3 charged to at least <strong>35%</strong></li>
    <li>Latest <strong>MediaTek USB driver</strong> installed</li>
    <li><strong>Reliable USB data cable</strong> (not just charging cable)</li>
    <li>Downloaded <strong>OS package installer</strong> for your chosen OS</li>
  </ul>
</div>

## Install via spflash

Installing via spflash holds some advantages over installing via fastboot, mainly the possibility to not erase userdata, possible since the bootloader can be locked when using spflash.

Before you start, you need to ensure the following:
- You've installed the spflash tool (by MediaTek). [Link here](https://spflashtool.com/)

### How to Install the OS on Windows

1. Open the **SPFlashToolV6** application located in the folder where your spflash is downloaded.

2. Add the **Download-XML** file, by pressing on the **choose** button (next to Download-XML), and selecting the `flash.xml` typically located in the `download_agent` folder in the OS installation package you've downloaded.

3. Next step provides several options, which will determine whether your user data will get deleted or not.

   **Option 1**: Select **Download only** and deselect user data.
   - By choosing this option, you will keep the userdata already stored on the device.
   - Please note that some OS versions do not allow the Download only option, as they require a firmware update, which will lead to erasing user data.
   - If a firmware upgrade is required, select **Firmware upgrade** from the dropdown and press **Download**. Once ready, you can then select **Download** from the dropdown and continue with the next steps.

   **Option 2**: Select **Format All + Download**.
   - By choosing this option, you will reformat the device while installing the latest version.
   - Note that deselecting userdata will not be an option when Format All + Download is selected, meaning you will be deleting your user data.
   - **Important**: If you select Format All + Download, you will also wipe the device's IMEI and serial number. Make sure you take a note of those before you start the installation process, as you may need to insert them later on in order to receive mobile connectivity from your telco operator.

4. Press **download**.

5. Turn your BraX3 device **off**.

6. Plug in your BraX3 device via USB cable.

7. Once plugged, the process of flashing the OS will start. The process usually takes 2-3 minutes.

8. When completed, you will see an indication that the process has finished successfully.

### Congratulations – Your OS is now installed/updated!

You can now reboot your phone and enjoy the version you've installed.

## Install via fastboot

Before you start, you need to ensure the following:
- Your BraX3 has an unlocked bootloader ([see how to unlock your BraX3 bootloader](unlock-bootloader.md))
- Android Platform Tools downloaded and extracted to your Desktop folder

### Steps

1. **Download** the latest OS installation package.

2. **Unarchive** the installation package file.

3. **Copy** all the Disc Image Files and `.bin` file from the installation package folder (see step 2) and paste them in the `platform-tools` folder (where your Android Platform Tools have been saved).

4. **Copy** the `flash.sh` file and paste it in the `platform-tools` folder (where your Android Platform Tools have been saved).

5. **For Windows users**: Edit the `flash.sh` file and remove `#!/bin/bash` comment, as well as any other comments in the file (comments start with "#"). Save the file after you're done. At the end, rename the file to `flash.bat` so it changes its type to Windows Batch File.

   !!! tip "Preserve User Data"
       If you're updating your OS and don't want to wipe your user data, remove the command `fastboot format userdata` from your flash.bat or flash.sh file. That way your user data, including your installed apps, files, images, etc. will be preserved.

6. **Connect** your BraX3 to your PC by using a reliable USB data cable.

7. Press **Allow** when you're prompted to Allow USB debugging.

8. **Open the Command Prompt** (press `Win + R`, type `cmd`, and hit Enter) for Windows or Open your Terminal for Linux.

9. **Navigate** to the Platform Tools folder using the following commands:

   **For Windows:**
   ```
   cd C:\Users\[Your Username]\Desktop\platform-tools-latest-windows\platform-tools
   ```
   
   **Tip:** You can get the path to your folder by clicking on the navigation bar in your file explorer.
   
   **For Linux:**
   ```
   cd ~/Desktop/platform-tools_r34.0.4-windows/platform-tools
   ```

10. Type `adb devices` and press enter.
    - If successful, you should see an identifier of your connected device, with the word "device" on its right.

11. Type `adb reboot bootloader` and press enter.
    - The phone will now reboot into fastboot mode (when you're in fastboot, you will see the "Brax" logo and a text "FASTBOOT MODE" at the bottom left of your screen).

12. On your PC, open your `platform-tools` folder and double click the `flash.bat` file (for Windows) or `flash.sh` file (for Linux).

13. The installation of the OS will now commence. You will see the installation progress on your terminal.

14. Once completed, unplug your device from the USB and hold the power button.

### Congratulations – Your OS is now installed/updated!

## Common Issues When Installing the OS via Fastboot (and How to Fix Them)

If you're running into problems while installing the OS on your BraX3, you're not alone. Here are the most common issues users encounter — and how to solve them quickly.

### Device Not Detected by ADB or Fastboot

**Problem:** Running `adb devices` or `fastboot devices` returns nothing, or just says "unauthorized".

**Fix:**
- Make sure USB debugging is enabled on your BraX3
- Tap **Allow** when prompted with "Allow USB debugging"
- Reconnect the USB cable and try a different port (preferably USB 2.0)
- Use a data-capable cable, not just a charging cable
- Try restarting both your phone and PC
- Reinstall or update the MediaTek USB drivers

### "Command not found" or Unrecognized Command in Command Prompt

**Problem:** Commands like `adb` or `fastboot` aren't recognized in Command Prompt.

**Fix:**
- Make sure you're in the correct folder: the one that contains `adb.exe` and `fastboot.exe`
- Use the `cd` command exactly as shown in the guide, and verify the path
- Alternatively, drag the platform-tools folder into your Command Prompt window to autofill the path
- Use `.\adb` or `.\fastboot` if Windows doesn't recognize the command alone

### Nothing Happens When Running flash.bat (Windows only)

**Problem:** You double-click the `flash.bat` file but the installer doesn't run or closes immediately.

**Fix:**
- Double-check that you followed step 5 correctly:
  - Removed the `#!/bin/bash` line and other comments starting with `#`
  - Saved the file as `flash.bat`, not `flash.sh` or `flash.bat.txt`
- Right-click the file and select "Run as Administrator"
- Ensure all the Disc Image Files were correctly copied into the platform-tools folder

### Installation Fails or Freezes Midway

**Problem:** The flashing process starts but fails midway, or appears to freeze with no progress.

**Fix:**
- Confirm that all required files were copied into the platform-tools folder (not just flash.bat)
- Try using a different USB cable and/or port
- Do not use USB hubs or adapters; plug directly into your computer
- Restart the process and make sure the device is in Fastboot mode (you should see "FASTBOOT MODE" at the bottom left)

### Device Boots to Old OS After Flashing

**Problem:** After the flash completes, the device boots into the old operating system or doesn't reflect changes.

**Fix:**
- Make sure the flashing process actually completed successfully
- Verify you downloaded the correct OS package for your device
- Try performing a factory reset from recovery mode after flashing
- Ensure the bootloader is unlocked if required for the OS you're installing
