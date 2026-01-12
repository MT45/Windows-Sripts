# Windows-Sripts
A collection I have made overtime of batch scripts and Windows commands to automate activation, privacy tweaks, application installation, power configuration, and system customization.

# Windows Utility & Automation Scripts

A collection of batch scripts and Windows commands designed to automate:
- Windows & Office activation
- Privacy / debloat tweaks
- Application installation
- CPU & power plan management
- System customization

---

## Table of Contents
- [Script Descriptions](#script-descriptions)
- [Application Installation Scripts](#application-installation-scripts)
- [Power & CPU Management](#power--cpu-management)
- [Windows Commands](#windows-commands)
- [Windows Defender & Privacy](#windows-defender--privacy)
- [Cosmetic / Optional Tweaks](#cosmetic--optional-tweaks)

---

## Script Descriptions

### Windows Answer File
Windows 10: 10autounattend.xml  
Windows 11: 11autounattend.xml

### No Category
➜ **add_script_user.bat**  
   ➣ Create local users, create groups and add users into the groups
   
➜ **delete_script_user.bat**  
   ➣ Delete users, delete users in groups, and delete the groups
   
➜ **Custom-Script.bat**  
   ➣ A mix from all other scripts (enables/disables features I (don't) need the most)
   
➜ **Edge.bat**  
   ➣ A script to remove Edge and Edge Updates
   
➜ **script-OU_v1.bat**  
   ➣ A powershell Script to create a whole tree structure (arborescence) in an Active Directory
      
➜ **script-OU_v2.bat**  
   ➣ A revised version of the V1 where the password and domain can be easily changed
   
➜ **script-OU_v3.bat**  
   ➣ A revised version of the V2 where the domain placeholder was missing at the end of the script
   

### Activation

1. **Activator - Microsoft Office LTSC Professional Plus 2024.bat**  
   ➣ Activates Office LTSC Professional Plus 2024

2. **Activator - Windows 10｜11.bat**  
   ➣ Activates Windows 10 or Windows 11

---

### Configuration

3. **Config-MSI-Afterburner.bat**  
   ➣ Configures MSI Afterburner  
   ➣ Fan settings, auto-start, and basic configuration

---

### Privacy / Debloat

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

## Application Installation Scripts

9. **Installing 7-Zip, Steam, Cursor, VLC, Powertoys, Photos, Snip.bat**

10. **Installing MSI, Discord, 7-Zip, Steam, VLC, Powertoys, Photos, Snip.bat**

12. **Installing Vivaldi, MSI Afterburner, Discord, 7-Zip, Steam, Kdenlive, OBS, G Hub, Cursor, VLC, Powertoys, Photos, Snip, Minecraft.bat**

13. **Installing Vivaldi, MSI, Discord, 7-Zip, Steam, Cursor, VLC, Powertoys, Photos, Snip.bat**

---

## Power & CPU Management

14. **Laptop_CPU Clock.bat**  
   ➣ Creates two power plans:  
   - Limited CPU clock (~2.00 GHz)  
   - Full performance  
   ➣ Desktop shortcuts to switch plans instantly

15. **Office-2024-config-creator.bat**  
   ➣ Creates `C:\Office\Configuration2024.xml`  
   ➣ Installs:
   - Office Pro Plus 2024  
   - Visio Pro 2024  
   - Project Pro 2024  

16. **PC_CPU Clock.bat**  
   ➣ Creates two power plans:  
   - Limited CPU clock (~3.00 GHz)  
   - Full performance  
   ➣ Desktop shortcuts included

17. **Sleep Shortcut**  
   ➣ One-click shortcut to put the PC into sleep mode

---

## Miscellaneous

18. **test anything.bat**  
   ➣ Draft / testing file

19. **Windows-Defender.bat**  
   ➣ Disables Windows Defender

20. **Winget - BitsTransfer.bat**  
   ➣ Downloads Winget via BitsTransfer (deprecated)

21. **Winget - Invoke-WebRequest.bat**  
   ➣ Downloads Winget via Invoke-WebRequest (deprecated)

---

# ☰☰☰☰☰Windows Commands☰☰☰☰☰

### Run in Terminal

Add **Ultimate Performance** power plan:
```bash
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
```

➣ Ensures CPU can reach factory boost clocks

---

### Run in Admin PowerShell

Debloat Windows:

```powershell
iwr -useb https://git.io/debloat | iex
```

GUI-based cleaner:

```powershell
irm christitus.com/win | iex
```

References:

* [https://youtu.be/pkeGuGUegss?t=109](https://youtu.be/pkeGuGUegss?t=109)
* [https://christitus.com/one-tool-for-everything/](https://christitus.com/one-tool-for-everything/)

---

### Run via Win + R

Show all installed applications:

```text
shell:Appsfolder
```

Startup folder (create if missing):

```text
C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup
```

---

## Windows Defender & Privacy

> [!WARNING]
> Disabling Windows Defender reduces system security.

Disable Defender permanently:

1. Open **Registry Editor**
2. Navigate to:

```text
Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender
```

3. Create DWORD (32-bit):

```text
DisableAntiSpyware = 1
```

Video guide:
[https://youtu.be/V_fjrD2s6ag](https://youtu.be/V_fjrD2s6ag)

---

## Cosmetic / Optional Tweaks

List all power plans:

```bash
powercfg -list
```

Delete a power plan:

```bash
powercfg -delete
```

---

### CPU Frequency Control

1. Control Panel → Hardware & Sound → Power Options
2. Change plan settings
3. Advanced power settings
4. Processor power management
5. Adjust:

   * Maximum processor state
   * Minimum processor state

---

### Enable Hidden Power Options (Registry)

Enable **Maximum processor state**:

```cmd
REG ADD HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\
54533251-82be-4824-96c1-47b60b740d00\
bc5038f7-23e0-4960-96da-33abaf5935ec /v Attributes /t REG_DWORD /d 2 /f
```

Enable **Minimum processor state**:

```cmd
REG ADD HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\
54533251-82be-4824-96c1-47b60b740d00\
893dee8e-2bef-41e0-89c6-b55d0929964c /v Attributes /t REG_DWORD /d 2 /f
```

---

### Desktop Power Plan Shortcut

1. Right-click Desktop → New → Shortcut
2. Location:

```text
C:\Windows\System32\powercfg.exe /setactive [POWER_GUID]
```
> [!WARNING]
> Repalce what s in the brackets what you get from powercfg -list.

```cmd
powercfg -list
```

3. Name the shortcut
4. (Optional) Change icon via shortcut properties
