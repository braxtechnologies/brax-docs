---
title: How to change the IMEI
---

!!! note "Applies to all Brax devices"
    This guide applies across the Brax lineup. Where steps or files are model specific, we call them out explicitly so you can follow the correct procedure for your device.

!!! info "Model specific notes"
    The database file names and tool settings below are for BraX3 (MediaTek Dimensity 6300). For a different model, use the correct AP and MD database files for that device.

**Important**: This procedure is advanced and uses third party tools that are **not** developed or supported by Brax Technologies. Proceed only if you fully understand the risks and legal implications.

This guide summarizes how to change the IMEI numbers on your Brax device using the **MediaTek SN Writer** tool on Windows. It is intended for legitimate troubleshooting use cases, such as restoring the original IMEI after it has been lost during flashing.

## Legal and responsibility notice

- IMEI related rules vary by country. You are responsible for understanding and complying with **local laws and regulations**.
- This guide is **not** intended to help anyone evade laws or engage in unlawful activity.
- The software described here is third party software. Any risk or liability related to its use lies solely with the **tool developers** and **you as the end user**.

Only perform these steps on a Brax device that you own or are explicitly authorized to service.

## What you need

On a Windows PC (32 bit or 64 bit):

1. **MediaTek USB drivers** installed.
2. The **AP-DB package for your model** (AP and MD database files) from the official community download.
3. The **MediaTek SN Writer** tool (latest recommended version).
4. A USB cable to connect the device.

Make sure your device has enough battery charge before starting.

## Configure SN Writer (model specifics)

1. Extract the SN Writer archive and run `SN_Writer.exe`.
2. In the **ComPort** dropdown select **USB VCOM**.
3. In the **Target Type** dropdown select **Smart Phone**.
4. Click **System Config** and in the dialog:
   - In **Write Option**, check **IMEI**.
   - In **IMEI Option**, check **IMEI CheckSum** and **Dual IMEI**.
5. In **Database File Option**:
- Click **AP_DB** and select `APDB_MT6835___W2421` from your model's AP-DB package.
   - Click **MD1_DB** and select `MDDB_MT6835_S00_MOLY_NR17_R1_MP3_RC_MP_V19_10_P3` from the same package.
6. Click **Save** to close the configuration dialog.

## Write the IMEI numbers

1. Back in the main SN Writer window, click **Start**.
2. In the **Data** dialog, enter:
   - `IMEI_1` – the 15 digit IMEI for SIM slot 1.
   - `IMEI_2` – the 15 digit IMEI for SIM slot 2.
3. Double check that:
   - each IMEI is exactly **15 digits** (numbers only), and
   - `IMEI_1` and `IMEI_2` are **not identical**.
4. Click **OK**.
5. Power **off** your device completely.
6. With the phone powered off, connect it to the PC via USB.

SN Writer will search for the device, switch it into the required Meta mode and, if successful, write the IMEI values. When the process completes you should see a **green PASS** message.

## Verify the result

1. Disconnect the phone and boot it normally.
2. Open **Settings → About phone**.
3. Confirm that **IMEI (SIM slot 1)** and **IMEI (SIM slot 2)** show the expected values.

If the IMEI fields are still empty or unchanged, review the common issues section below.

## Common issues and fixes

### 1. Device not detected / Meta mode problems

**Symptom:** SN Writer stays on "Start searching kernel com port and handshake" or reports that the target is not detected.

**Checks:**

- Ensure the **MediaTek USB drivers** are correctly installed and, after installation, restart the PC.
- Confirm that the phone is **powered off** before connecting.
- Always click **Start** in SN Writer **before** plugging in the phone.
- If Meta mode does not trigger, try holding **Volume Down** or **Volume Up** while connecting the USB cable.

### 2. Wrong or missing database files

**Symptom:** SN Writer fails early or throws errors related to database / load files.

**Fix:**

- Use the **exact** AP and MD database files provided for your model in the AP-DB package.
- Re open **System Config** and re select:
  - `APDB_MT6835___W2421` for **AP_DB**, and
  - `MDDB_MT6835_S00_MOLY_NR17_R1_MP3_RC_MP_V19_10_P3` for **MD1_DB**.

### 3. Invalid IMEI format

**Symptom:** The write operation fails immediately after entering the IMEI values.

**Fix:**

- Each IMEI must be exactly **15 numeric digits**.
- Do not include spaces, dashes or any other characters.
- `IMEI_1` and `IMEI_2` must be **different**.

### 4. Generic SN Writer errors

If you still get errors (for example "IMEI write fail" or other generic messages):

- Reboot both the **PC** and the **device**, then repeat the steps carefully.
- Try another USB port and, if possible, a different USB cable.
- Check the SN Writer log files in the application directory for more detailed error codes.

If repeated attempts fail, stop and ask for help on the Brax community forums or from a qualified technician rather than guessing settings.
