#https://adamtheautomator.com/powershell-sftp/
#Enter credentials to connect to FTP server.
$FTPUsername = "UserID"
$FTPPwd = "UserPwd"
$Password = ConvertTo-SecureString $FTPPwd -AsPlainText -Force
$Credential = New-Object System.Management.Automation.PSCredential ($FTPUsername, $Password)

#Import WinSCP module
Import-Module WinSCP

#Create WinSCP session to your FTP server. 10.0.0.3 is the FTP server. 
$WinSCPSession = PS C:\> New-WinSCPSession -SessionOption (New-WinSCPSessionOption -HostName 10.0.0.3 -Protocol Sftp -Credential $Credential -SshHostKeyFingerprint "ssh-ed25519 255 48:b4:4e:3d:67:ca:25:e4:c7:77:fe:3c:df:ae:d9:b9")

#List dir contents
Get-WinSCPChildItem -WinSCPSession $WinSCPSession

#Upload files
Send-WinSCPItem -WinSCPSession $WinSCPSession -Path C:\Temp\TestFile.txt -RemotePath '/Folder2/'

#Download files
Receive-WinSCPItem -WinSCPSession $WinSCPSession -RemotePath '/Folder2/ReadMe.txt' -LocalPath C:\Temp

#Disconnect the SFTP session
Remove-WinSCPSession -WinSCPSession $WinSCPSession
