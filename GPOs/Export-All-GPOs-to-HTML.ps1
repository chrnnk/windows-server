Install-Module GroupPolicy
Import-Module GroupPolicy
Get-GPOReport -All -ReportType Html -Path C:\Temp\All-GPOs.html
