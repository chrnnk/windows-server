#
# Windows PowerShell script for AD DS Deployment
#

Import-Module ADDSDeployment
Uninstall-ADDSDomainController `
-DemoteOperationMasterRole:$true `
-RemoveDnsDelegation:$false `
-Force:$true
