# Check if an AutoHotkey process is running, and terminate it if found
if (Get-Process -Name "AutoHotkey" -ErrorAction SilentlyContinue) {
  Stop-Process -Name "AutoHotkey" -Force
}
