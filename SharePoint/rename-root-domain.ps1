# https://learn.microsoft.com/en-us/sharepoint/change-your-sharepoint-domain-name
Install-Module -Name Microsoft.Online.SharePoint.PowerShell
Get-Module -Name Microsoft.Online.SharePoint.PowerShell -ListAvailable | Select Name,Version
Connect-SPOService -Url https://"old-root-domain"-admin.sharepoint.com
Start-SPOTenantRename -DomainName "new-root-domain" -ScheduledDateTime "2024-02-02T16:00:00"