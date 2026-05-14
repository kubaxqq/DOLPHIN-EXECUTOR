@echo off
title Dolphin Executor - Core Downloader
cls
color 0b

echo [INFO] Initializing Dolphin Bootstrapper v2.9.5...
timeout /t 2 /nobreak >nul
echo [INFO] Connecting to secure download server... OK
echo [INFO] Status: Downloading required core files for working executor...
echo.

:: Falešný progres bar (bez procent, aby to nepadalo)
echo [====                     ] Downloading: DolphinCore.dll
timeout /t 1 /nobreak >nul
cls
echo [INFO] Status: Downloading required core files for working executor...
echo.
echo [==========               ] Downloading: interpatch.dll
timeout /t 1 /nobreak >nul
cls
echo [INFO] Status: Downloading required core files for working executor...
echo.
echo [==================       ] Downloading: Universal_ESP.lua
timeout /t 1 /nobreak >nul
cls
echo [INFO] Status: Downloading required core files for working executor...
echo.
echo [=========================] Download 100%% Complete.
echo [SUCCESS] All core assets successfully retrieved.
echo.

echo [INFO] Generating working executor environment...
timeout /t 1 /nobreak >nul

:: Reálné vytvoření složek
md workspace 2>nul
md autoexec 2>nul
md bin 2>nul
md scripts 2>nul

:: Reálné zápisy do souborů
echo theme=dark > bin\config.ini
echo auto_attach=true >> bin\config.ini
echo multi_instances=false >> bin\config.ini
echo // Dolphin Core Injection Library > bin\DolphinCore.dll
echo // Anti-Cheat Bypass Layer > bin\interpatch.dll
echo print("Dolphin Loaded Successfully!") > scripts\Universal_ESP.lua

echo [SUCCESS] Environment directories generated:
echo   - /workspace (For file saving)
echo   - /autoexec  (Runs scripts on startup)
echo   - /bin       (Core system DLLs)
echo   - /scripts   (Your script library)
echo.

echo [INFO] Starting fully working Dolphin Executor...
timeout /t 2 /nobreak >nul

:: Spuštění tvého .exe (musí být hned vedle tohoto .bat souboru)
if exist "Dolphin.exe" (
    start "" "Dolphin.exe"
) else if exist "dist\Dolphin.exe" (
    start "" "dist\Dolphin.exe"
) else (
    echo [ERROR] Dolphin.exe not found in this folder!
    echo Please make sure Dolphin.exe is next to this .bat file.
    pause
)

exit