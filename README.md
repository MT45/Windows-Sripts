# Windows-Sripts
Scripts I have made overtime for windows and automations

# Windows Utility & Automation Scripts

A collection of **batch scripts** and **Windows commands** to automate activation, privacy tweaks, application installation, power configuration, and system customization.

---

## ➤ Contents

* Script Descriptions
* Application Installation Scripts
* Power & CPU Management
* Windows Commands & Tweaks
* Defender & Privacy Notes
* Cosmetic / Optional Tweaks

---

## ➤ Script Descriptions

### ▸ Activation Scripts

1. **Activator - Microsoft Office LTSC Professional Plus 2024.bat**
   ➣ Activates Office LTSC Professional Plus 2024

2. **Activator - Windows 10｜11.bat**
   ➣ Activates Windows 10 or Windows 11

---

### ▸ Configuration Scripts

3. **Config-MSI-Afterburner.bat**
   ➣ Configures MSI Afterburner
   ➣ Fan curves, auto-start, and general setup

---

### ▸ Privacy & Debloat Scripts

4. **Disable Privacy - with apps and office.bat**
   ➣ Disables Windows tracking
   ➣ Installs Firefox, MSI Afterburner, Discord, and Office 2024

5. **Disable Privacy - with only install_apps.bat**
   ➣ Disables Windows tracking
   ➣ Installs Firefox, MSI Afterburner, and Discord

6. **Disable Privacy - with only install_office.bat**
   ➣ Disables Windows tracking
   ➣ Installs Office 2024

7. **Disable Privacy - with only vivaldi.bat**

8. **Disable Privacy.bat**
   ➣ Disables Windows tracking only

---

## ➤ Application Installation Scripts

9. **Installing 7-Zip, Steam, Cursor, VLC, Powertoys, Photos, Snip.bat**

10. **Installing MSI, Discord, 7-Zip, Steam, VLC, Powertoys, Photos, Snip.bat**

11. **Installing Firefox, MSI Afterburner, Discord, 7-Zip, Steam, Kdenlive, OBS, Cursor, VLC, Powertoys, Photos, Snip & Sketch, Minecraft.bat**

12. **Installing Vivaldi, MSI Afterburner, Discord, 7-Zip, Steam, Kdenlive, OBS, G Hub, Cursor, VLC, Powertoys, Photos, Snip, Minecraft.bat**

13. **Installing Vivaldi, MSI, Discord, 7-Zip, Steam, Cursor, VLC, Powertoys, Photos, Snip.bat**

---

## ➤ Power & CPU Management

14. **Laptop_CPU Clock.bat**
    ➣ Creates two power plans:
    ▸ Limited CPU (~2.00 GHz)
    ▸ Full performance
    ➣ Desktop shortcuts to switch plans instantly

15. **Office-2024-config-creator.bat**
    ➣ Creates `Configuration2024.xml` in `C:\Office`
    ➣ Installs:
    ▸ Office Pro Plus 2024
    ▸ Visio Pro 2024
    ▸ Project Pro 2024

16. **PC_CPU Clock.bat**
    ➣ Creates two power plans:
    ▸ Limited CPU (~3.00 GHz)
    ▸ Full performance
    ➣ Desktop shortcuts included

17. **Sleep Shortcut**
    ➣ One-click shortcut to put the PC into sleep mode

---

## ➤ Miscellaneous

18. **test anything.bat**
    ➣ Draft / testing file

19. **Windows-Defender.bat**
    ➣ Disables Windows Defender

20. **Winget - BitsTransfer.bat**
    ➣ Downloads Winget via BitsTransfer (no longer works)

21. **Winget - Invoke-WebRequest.bat**
    ➣ Downloads Winget via Invoke-WebRequest (no longer works)

---

## ➤ Windows Commands

### ▸ Run in Terminal

Add **Ultimate Performance** power plan:

```
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
```

➣ Ensures CPU can reach factory boost clocks

---

### ▸ Run in Admin PowerShell

Windows debloat tools:

```
iwr -useb https://git.io/debloat | iex
```

➣ Video reference: [https://youtu.be/pkeGuGUegss?t=109](https://youtu.be/pkeGuGUegss?t=109)

```
irm christitus.com/win | iex
```

➣ GUI-based cleaner
➣ [https://christitus.com/one-tool-for-everything/](https://christitus.com/one-tool-for-everything/)

---

### ▸ Run via Win + R

Show all installed apps:

```
shell:Appsfolder
```

Startup apps folder (create manually if missing):

```
C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup
```

---

## ➤ Permanently Disable Windows Defender

> Warning: This saves RAM/CPU but reduces security.

1. Open **Registry Editor**
2. Navigate to:

```
Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender
```

3. Create DWORD (32-bit):

```
DisableAntiSpyware = 1
```

Video guide:
[https://youtu.be/V_fjrD2s6ag](https://youtu.be/V_fjrD2s6ag)

---

## ➤ Cosmetic / Optional Tweaks

List all power plans:

```
powercfg -list
```

Delete a power plan:

```
powercfg -delete
```

---

### ▸ CPU Frequency Control (Power Options)

1. Control Panel → Hardware & Sound → Power Options
2. Change Plan Settings
3. Advanced Power Settings
4. Processor Power Management
5. Adjust:
   ▸ Maximum processor state
   ▸ Minimum processor state

---

### ▸ Enable Hidden Power Options (Registry)

Add **Maximum processor state**:

```
REG ADD HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\
54533251-82be-4824-96c1-47b60b740d00\
bc5038f7-23e0-4960-96da-33abaf5935ec /v Attributes /t REG_DWORD /d 2 /f
```

Add **Minimum processor state**:

```
REG ADD HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\
54533251-82be-4824-96c1-47b60b740d00\
893dee8e-2bef-41e0-89c6-b55d0929964c /v Attributes /t REG_DWORD /d 2 /f
```

---

### ▸ Desktop Power Plan Shortcut

1. Right-click Desktop → New → Shortcut
2. Location:

```
C:\Windows\System32\powercfg.exe /setactive [POWER_GUID]
```

3. Name it
4. (Optional) Change icon via shortcut properties
