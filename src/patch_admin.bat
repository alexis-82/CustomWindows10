echo off

cls

setlocal enabledelayedexpansion
set fore_dred=[31m
set underline=[4m
echo.
echo.
wmic useraccount list full
echo.
echo.
set/p "sid=[4mCopiare il valore SID qui:[0m "
echo.
set/p "oldname=[4mCopiare il valore SID qui:[0m "
echo.
set/p "newname=[4mInserire il nuovo nome:[0m "
echo.
cd c:\Users
ren "%oldname%" "%newname%"
echo.
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\ProfileList\%sid%" /v ProfileImagePath /t REG_SZ /d C:\Users\%newname% /f
echo.
echo.
echo.
wmic useraccount where name="%oldname%" rename "%newname%"
echo [31mAccount Administrator DISABILITATO![0m
net user Administrator /active:no
echo.
echo.
echo.
set/p "end=Premere un tasto per disconnettere l'utente!"
logoff
