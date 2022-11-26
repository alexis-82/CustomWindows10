echo off
cls

setlocal enabledelayedexpansion
set fore_dred=[31m
set underline=[4m
echo.
echo.
echo [31mAccount Administrator DISABILITATO![0m
net user Administrator /active:no
cd C:\Users
rmdir /s /q Administrator
echo.
echo.
set/p "end=[31mPulizia effettuata, premere un tasto pe uscire![0m"
exit




