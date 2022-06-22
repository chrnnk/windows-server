Get-ADDomain | fl Name,DomainMode
Get-ADForest | fl Name,ForestMode
Set-ADDomainMode -identity DOMAIN.local -DomainMode Windows2016Domain
Set-ADForestMode -Identity DOMAIN.local -ForestMode Windows2016Forest
