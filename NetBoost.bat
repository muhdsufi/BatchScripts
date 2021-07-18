@echo off
color a

:: BatchGotAdmin
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
	TIMEOUT /T 2
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------    

echo ---------------------Initiate D Booster Program--------------------------
TIMEOUT /T 1
ping 1.1.1.1
netsh int tcp
netsh int tcp show global
netsh int tcp set chimney=enabled
netsh int tcp set global autotuninglevel=normal
netsh int tcp set global congestionprovider=ctcp
netsh interface tcp show heuristic
netsh interface tcp set heuristic disabled
echo ------------------------------------------------------------------------------------------------------------
echo                      Your DNS Entries Have Been Deleted From The Computer
echo ------------------------------------------------------------------------------------------------------------
TIMEOUT /T 1
echo.
echo.
echo                  Deleting Temporary and cache files....
del /s /f /q c:\windows\temp\*.*
rd /s /q c:\windows\temp
md c:\windows\temp
del /s /f /q C:\WINDOWS\Prefetch
del /s /f /q %temp%\*.*
rd /s /q %temp%
md %temp%
deltree /y c:\windows\tempor~1
deltree /y c:\windows\temp
deltree /y c:\windows\tmp
deltree /y c:\windows\ff*.tmp
deltree /y c:\windows\history
deltree /y c:\windows\cookies
deltree /y c:\windows\recent
deltree /y c:\windows\spool\printers
del c:\WIN386.SWP
cls
cd /d %temp%
rd %temp% /s /q
echo.
echo.
echo                                       Your Temporary and Cache files has been deleted
echo.
echo. 
echo                                              Hope You Enjoy NetBoost-2.0!!! from Sufi!
echo.
echo.
pause
