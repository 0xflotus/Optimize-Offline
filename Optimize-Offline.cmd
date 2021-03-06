@ECHO OFF
CD /D "%~dp0"
SET "WM_TITLE=Optimize-Offline"
SET "WM_VERSION=3.2.7.8"
TITLE %WM_TITLE% v%WM_VERSION%

REM After setting the appropriate variables and switches, run this script as an administrator to quickly call Optimize-Offline.
REM A list of all available variables and switches can be found on Optimize-Offline's GitHub Repository.

REM Set the Optimize-Offline Source Path variable.
SET "SourcePath=X:\PathToImage"

NET SESSION >NUL 2>&1
IF %ERRORLEVEL% NEQ 0 (
    ECHO Permission denied. This script must be run as an Administrator.
    ECHO:
    PAUSE
    EXIT
) ELSE (
    ECHO Running as Administrator.
    TIMEOUT /T 2 >NUL
    PowerShell.exe -NoProfile -ExecutionPolicy Bypass -File %~dpn0.ps1 -SourcePath "%SourcePath%" -WindowsApps "Select" -SystemApps -Capabilities -Packages -Features -DeveloperMode -Win32Calc -Dedup -Registry -DaRT "All" -Additional -ISO "No-Prompt"
)
PAUSE
EXIT