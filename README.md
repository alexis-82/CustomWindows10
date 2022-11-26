# Custom Windows 10/11


## _Manuale in Italiano_

1. Installazione pulita di Windows 10/11
2. Entrare in modalità Administrator tramite CMD = %windir%\system32\sysprep\sysprep.exe /audit /reboot
**⚠ ATTENZIONE! ⚠** AL RIAVVIO LA FINESTRA DI SYSPREP DEVE RIMANERE APERTA!
3. Configurare una seconda unità HDD 
4. Installazione dei software tramite Chocolatey usando il terminale PowerShell come Amministratore
```
Set-ExecutionPolicy Bypass -Scope Process -Force; `
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```
5. Eliminare eventuali utenti
6. Aggiornamento del sistema
7. Pulizia del sistema con i seguenti comandi sempre da CMD
```
sc delete DiagTrack
sc delete dmwappushservice
echo ““ > C:\ProgramData\Microsoft\Diagnosis\ETLLogs\AutoLogger\AutoLogger-DiagTrack-Listener.etl
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f
```
8. Scarichiamo la patch sul desktop senza avviarlo
9. Ora impostiamo Sysprep su "Passare alla Configurazione guidata", mettiamo la [x]spunta su Generalizza e su Opzioni di arresto del sistema mettiamo "Arresta il sistema".
10. Impostiamo sulla macchina virtuale il boot con la iso di Windows e avviamo la macchina
11. Alla prima schermata di configurazione premiamo i tasti SHIFT+F10 e si aprirà il prompt dei comandi e scriviamo:
```
- diskpart
- list disk
- select disk 0 #Partizione di Windows
- select partition
- assign letter=A
- select disk 1 #Partizione HDD vuota
- list partition
- create partition primary
- format fs=ntfs quick
- list partition
- select partition 1
- assign letter=B
- dism /capture-image /imagefile:B:\install.wim /capturedir:A:\ /name:"CustomWindows" /compress:maximum /checkintegrity /verify /bootable
```
12. Chiudiamo l'installazione di Windows
13. Se abbiamo fatto tutto bene nel disco secondario HDD ci troveremo il file install.wim
14. Nella stessa unità creamo una cartella es. files e ci copiamo tutti i files del CD-ROM di Windows
15. Copiamo il file install.wim dentro alla cartella \files\sources\ e sovrascriviamo
16. Ultimo passaggio eseguiamo il seguente comando per generare la nostra bella ISO:
```
oscdimg.exe -m -o -u2 -udfver102 -bootdata:2#p0,e,bD:\files\boot\etfsboot.com#pEF,e,bD:\files\efi\microsoft\boot\efisys.bin D:\files D:\CustomWindows.iso
```
**⚠ ATTENZIONE! ⚠** Unità D:\ sopraccitata è l'unità HDD secondaria!

## Comandi Chocolatey
| Comando | Descrizione |
| ------ | ------ |
| choco upgrade chocolatey | Aggiornare Chocolatey |
| choco search [software] | Ricerca del software |
| choco install [software] | Installazione del software |
| choco upgrade [software] | Aggiornamento del software |


## PATCH
**post_install_1.bat**

Avviamolo in modalità Amministratore

**patch_admin.bat**

Avviamo il seguente file nell'account di Amministratore

**post_install_3.bat**

Avviamo l'ultimo file per eliminare l'account Amministratore

**⚠ ATTENZIONE! ⚠** I file  devono essere eseguiti tutti come Amministratore

---

## _Manual in English_

1. Clean installation of Windows 10/11
2. Enter Administrator via CMD = %windir%\system32\sysprep\sysprep.exe /audit /reboot
**⚠ ATTENTION! ⚠** ON RESTART THE SYSPREP WINDOW MUST REMAIN OPEN!
3. Configure a second HDD unit
4. Software installation via Chocolatey using PowerShell terminal as Administrator
```
Set-ExecutionPolicy Bypass -Scope Process -Force; `
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```
5. Delete any users
6. System update
7. Cleaning the system with the following commands always from CMD
```
sc delete DiagTrack
sc delete dmwappushservice
echo ““ > C:\ProgramData\Microsoft\Diagnosis\ETLLogs\AutoLogger\AutoLogger-DiagTrack-Listener.etl
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f
```
8. We download the patch to the desktop without starting it
9. Now we set Sysprep to "Go to the Configuration Wizard", we put the [x]check on Generalize and on System shutdown options we put "Shut down the system".
10. We set the boot with the Windows ISO on the virtual machine and start the machine
11. At the first configuration screen, press the SHIFT + F10 keys and the command prompt will open and write:
```
- diskpart
- list disk
- select disk 0 #Partizione di Windows
- select partition
- assign letter=A
- select disk 1 #Partizione HDD vuota
- list partition
- create partition primary
- format fs=ntfs quick
- list partition
- select partition 1
- assign letter=B
- dism /capture-image /imagefile:B:\install.wim /capturedir:A:\ /name:"CustomWindows" /compress:maximum /checkintegrity /verify /bootable
```
12. We close the Windows installation
13. If we have done everything right in the secondary HDD we will find the file install.wim
14. In the same drive we create a folder eg. files and we copy all the files from the Windows CD-ROM
15. Copy the install.wim file into the \ files \ sources \ folder and overwrite
16. Last step we run the following command to generate our beautiful ISO:
```
oscdimg.exe -m -o -u2 -udfver102 -bootdata:2#p0,e,bD:\files\boot\etfsboot.com#pEF,e,bD:\files\efi\microsoft\boot\efisys.bin D:\files D:\CustomWindows.iso
```
**⚠ ATTENTION! ⚠** Drive D:\ above is the secondary HDD drive!

## Commands Chocolatey
| Comand | Description |
| ------ | ------ |
| choco upgrade chocolatey | Update Chocolatey |
| choco search [software] | Software search |
| choco install [software] | Software installation |
| choco upgrade [software] | Software update |


## PATCH
**post_install_1.bat**
Let's start it in Administrator mode
**patch_admin.bat**
We launch the following file in the Administrator account
**post_install_3.bat**
Let's start the last file to delete the Administrator account
**⚠ ATTENTION! ⚠** The files must all be run as Administrator


