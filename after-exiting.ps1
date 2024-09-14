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
