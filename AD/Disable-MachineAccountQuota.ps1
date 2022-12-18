Get-ADObject -Identity ((Get-ADDomain).distinguishedname) -Properties ms-DS-MachineAccountQuota
Set-ADDomain -Identity ((Get-ADDomain).distinguishedname) -Replace @{"ms-DS-MachineAccountQuota"="0"}
Write-Host "Open Group Policy Management Console ( Start > Run > gpmc.msc)."
Write-Host "Locate Domain Controllers OU and find Default Domain Controllers Policy."
Write-Host "Edit Default Domain Controllers Policy."
Write-Host "# Expand Computer Configuration – Policies – Windows Settings – Security Settings – User Rights Assignment"
Write-Host "# From right pane right click on Add workstations to domain – Properties – Remove Authenticated Users and Add the User or Group that you are delegating domain joining permissions."
Write-Host "# Click Apply and then OK to close the Properties window."
Pause
