@echo off
@ Upload (put) file in remote destination
"C:\Program Files (x86)\WinSCP\WinSCP.com" ^
  /log="\\SERVER\WinSCP.log" /ini=nul ^
  /command ^
    "open sftp://USERNAME:PASSWORD@HOSTNAME:PORT/ -hostkey=""ssh-ed25519 255 SSHKEY""" ^
    "lcd ""E:\SourceFolder""" ^
    "cd /TargetFolder" ^
    "put FileToUpload.file" ^
    "exit"

set WINSCP_RESULT=%ERRORLEVEL%
if %WINSCP_RESULT% equ 0 (
  echo Success
) else (
  exit /b %WINSCP_RESULT%
)

@Delete source file after upload
TIMEOUT 3
DEL "E:\SourceFolder\FileToUpload.file"

exit /b %WINSCP_RESULT%

@ Download (get) file from remote destination
WinSCP.com ^
  /log="\\SERVER\WinSCP.log" /ini=nul ^
  /command ^
    "open sftp://USERNAME:PASSWORD@HOSTNAME:PORT/ -hostkey=""ssh-ed25519 255 SSHKEY""" ^
    "cd /testout" ^
    "lcd ""E:\SourceFolder""" ^
    "get *.dat" ^
    "rm *.dat" ^
    "exit"

set WINSCP_RESULT=%ERRORLEVEL%
if %WINSCP_RESULT% equ 0 (
  echo Success
) else (
  echo Error
)

TIMEOUT 3
type nul >"E:\XP.048468961"
TIMEOUT 2
for %%f in ("E:\Shared Files\*.dat") do type "%%f" >> "E:\Shared Files\EXP.048468961"
TIMEOUT 3
move /Y "E:\Shared Files\*.dat" "E:\Shared Files\Processed"
TIMEOUT 3

exit /b %WINSCP_RESULT%
