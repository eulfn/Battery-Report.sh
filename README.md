# 🔋 battery-report.sh

A snappy POSIX shell script for Android that prints a clean, detailed battery health report using only non-root commands. Works great in Termux, BusyBox, or any Android shell with `dumpsys`.

## What it does
- Reads battery info with `dumpsys battery`
- Parses and prints:
  - Battery Level (%)
  - Charging Status (Charging, Discharging, Full, etc.)
  - Power Source (USB, AC, Wireless, Unplugged)
  - Battery Temperature (°C)
  - Battery Voltage (V)
  - Battery Health (Good, Overheat, Dead, etc.)
  - Battery Technology (Li-ion, etc.)
- Formats output with a header and timestamp
- No root needed
- POSIX compatible (runs with `/bin/sh`)

## Usage
1. Copy `battery-report.sh` to your Android device.
2. Make it executable:
   ```sh
   chmod +x battery-report.sh
   ```
3. Run it in Termux or any shell:
   ```sh
   ./battery-report.sh
   ```

## Sample Output
```
🔋 Battery Health Report
-------------------------
Time: 2024-06-07 13:37:00

Level   : 87%
Status  : Charging
Source  : USB
Temp    : 32.1 °C
Volt    : 4.201 V
Health  : Good
Tech    : Li-ion
```

## Requirements
- Android device with `dumpsys` (usually present)
- POSIX shell (`/bin/sh`)
- `awk`, `grep`, `date`, `printf` (all standard in Termux/BusyBox)

## Notes
- No root required. Works on stock Android via Termux or similar.
- Output may vary depending on your device and Android version.
- If you get errors, make sure `dumpsys` is available and you have permission to run it.

---
Made for devs who like it short, sweet, and to the point. 