## Playnite Apex Launch Options For AutoHotkey

APEX has introduced a new feature that prevents games from starting if a running programs that give players an unfair competitive advantage.

> On Wednesday, we rolled out an update to our [@PlayApex](https://x.com/PlayApex) anti-cheat that blocks programs that give players an unfair competitive advantage.
>
> If you are unable to launch the game, please disable any programs running in the background that may interfere with Apex.
>
> — Respawn ([@Respawn](https://x.com/Respawn)) [September 13, 2024](https://x.com/Respawn/status/1834674750448451777)

This meant that games could not be started using AutoHotkey.

As a workaround, I created a launch option to disable AutoHotkey when APEX starts and enable it when exiting. Below are the guide and code.

---

- Open Edit, then Scripts.

### Execute before starting a game

```powershell
# Check if an AutoHotkey process is running, and terminate it if found
if (Get-Process -Name "AutoHotkey" -ErrorAction SilentlyContinue) {
  Stop-Process -Name "AutoHotkey" -Force
}
```

- End the AutoHotkey process if it is running

### Execute after exiting a game

```powershell
# Define the path to the AutoHotkey executable
$ahkExePath = "C:\Program Files\AutoHotkey\AutoHotkey.exe"

# Define the path to your AutoHotkey script
$ahkScriptPath = "{USERDIR}\{FILENAME}.ahk"

# Check if the AutoHotkey process is already running
if (-not (Get-Process -Name "AutoHotkey" -ErrorAction SilentlyContinue)) {
  # Verify that both the AutoHotkey executable and the script exist
  if ((Test-Path $ahkExePath) -and (Test-Path $ahkScriptPath)) {
    # Start the AutoHotkey script if paths are valid and not already running
    Start-Process $ahkExePath -ArgumentList $ahkScriptPath
  }
}
```

- `$ahkExePath` is the path to the AutoHotkey executable.  
  If you have not changed the installation location, there is no need to change it since it is located by default.

- **`$ahkScriptPath` should specify the path of the `.ahk` file you are executing.**
