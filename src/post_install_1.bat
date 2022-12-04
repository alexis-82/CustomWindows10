echo off
cls

setlocal enabledelayedexpansion
set fore_dred=[31m
echo.
echo.
echo [31mAccount Administrator ATTIVATO![0m
net user Administrator /active:yes
echo.
echo.
set/p "end=Premere un tasto per disconnettere l'utente!"
logoff
