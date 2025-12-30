echo "Ubuntu Touch Flasher for BraX3" 
echo "Make sure adb & fastboot tools are installed and you are on Android"
echo "Make sure USB Debugging is enabled in Developer Options in Settings"
echo "Make sure bootloader is unlocked"
echo "Make sure you are on slot a, not b, if not please run fastboot --set-active=a or fastboot set_active a first"
echo "Waiting for device..."
adb devices
echo "Rebooting..."
adb reboot fastboot
echo "Start Flash"
fastboot flash system ubuntu.img
echo "Flashing some more partitions..."
fastboot reboot bootloader
fastboot flash boot_a boot.img
fastboot flash boot_b boot.img
fastboot flash init_boot_a init_boot.img
fastboot flash init_boot_b init_boot.img
echo "Flash done..."
echo "Formatting userdata type for UT"
fastboot -w
fastboot format:ext4 userdata
echo "Done.."
echo "Rebooting..."
fastboot reboot
echo "Flash done, Enjoy your all-new Ubuntu Touch now!"
