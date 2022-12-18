Get-ADObject -Identity ((Get-ADDomain).distinguishedname) -Properties ms-DS-MachineAccountQuota
Set-ADDomain -Identity ((Get-ADDomain).distinguishedname) -Replace @{"ms-DS-MachineAccountQuota"="0"}
