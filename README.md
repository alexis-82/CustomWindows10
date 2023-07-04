# Custom Windows 10/11

## _Manuale in Italiano_

1. Installazione pulita di Windows 10/11
2. Entrare in modalità Administrator tramite CMD:

```
%windir%\system32\sysprep\sysprep.exe /audit /reboot
```

**⚠ ATTENZIONE! ⚠**  
AL RIAVVIO LA FINESTRA DI SYSPREP DEVE RIMANERE APERTA!

3. Configurare una seconda unità HDD 
4. Eliminare tutti gli utenti, no Amministratore
5. Aggiornamento del sistema
6. Pulizia del sistema con i seguenti comandi sempre da CMD:

```
- sc delete DiagTrack
- sc delete dmwappushservice
- echo ““ > C:\ProgramData\Microsoft\Diagnosis\ETLLogs\AutoLogger\AutoLogger-DiagTrack-Listener.etl
- REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f
```

7. Ora impostiamo Sysprep su "Passare alla Configurazione guidata", mettiamo la [x]spunta su Generalizza e su Opzioni di arresto del sistema mettiamo "Arresta il sistema" e OK.
8. Riavviamo il sistema e facciamo le installazione dei software tramite Chocolatey usando il terminale PowerShell come Amministratore
```
- Set-ExecutionPolicy Bypass -Scope Process -Force; `
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

## Comandi Chocolatey
| Comando | Descrizione |
| ------ | ------ |
| choco upgrade chocolatey | Aggiornare Chocolatey |
| choco search [software] | Ricerca del software |
| choco install [software] | Installazione del software |
| choco upgrade [software] | Aggiornamento del software |

⭕ Altri sistemi di rimozione pacchetti: manuale: CustomWindows/list/ oppure 🔗 [ChrisTitusTech](https://github.com/ChrisTitusTech/winutil)

9. Scarichiamo le patch e le trasferiamo in C:\
10. Il file oscdimg.exe invece lo spostiamo in D:\ (nella seconda unità) e spegnere
11. Impostiamo sulla macchina virtuale il boot con la iso di Windows e avviamo la macchina
12. Alla prima schermata di configurazione premiamo i tasti SHIFT+F10 e si aprirà il prompt dei comandi e scriviamo:

**⚠ ATTENZIONE! ⚠**  
LE UNITA' POSSONO ESSERE DIFFERENTI, CONTROLLATE CON IL PRIMO COMANDO!

```
diskpart
list disk
select disk 0 #Partizione di Windows
list partition
select partition 3 #PRIMARIA
assign letter=A
list disk
select disk 1 #Partizione HDD vuota
list partition
select partition 2 #PRIMARIA
assign letter=B
exit
dism /capture-image /imagefile:B:\install.esd /capturedir:A:\ /name:"CustomWindows" /compress:maximum /checkintegrity /verify /bootable
```

13. Chiudiamo l'installazione di Windows e riavviare
14. Se abbiamo fatto tutto bene nel disco secondario ci troveremo il file install.esd
15. Nella stessa unità creamo una cartella es. files e ci copiamo tutti i files del CD-ROM di Windows
16. Copiamo il file install.esd dentro alla cartella \files\sources\ e sovrascriviamo
17. Ultimo passaggio eseguiamo il seguente comando per generare la nostra bella ISO:

```
oscdimg.exe -m -o -u2 -udfver102 -bootdata:2#p0,e,bD:\files\boot\etfsboot.com#pEF,e,bD:\files\efi\microsoft\boot\efisys.bin D:\files D:\CustomWindows.iso
```

**⚠ ATTENZIONE! ⚠**  
Unità D:\ sopraccitata è l'unità HDD secondaria!


## ISTRUZIONI PATCH POST INSTALLAZIONE WINDOWS 10/11

**Portare il file patch.bat sul nostro desktop**
Avviamolo il file patch.bat e selezionare l'opzione 1


**ENTRARE NELL'ACCOUNT AMMINISTRATORE**  
Avviare di nuovo il file patch.bat e selezionare l'opzione 2


**RITORNIAMO NEL NOSTRO ACCOUNT UTENTE**  
Per l'ultima volta avviamo il file patch.bat e selezioniamo l'opzione 3

**⚠ ATTENZIONE! ⚠**  
I file devono essere eseguiti tutti come Amministratore

<br>
<br>
<br>

---

<br>
<br>
<br>

## _Manual in English_

1. Clean install of Windows 10/11
2. Enter Administrator mode via CMD:

```
%windir%\system32\sysprep\sysprep.exe /audit /reboot
```

**⚠ ATTENTION! ⚠**  
THE SYSPREP WINDOW MUST REMAIN OPEN ON REBOOT!

3. Configure a second HDD unit
4. Delete all users, no Administrator
5. System update
6. System cleaning with the following commands always from CMD:

```
- sc delete DiagTrack
- sc delete dmwappushservice
- echo ““ > C:\ProgramData\Microsoft\Diagnosis\ETLLogs\AutoLogger\AutoLogger-DiagTrack-Listener.etl
- REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f
```

7. Now let's set Sysprep to "Go to Setup Wizard", put the [x]tick on Generalize and on Shutdown Options put "Shut down" and OK.
8. We restart the system and install the software via Chocolatey using the PowerShell terminal as Administrator
```
- Set-ExecutionPolicy Bypass -Scope Process -Force; `
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

## Chocolatey commands
| Comand | Description |
| ------ | ------ |
| choco upgrade chocolatey | Update Chocolatey |
| choco search [software] | Software search |
| choco install [software] | Software installation |
| choco upgrade [software] | Software update |

⭕ Other ways to remove packages: manual: CustomWindows/list/ or 🔗 [ChrisTitusTech](https://github.com/ChrisTitusTech/winutil)

9. We download the patches and transfer them to C:\
10. The oscdimg.exe file instead we move it to D:\ (in the second drive) and turn off
11. We set the boot with the Windows ISO on the virtual machine and start the machine
12. At the first configuration screen, press the SHIFT + F10 keys and the command prompt will open and write:

**⚠ ATTENTION!⚠**  
THE UNITS MAY BE DIFFERENT, CONTROLLED WITH THE FIRST COMMAND!

```
diskpart
list disk
select disk 0 # Windows Partition
list partition
select partition 3 #PRIMARY
assign letter=A
list disk
select disk 1 #Empty Disk
list partition
select partition 2 #PRIMARY
assign letter=B
exit
dism /capture-image /imagefile:B:\install.esd /capturedir:A:\ /name:"CustomWindows" /compress:maximum /checkintegrity /verify /bootable
```

13. We close the Windows installation and reboot
14. If we have done everything right in the secondary we will find the file install.esd
15. In the same drive we create a folder eg. files and we copy all the files from the Windows CD-ROM
16. Copy the install.esd file into the \files\sources\ folder and overwrite
17. Last step we run the following command to generate our beautiful ISO:

```
oscdimg.exe -m -o -u2 -udfver102 -bootdata:2#p0,e,bD:\files\boot\etfsboot.com#pEF,e,bD:\files\efi\microsoft\boot\efisys.bin D:\files D:\CustomWindows.iso
```

**⚠ ATTENTION! ⚠**  
Drive D:\ above is the secondary HDD drive!


## WINDOWS 10/11 POST INSTALLATION PATCH INSTRUCTION

**Bring the patch.bat file to our desktop**  
Run the patch.bat file and select option 1


**LOG IN TO THE ADMINISTRATOR ACCOUNT**  
Run the patch.bat file again and select option 2


**WE RETURN TO OUR USER ACCOUNT**  
For the last time we run the patch.bat file and select option 3

**⚠ ATTENTION! ⚠**  
The files must all be run as Administrator

---
