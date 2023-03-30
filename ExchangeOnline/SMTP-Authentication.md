How do you know this worked?   
To verify that you've enabled or disabled SMTP AUTH for a specific mailbox, do any of the following steps:   
Individual mailboxes in the Microsoft 365 admin center: Go to Users > Active users > select the user > click Mail > click Manage email apps and verify the value of Authenticated SMTP (checked = enabled, unchecked = disabled).   
Individual mailboxes in Exchange Online PowerShell: Replace <MailboxIdentity> with the name; alias; email address or account name of the mailbox; run the following command; and verify the value of the SmtpClientAuthenticationDisabled property (False = enabled, True = disabled, blank = use organization setting).   


```
Get-CASMailbox -Identity <MailboxIdentity>  | Format-List SmtpClientAuthenticationDisabled
```
All mailboxes where SMTP AUTH is disabled: Run the following command:
```
$Users = Get-CASMailbox -ResultSize unlimited
$Users | where {$_.SmtpClientAuthenticationDisabled -eq $true}
```
All mailboxes where SMTP AUTH is enabled: Run the following command:
```
$Users = Get-CASMailbox -ResultSize unlimited
$Users | where {$_.SmtpClientAuthenticationDisabled -eq $false}
```
All mailboxes where SMTP AUTH is controlled by the organization setting: Run the following command:
```
$Users = Get-CASMailbox -ResultSize unlimited
$Users | where {$_.SmtpClientAuthenticationDisabled -eq $null}
```
