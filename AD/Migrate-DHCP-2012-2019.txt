I've done tests in my own environment with server 2012R2 and server2019, it can be done by PowerShell command, please follow these steps:

1.Log in with an administrator account to the Windows Server 2012 R2 system.

2.Open Powershell and then type in the following command:

Export-DhcpServer -File C:\DHCPdata.xml -Leases -Force -ComputerName old.network.local –Verbose

3.Copy the file C:\DHCPdata.xml the Windows Server 2019 system.

4.Install and configure the DHCP role on Server 2019

5.Start the DHCP service.

6.Type in the following command on Powershell to import the DHCP Data.

Import-DhcpServer -File C:\DHCPdata.xml -BackupPath C:\DHCP\ -Leases -ScopeOverwrite -Force -ComputerName new.network.local –Verbose

7.Restart the DHCP service.

Verify your DHCP scope, IP leases, reservations etc and they should match with DHCP Server 2012 R2.
