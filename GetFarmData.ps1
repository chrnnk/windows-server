# GetFarmData.ps1
# v1.1 cnaudy@microsoft.com

[void][System.Reflection.Assembly]::Load('System.Drawing, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
[void][System.Reflection.Assembly]::Load('System.Windows.Forms, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')

function ShowEULAPopup($mode)
{
    $EULA = New-Object -TypeName System.Windows.Forms.Form
    $richTextBox1 = New-Object System.Windows.Forms.RichTextBox
    $btnAcknowledge = New-Object System.Windows.Forms.Button
    $btnCancel = New-Object System.Windows.Forms.Button

    $EULA.SuspendLayout()
    $EULA.Name = "EULA"
    $EULA.Text = "Microsoft Diagnostic Tools End User License Agreement"

    $richTextBox1.Anchor = [System.Windows.Forms.AnchorStyles]::Top -bor [System.Windows.Forms.AnchorStyles]::Bottom -bor [System.Windows.Forms.AnchorStyles]::Left -bor [System.Windows.Forms.AnchorStyles]::Right
    $richTextBox1.Location = New-Object System.Drawing.Point(12,12)
    $richTextBox1.Name = "richTextBox1"
    $richTextBox1.ScrollBars = [System.Windows.Forms.RichTextBoxScrollBars]::Vertical
    $richTextBox1.Size = New-Object System.Drawing.Size(776, 397)
    $richTextBox1.TabIndex = 0
    $richTextBox1.ReadOnly=$True
    $richTextBox1.Add_LinkClicked({Start-Process -FilePath $_.LinkText})
    $richTextBox1.Rtf = @"
{\rtf1\ansi\ansicpg1252\deff0\nouicompat{\fonttbl{\f0\fswiss\fprq2\fcharset0 Segoe UI;}{\f1\fnil\fcharset0 Calibri;}{\f2\fnil\fcharset0 Microsoft Sans Serif;}}
{\colortbl ;\red0\green0\blue255;}
{\*\generator Riched20 10.0.19041}{\*\mmathPr\mdispDef1\mwrapIndent1440 }\viewkind4\uc1 
\pard\widctlpar\f0\fs19\lang1033 MICROSOFT SOFTWARE LICENSE TERMS\par
Microsoft Diagnostic Scripts and Utilities\par
\par
{\pict{\*\picprop}\wmetafile8\picw26\pich26\picwgoal32000\pichgoal15 
0100090000035000000000002700000000000400000003010800050000000b0200000000050000
000c0202000200030000001e000400000007010400040000000701040027000000410b2000cc00
010001000000000001000100000000002800000001000000010000000100010000000000000000
000000000000000000000000000000000000000000ffffff00000000ff040000002701ffff0300
00000000
}These license terms are an agreement between you and Microsoft Corporation (or one of its affiliates). IF YOU COMPLY WITH THESE LICENSE TERMS, YOU HAVE THE RIGHTS BELOW. BY USING THE SOFTWARE, YOU ACCEPT THESE TERMS.\par
{\pict{\*\picprop}\wmetafile8\picw26\pich26\picwgoal32000\pichgoal15 
0100090000035000000000002700000000000400000003010800050000000b0200000000050000
000c0202000200030000001e000400000007010400040000000701040027000000410b2000cc00
010001000000000001000100000000002800000001000000010000000100010000000000000000
000000000000000000000000000000000000000000ffffff00000000ff040000002701ffff0300
00000000
}\par
\pard 
{\pntext\f0 1.\tab}{\*\pn\pnlvlbody\pnf0\pnindent0\pnstart1\pndec{\pntxta.}}
\fi-360\li360 INSTALLATION AND USE RIGHTS. Subject to the terms and restrictions set forth in this license, Microsoft Corporation (\ldblquote Microsoft\rdblquote ) grants you (\ldblquote Customer\rdblquote  or \ldblquote you\rdblquote ) a non-exclusive, non-assignable, fully paid-up license to use and reproduce the script or utility provided under this license (the "Software"), solely for Customer\rquote s internal business purposes, to help Microsoft troubleshoot issues with one or more Microsoft products, provided that such license to the Software does not include any rights to other Microsoft technologies (such as products or services). \ldblquote Use\rdblquote  means to copy, install, execute, access, display, run or otherwise interact with the Software. \par
\pard\widctlpar\par
\pard\widctlpar\li360 You may not sublicense the Software or any use of it through distribution, network access, or otherwise. Microsoft reserves all other rights not expressly granted herein, whether by implication, estoppel or otherwise. You may not reverse engineer, decompile or disassemble the Software, or otherwise attempt to derive the source code for the Software, except and to the extent required by third party licensing terms governing use of certain open source components that may be included in the Software, or remove, minimize, block, or modify any notices of Microsoft or its suppliers in the Software. Neither you nor your representatives may use the Software provided hereunder: (i) in a way prohibited by law, regulation, governmental order or decree; (ii) to violate the rights of others; (iii) to try to gain unauthorized access to or disrupt any service, device, data, account or network; (iv) to distribute spam or malware; (v) in a way that could harm Microsoft\rquote s IT systems or impair anyone else\rquote s use of them; (vi) in any application or situation where use of the Software could lead to the death or serious bodily injury of any person, or to physical or environmental damage; or (vii) to assist, encourage or enable anyone to do any of the above.\par
\par
\pard\widctlpar\fi-360\li360 2.\tab DATA. Customer owns all rights to data that it may elect to share with Microsoft through using the Software. You can learn more about data collection and use in the help documentation and the privacy statement at {{\field{\*\fldinst{HYPERLINK https://aka.ms/privacy }}{\fldrslt{https://aka.ms/privacy\ul0\cf0}}}}\f0\fs19 . Your use of the Software operates as your consent to these practices.\par
\pard\widctlpar\par
\pard\widctlpar\fi-360\li360 3.\tab FEEDBACK. If you give feedback about the Software to Microsoft, you grant to Microsoft, without charge, the right to use, share and commercialize your feedback in any way and for any purpose.\~ You will not provide any feedback that is subject to a license that would require Microsoft to license its software or documentation to third parties due to Microsoft including your feedback in such software or documentation. \par
\pard\widctlpar\par
\pard\widctlpar\fi-360\li360 4.\tab EXPORT RESTRICTIONS. Customer must comply with all domestic and international export laws and regulations that apply to the Software, which include restrictions on destinations, end users, and end use. For further information on export restrictions, visit {{\field{\*\fldinst{HYPERLINK https://aka.ms/exporting }}{\fldrslt{https://aka.ms/exporting\ul0\cf0}}}}\f0\fs19 .\par
\pard\widctlpar\par
\pard\widctlpar\fi-360\li360\qj 5.\tab REPRESENTATIONS AND WARRANTIES. Customer will comply with all applicable laws under this agreement, including in the delivery and use of all data. Customer or a designee agreeing to these terms on behalf of an entity represents and warrants that it (i) has the full power and authority to enter into and perform its obligations under this agreement, (ii) has full power and authority to bind its affiliates or organization to the terms of this agreement, and (iii) will secure the permission of the other party prior to providing any source code in a manner that would subject the other party\rquote s intellectual property to any other license terms or require the other party to distribute source code to any of its technologies.\par
\pard\widctlpar\par
\pard\widctlpar\fi-360\li360\qj 6.\tab DISCLAIMER OF WARRANTY. THE SOFTWARE IS PROVIDED \ldblquote AS IS,\rdblquote  WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL MICROSOFT OR ITS LICENSORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THE SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.\par
\pard\widctlpar\qj\par
\pard\widctlpar\fi-360\li360\qj 7.\tab LIMITATION ON AND EXCLUSION OF DAMAGES. IF YOU HAVE ANY BASIS FOR RECOVERING DAMAGES DESPITE THE PRECEDING DISCLAIMER OF WARRANTY, YOU CAN RECOVER FROM MICROSOFT AND ITS SUPPLIERS ONLY DIRECT DAMAGES UP TO U.S. $5.00. YOU CANNOT RECOVER ANY OTHER DAMAGES, INCLUDING CONSEQUENTIAL, LOST PROFITS, SPECIAL, INDIRECT, OR INCIDENTAL DAMAGES. This limitation applies to (i) anything related to the Software, services, content (including code) on third party Internet sites, or third party applications; and (ii) claims for breach of contract, warranty, guarantee, or condition; strict liability, negligence, or other tort; or any other claim; in each case to the extent permitted by applicable law. It also applies even if Microsoft knew or should have known about the possibility of the damages. The above limitation or exclusion may not apply to you because your state, province, or country may not allow the exclusion or limitation of incidental, consequential, or other damages.\par
\pard\widctlpar\par
\pard\widctlpar\fi-360\li360 8.\tab BINDING ARBITRATION AND CLASS ACTION WAIVER. This section applies if you live in (or, if a business, your principal place of business is in) the United States.  If you and Microsoft have a dispute, you and Microsoft agree to try for 60 days to resolve it informally. If you and Microsoft can\rquote t, you and Microsoft agree to binding individual arbitration before the American Arbitration Association under the Federal Arbitration Act (\ldblquote FAA\rdblquote ), and not to sue in court in front of a judge or jury. Instead, a neutral arbitrator will decide. Class action lawsuits, class-wide arbitrations, private attorney-general actions, and any other proceeding where someone acts in a representative capacity are not allowed; nor is combining individual proceedings without the consent of all parties. The complete Arbitration Agreement contains more terms and is at {{\field{\*\fldinst{HYPERLINK https://aka.ms/arb-agreement-4 }}{\fldrslt{https://aka.ms/arb-agreement-4\ul0\cf0}}}}\f0\fs19 . You and Microsoft agree to these terms. \par
\pard\widctlpar\par
\pard\widctlpar\fi-360\li360 9.\tab LAW AND VENUE. If U.S. federal jurisdiction exists, you and Microsoft consent to exclusive jurisdiction and venue in the federal court in King County, Washington for all disputes heard in court (excluding arbitration). If not, you and Microsoft consent to exclusive jurisdiction and venue in the Superior Court of King County, Washington for all disputes heard in court (excluding arbitration).\par
\pard\widctlpar\par
\pard\widctlpar\fi-360\li360 10.\tab ENTIRE AGREEMENT. This agreement, and any other terms Microsoft may provide for supplements, updates, or third-party applications, is the entire agreement for the software.\par
\pard\sa200\sl276\slmult1\f1\fs22\lang9\par
\pard\f2\fs17\lang2057\par
}
"@
    $richTextBox1.BackColor = [System.Drawing.Color]::White
    $btnAcknowledge.Anchor = [System.Windows.Forms.AnchorStyles]::Bottom -bor [System.Windows.Forms.AnchorStyles]::Right
    $btnAcknowledge.Location = New-Object System.Drawing.Point(544, 415)
    $btnAcknowledge.Name = "btnAcknowledge";
    $btnAcknowledge.Size = New-Object System.Drawing.Size(119, 23)
    $btnAcknowledge.TabIndex = 1
    $btnAcknowledge.Text = "Accept"
    $btnAcknowledge.UseVisualStyleBackColor = $True
    $btnAcknowledge.Add_Click({$EULA.DialogResult=[System.Windows.Forms.DialogResult]::Yes})

    $btnCancel.Anchor = [System.Windows.Forms.AnchorStyles]::Bottom -bor [System.Windows.Forms.AnchorStyles]::Right
    $btnCancel.Location = New-Object System.Drawing.Point(669, 415)
    $btnCancel.Name = "btnCancel"
    $btnCancel.Size = New-Object System.Drawing.Size(119, 23)
    $btnCancel.TabIndex = 2
    if($mode -ne 0)
    {
	    $btnCancel.Text = "Close"
    }
    else
    {
	    $btnCancel.Text = "Decline"
    }
    $btnCancel.UseVisualStyleBackColor = $True
    $btnCancel.Add_Click({$EULA.DialogResult=[System.Windows.Forms.DialogResult]::No})

    $EULA.AutoScaleDimensions = New-Object System.Drawing.SizeF(6.0, 13.0)
    $EULA.AutoScaleMode = [System.Windows.Forms.AutoScaleMode]::Font
    $EULA.ClientSize = New-Object System.Drawing.Size(800, 450)
    $EULA.Controls.Add($btnCancel)
    $EULA.Controls.Add($richTextBox1)
    if($mode -ne 0)
    {
	    $EULA.AcceptButton=$btnCancel
    }
    else
    {
        $EULA.Controls.Add($btnAcknowledge)
	    $EULA.AcceptButton=$btnAcknowledge
        $EULA.CancelButton=$btnCancel
    }
    $EULA.ResumeLayout($false)
    $EULA.Size = New-Object System.Drawing.Size(800, 650)

    Return ($EULA.ShowDialog())
}

function ShowEULAIfNeeded($toolName, $mode)
{
	$eulaRegPath = "HKCU:Software\Microsoft\CESDiagnosticTools"
	$eulaAccepted = "No"
	$eulaValue = $toolName + " EULA Accepted"
	if(Test-Path $eulaRegPath)
	{
		$eulaRegKey = Get-Item $eulaRegPath
		$eulaAccepted = $eulaRegKey.GetValue($eulaValue, "No")
	}
	else
	{
		$eulaRegKey = New-Item $eulaRegPath
	}
	if($mode -eq 2) # silent accept
	{
		$eulaAccepted = "Yes"
       		$ignore = New-ItemProperty -Path $eulaRegPath -Name $eulaValue -Value $eulaAccepted -PropertyType String -Force
	}
	else
	{
		if($eulaAccepted -eq "No")
		{
			$eulaAccepted = ShowEULAPopup($mode)
			if($eulaAccepted -eq [System.Windows.Forms.DialogResult]::Yes)
			{
	        		$eulaAccepted = "Yes"
	        		$ignore = New-ItemProperty -Path $eulaRegPath -Name $eulaValue -Value $eulaAccepted -PropertyType String -Force
			}
		}
	}
	return $eulaAccepted
}

$eulaAccepted = ShowEULAIfNeeded "GetFarmData" 0
if($eulaAccepted -ne "Yes")
{
    "EULA Declined"
    exit
}

Write-Host "========== RDS deployment info collection Script ========== "
Write-Host "This Data collection is for RDS deployment Scenarios. "
Write-Host ""
Write-Host "Run this script on the connection broker of the RDS deployment as a domain administrator."
Write-Host "When you have several brokers, you will have to run it on the active management broker"
Write-Host ""
Write-Host "This script does not change any setting, it just reads the different settings of the deployment"
Write-Host ""
Write-Host "The GetFarmData.ps1 script is designed to collect information that will help Microsoft Customer Support Services (CSS)gather 
an overall view of your RDS deployment and troubleshoot an issue you may be experiencing with Windows Remote Desktop Services."
"The collected data may contain Personally Identifiable Information (PII) and/or sensitive data, such as (but not limited to) 
PC names; and user names."
Write-Host ""
Write-Host "You can redirect the output of the script to a text file using the syntax :"
Write-Host ""
Write-Host " PS C:\System32> .\getfarmdata.ps1 > c:\result.txt"
Write-Host ""
Write-Host "You can send this result to Microsoft CSS using a secure file transfer tool - Please discuss this with your support professional and also any concerns you may have. "
Write-Host "Are you sure you want to continue[Y/N]?"
    $Readhost = Read-Host " ( y / n ) " 
    Switch ($ReadHost) 
     { 
       Y {

Import-Module remotedesktop



#Get Servers of the farm:
$servers = Get-RDServer

$BrokerServers = @()
$WebAccessServers = @()
$RDSHostServers = @()
$GatewayServers = @()

foreach ($server in $servers)
{
	switch ($server.Roles)
	{
	"RDS-CONNECTION-BROKER" {$BrokerServers += $server.Server}
	"RDS-WEB-ACCESS" {$WebAccessServers += $server.Server}
	"RDS-RD-SERVER" {$RDSHostServers += $server.Server}
	"RDS-GATEWAY" {$GatewayServers += $server.Server}
	}
}
"Machines involved in the deployment : " + $servers.Count
"	-Broker(s) : " + $BrokerServers.Count
foreach ($BrokerServer in $BrokerServers)
		{
		"		" +	$BrokerServer
$ServicesStatus = Get-WmiObject -ComputerName $BrokerServer -Query "Select * from Win32_Service where Name='rdms' or Name='tssdis' or Name='tscpubrpc'"
        foreach ($stat in $ServicesStatus)
        {
        "		      - " + $stat.Name + " service is " + $stat.State
        }

		}
" "	
"	-RDS Host(s) : " + $RDSHostServers.Count
foreach ($RDSHostServer in $RDSHostServers)
		{
		"		" +	$RDSHostServer
$ServicesStatus = Get-WmiObject -ComputerName $RDSHostServer -Query "Select * from Win32_Service where Name='TermService'"
        foreach ($stat in $ServicesStatus)
        {
        "		      - " + $stat.Name +  "service is " + $stat.State
        }
		}
" " 
"	-Web Access Server(s) : " + $WebAccessServers.Count
foreach ($WebAccessServer in $WebAccessServers)
		{
		"		" +	$WebAccessServer
		}
" " 	
"	-Gateway server(s) : " + $GatewayServers.Count
foreach ($GatewayServer in $GatewayServers)
		{
		"		" +	$GatewayServer
$ServicesStatus = Get-WmiObject -ComputerName $GatewayServer -Query "Select * from Win32_Service where Name='TSGateway'"
        foreach ($stat in $ServicesStatus)
        {
        "		      - " + $stat.Name + " service is " + $stat.State
        }
		}
" "

#Get active broker server.
$ActiveBroker = Invoke-WmiMethod -Path ROOT\cimv2\rdms:Win32_RDMSEnvironment -Name GetActiveServer
$ConnectionBroker = $ActiveBroker.ServerName
"ActiveManagementServer (broker) : " +	$ActiveBroker.ServerName
" "

# Deployment Properties  TODO ##############
##########
"Deployment details : "
# Is Broker configured in High Availability?
$HighAvailabilityBroker = Get-RDConnectionBrokerHighAvailability
$BoolHighAvail = $false
If ($HighAvailabilityBroker -eq $null)
{
	$BoolHighAvail = $false
	"	Is Connection Broker configured for High Availability : " + $BoolHighAvail
}
else
{
	$BoolHighAvail = $true
	"	Is Connection Broker configured for High Availability : " + $BoolHighAvail
	"		- Client Access Name (Round Robin DNS) : " + $HighAvailabilityBroker.ClientAccessName
	"		- DatabaseConnectionString : " + $HighAvailabilityBroker.DatabaseConnectionString
    "		- DatabaseSecondaryConnectionString : " + $HighAvailabilityBroker.DatabaseSecondaryConnectionString
	"		- DatabaseFilePath : " + $HighAvailabilityBroker.DatabaseFilePath
}

#Gateway Configuration
$GatewayConfig = Get-RDDeploymentGatewayConfiguration -ConnectionBroker $ConnectionBroker
"	Gateway Mode : " + $GatewayConfig.GatewayMode
if ($GatewayConfig.GatewayMode -eq "custom")
{
"		- LogonMethod : " + $GatewayConfig.LogonMethod   
"		- GatewayExternalFQDN : " + $GatewayConfig.GatewayExternalFQDN
"		- GatewayBypassLocal : " + $GatewayConfig.BypassLocal
"		- GatewayUseCachedCredentials : " + $GatewayConfig.UseCachedCredentials

}

# RD Licencing
$LicencingConfig = Get-RDLicenseConfiguration -ConnectionBroker $ConnectionBroker
"	Licencing Mode : " + $LicencingConfig.Mode
if ($LicencingConfig.Mode -ne "NotConfigured")
{
"		- Licencing Server(s) : " + $LicencingConfig.LicenseServer.Count
foreach ($licserver in $LicencingConfig.LicenseServer)
{
"		       - Licencing Server : " + $licserver
}

}
# RD Web Access
"	Web Access Server(s) : " + $WebAccessServers.Count
foreach ($WebAccessServer in $WebAccessServers)
{
"	     - Name : " + $WebAccessServer
"	     - Url : " + "https://" + $WebAccessServer + "/rdweb"
}

# Certificates
#Get-ChildItem -Path cert:\LocalMachine\my -Recurse | Format-Table -Property DnsNameList, EnhancedKeyUsageList, NotAfter, SendAsTrustedIssuer
"	Certificates "
$certificates = Get-RDCertificate -ConnectionBroker $ConnectionBroker
foreach ($certificate in $certificates)
{
"		- Role : " + $certificate.Role
"			- Level : " + $certificate.Level
"			- Expires on : " + $certificate.ExpiresOn
"			- Issued To : " + $certificate.IssuedTo
"			- Issued By : " + $certificate.IssuedBy
"			- Thumbprint : " + $certificate.Thumbprint
"			- Subject : " + $certificate.Subject
"			- Subject Alternate Name : " + $certificate.SubjectAlternateName

}
" "

#RDS Collections
$collectionnames = Get-RDSessionCollection 
$client = $null
$connection = $null
$loadbalancing = $null 
$Security = $null
$UserGroup = $null
$UserProfileDisks = $null

"RDS Collections : "
foreach ($Collection in $collectionnames)
{
	$CollectionName = $Collection.CollectionName
	"	Collection : " +  $CollectionName	
	"		Resource Type : " + $Collection.ResourceType
	if ($Collection.ResourceType -eq "RemoteApp programs")
	{
		"			Remote Apps : "
		$remoteapps = Get-RDRemoteApp -ConnectionBroker $ConnectionBroker -CollectionName $CollectionName
		foreach ($remoteapp in $remoteapps)
		{
			"			- DisplayName : " + $remoteapp.DisplayName
			"				- Alias : " + $remoteapp.Alias
			"				- FilePath : " + $remoteapp.FilePath
			"				- Show In WebAccess : " + $remoteapp.ShowInWebAccess
			"				- CommandLineSetting : " + $remoteapp.CommandLineSetting
			"				- RequiredCommandLine : " + $remoteapp.RequiredCommandLine
			"				- UserGroups : " + $remoteapp.UserGroups
		}		
	}

#       $rdshServers		
		$rdshservers = Get-RDSessionHost -ConnectionBroker $ConnectionBroker -CollectionName $CollectionName
		"		Servers in that collection : "
		foreach ($rdshServer in $rdshservers)
		{		
			"			- SessionHost : " + $rdshServer.SessionHost			
			"				- NewConnectionAllowed : " + $rdshServer.NewConnectionAllowed			
		}		
		
		$client = Get-RDSessionCollectionConfiguration -ConnectionBroker $ConnectionBroker -CollectionName $CollectionName -Client 
		"		Client Settings : " 
		"			- MaxRedirectedMonitors : " + $client.MaxRedirectedMonitors
		"			- RDEasyPrintDriverEnabled : " + $client.RDEasyPrintDriverEnabled
		"			- ClientPrinterRedirected : " + $client.ClientPrinterRedirected
		"			- ClientPrinterAsDefault : " + $client.ClientPrinterAsDefault
		"			- ClientDeviceRedirectionOptions : " + $client.ClientDeviceRedirectionOptions
		" "
		
		$connection = Get-RDSessionCollectionConfiguration -ConnectionBroker $ConnectionBroker -CollectionName $CollectionName -Connection
		"		Connection Settings : " 
		"			- DisconnectedSessionLimitMin : " + $connection.DisconnectedSessionLimitMin
		"			- BrokenConnectionAction : " + $connection.BrokenConnectionAction
		"			- TemporaryFoldersDeletedOnExit : " + $connection.TemporaryFoldersDeletedOnExit
		"			- AutomaticReconnectionEnabled : " + $connection.AutomaticReconnectionEnabled
		"			- ActiveSessionLimitMin : " + $connection.ActiveSessionLimitMin
		"			- IdleSessionLimitMin : " + $connection.IdleSessionLimitMin
		" "
		
		$loadbalancing = Get-RDSessionCollectionConfiguration -ConnectionBroker $ConnectionBroker -CollectionName $CollectionName -LoadBalancing
		"		Load Balancing Settings : " 
		foreach ($SessHost in $loadbalancing)
		{
		"			- SessionHost : " + $SessHost.SessionHost
		"				- RelativeWeight : " + $SessHost.RelativeWeight
		"				- SessionLimit : " + $SessHost.SessionLimit
		}
		" "
		
		$Security = Get-RDSessionCollectionConfiguration -ConnectionBroker $ConnectionBroker -CollectionName $CollectionName -Security
		"		Security Settings : " 
		"			- AuthenticateUsingNLA : " + $Security.AuthenticateUsingNLA
		"			- EncryptionLevel : " + $Security.EncryptionLevel
		"			- SecurityLayer : " + $Security.SecurityLayer
		" "
		
		$UserGroup = Get-RDSessionCollectionConfiguration -ConnectionBroker $ConnectionBroker -CollectionName $CollectionName -UserGroup 
		"		User Group Settings : "
		"			- UserGroup  : " + $UserGroup.UserGroup 
		" "
		
		$UserProfileDisks = Get-RDSessionCollectionConfiguration -ConnectionBroker $ConnectionBroker -CollectionName $CollectionName -UserProfileDisk
		"		User Profile Disk Settings : "
		"			- EnableUserProfileDisk : " + $UserProfileDisks.EnableUserProfileDisk
		"			- MaxUserProfileDiskSizeGB : " + $UserProfileDisks.MaxUserProfileDiskSizeGB
		"			- DiskPath : " + $UserProfileDisks.DiskPath                 
		"			- ExcludeFilePath : " + $UserProfileDisks.ExcludeFilePath
		"			- ExcludeFolderPath : " + $UserProfileDisks.ExcludeFolderPath
		"			- IncludeFilePath : " + $UserProfileDisks.IncludeFilePath
		"			- IncludeFolderPath : " + $UserProfileDisks.IncludeFolderPath
		" "

        $CustomRdpProperty = Get-RDSessionCollectionConfiguration -ConnectionBroker $ConnectionBroker -CollectionName $CollectionName        
		"		Custom Rdp Properties : " + $CustomRdpProperty.CustomRdpProperty
		" "
				
		$usersConnected = Get-RDUserSession -ConnectionBroker $ConnectionBroker -CollectionName $CollectionName
		"		Users connected to this collection : " 
		foreach ($userconnected in $usersConnected)
		{
		"			User : " + $userConnected.DomainName + "\" + $userConnected.UserName
		"				- HostServer : " + $userConnected.HostServer
		"				- UnifiedSessionID : " + $userConnected.UnifiedSessionID
		}
		" "	 	
    }
     
     
     } 
       N {Write-Host "No, Skipping script execution "} 
       Default {Write-Host "Default, Skipping script execution"} 
     } 


# SIG # Begin signature block
# MIIjgwYJKoZIhvcNAQcCoIIjdDCCI3ACAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCBj5NmFJML+qWc5
# 1D6fqokNfS+PFeqImwF6dtw7ditDT6CCDYEwggX/MIID56ADAgECAhMzAAAB32vw
# LpKnSrTQAAAAAAHfMA0GCSqGSIb3DQEBCwUAMH4xCzAJBgNVBAYTAlVTMRMwEQYD
# VQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01pY3Jvc29mdCBDb2RlIFNpZ25p
# bmcgUENBIDIwMTEwHhcNMjAxMjE1MjEzMTQ1WhcNMjExMjAyMjEzMTQ1WjB0MQsw
# CQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9u
# ZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMR4wHAYDVQQDExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIB
# AQC2uxlZEACjqfHkuFyoCwfL25ofI9DZWKt4wEj3JBQ48GPt1UsDv834CcoUUPMn
# s/6CtPoaQ4Thy/kbOOg/zJAnrJeiMQqRe2Lsdb/NSI2gXXX9lad1/yPUDOXo4GNw
# PjXq1JZi+HZV91bUr6ZjzePj1g+bepsqd/HC1XScj0fT3aAxLRykJSzExEBmU9eS
# yuOwUuq+CriudQtWGMdJU650v/KmzfM46Y6lo/MCnnpvz3zEL7PMdUdwqj/nYhGG
# 3UVILxX7tAdMbz7LN+6WOIpT1A41rwaoOVnv+8Ua94HwhjZmu1S73yeV7RZZNxoh
# EegJi9YYssXa7UZUUkCCA+KnAgMBAAGjggF+MIIBejAfBgNVHSUEGDAWBgorBgEE
# AYI3TAgBBggrBgEFBQcDAzAdBgNVHQ4EFgQUOPbML8IdkNGtCfMmVPtvI6VZ8+Mw
# UAYDVR0RBEkwR6RFMEMxKTAnBgNVBAsTIE1pY3Jvc29mdCBPcGVyYXRpb25zIFB1
# ZXJ0byBSaWNvMRYwFAYDVQQFEw0yMzAwMTIrNDYzMDA5MB8GA1UdIwQYMBaAFEhu
# ZOVQBdOCqhc3NyK1bajKdQKVMFQGA1UdHwRNMEswSaBHoEWGQ2h0dHA6Ly93d3cu
# bWljcm9zb2Z0LmNvbS9wa2lvcHMvY3JsL01pY0NvZFNpZ1BDQTIwMTFfMjAxMS0w
# Ny0wOC5jcmwwYQYIKwYBBQUHAQEEVTBTMFEGCCsGAQUFBzAChkVodHRwOi8vd3d3
# Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NlcnRzL01pY0NvZFNpZ1BDQTIwMTFfMjAx
# MS0wNy0wOC5jcnQwDAYDVR0TAQH/BAIwADANBgkqhkiG9w0BAQsFAAOCAgEAnnqH
# tDyYUFaVAkvAK0eqq6nhoL95SZQu3RnpZ7tdQ89QR3++7A+4hrr7V4xxmkB5BObS
# 0YK+MALE02atjwWgPdpYQ68WdLGroJZHkbZdgERG+7tETFl3aKF4KpoSaGOskZXp
# TPnCaMo2PXoAMVMGpsQEQswimZq3IQ3nRQfBlJ0PoMMcN/+Pks8ZTL1BoPYsJpok
# t6cql59q6CypZYIwgyJ892HpttybHKg1ZtQLUlSXccRMlugPgEcNZJagPEgPYni4
# b11snjRAgf0dyQ0zI9aLXqTxWUU5pCIFiPT0b2wsxzRqCtyGqpkGM8P9GazO8eao
# mVItCYBcJSByBx/pS0cSYwBBHAZxJODUqxSXoSGDvmTfqUJXntnWkL4okok1FiCD
# Z4jpyXOQunb6egIXvkgQ7jb2uO26Ow0m8RwleDvhOMrnHsupiOPbozKroSa6paFt
# VSh89abUSooR8QdZciemmoFhcWkEwFg4spzvYNP4nIs193261WyTaRMZoceGun7G
# CT2Rl653uUj+F+g94c63AhzSq4khdL4HlFIP2ePv29smfUnHtGq6yYFDLnT0q/Y+
# Di3jwloF8EWkkHRtSuXlFUbTmwr/lDDgbpZiKhLS7CBTDj32I0L5i532+uHczw82
# oZDmYmYmIUSMbZOgS65h797rj5JJ6OkeEUJoAVwwggd6MIIFYqADAgECAgphDpDS
# AAAAAAADMA0GCSqGSIb3DQEBCwUAMIGIMQswCQYDVQQGEwJVUzETMBEGA1UECBMK
# V2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0
# IENvcnBvcmF0aW9uMTIwMAYDVQQDEylNaWNyb3NvZnQgUm9vdCBDZXJ0aWZpY2F0
# ZSBBdXRob3JpdHkgMjAxMTAeFw0xMTA3MDgyMDU5MDlaFw0yNjA3MDgyMTA5MDla
# MH4xCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdS
# ZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMT
# H01pY3Jvc29mdCBDb2RlIFNpZ25pbmcgUENBIDIwMTEwggIiMA0GCSqGSIb3DQEB
# AQUAA4ICDwAwggIKAoICAQCr8PpyEBwurdhuqoIQTTS68rZYIZ9CGypr6VpQqrgG
# OBoESbp/wwwe3TdrxhLYC/A4wpkGsMg51QEUMULTiQ15ZId+lGAkbK+eSZzpaF7S
# 35tTsgosw6/ZqSuuegmv15ZZymAaBelmdugyUiYSL+erCFDPs0S3XdjELgN1q2jz
# y23zOlyhFvRGuuA4ZKxuZDV4pqBjDy3TQJP4494HDdVceaVJKecNvqATd76UPe/7
# 4ytaEB9NViiienLgEjq3SV7Y7e1DkYPZe7J7hhvZPrGMXeiJT4Qa8qEvWeSQOy2u
# M1jFtz7+MtOzAz2xsq+SOH7SnYAs9U5WkSE1JcM5bmR/U7qcD60ZI4TL9LoDho33
# X/DQUr+MlIe8wCF0JV8YKLbMJyg4JZg5SjbPfLGSrhwjp6lm7GEfauEoSZ1fiOIl
# XdMhSz5SxLVXPyQD8NF6Wy/VI+NwXQ9RRnez+ADhvKwCgl/bwBWzvRvUVUvnOaEP
# 6SNJvBi4RHxF5MHDcnrgcuck379GmcXvwhxX24ON7E1JMKerjt/sW5+v/N2wZuLB
# l4F77dbtS+dJKacTKKanfWeA5opieF+yL4TXV5xcv3coKPHtbcMojyyPQDdPweGF
# RInECUzF1KVDL3SV9274eCBYLBNdYJWaPk8zhNqwiBfenk70lrC8RqBsmNLg1oiM
# CwIDAQABo4IB7TCCAekwEAYJKwYBBAGCNxUBBAMCAQAwHQYDVR0OBBYEFEhuZOVQ
# BdOCqhc3NyK1bajKdQKVMBkGCSsGAQQBgjcUAgQMHgoAUwB1AGIAQwBBMAsGA1Ud
# DwQEAwIBhjAPBgNVHRMBAf8EBTADAQH/MB8GA1UdIwQYMBaAFHItOgIxkEO5FAVO
# 4eqnxzHRI4k0MFoGA1UdHwRTMFEwT6BNoEuGSWh0dHA6Ly9jcmwubWljcm9zb2Z0
# LmNvbS9wa2kvY3JsL3Byb2R1Y3RzL01pY1Jvb0NlckF1dDIwMTFfMjAxMV8wM18y
# Mi5jcmwwXgYIKwYBBQUHAQEEUjBQME4GCCsGAQUFBzAChkJodHRwOi8vd3d3Lm1p
# Y3Jvc29mdC5jb20vcGtpL2NlcnRzL01pY1Jvb0NlckF1dDIwMTFfMjAxMV8wM18y
# Mi5jcnQwgZ8GA1UdIASBlzCBlDCBkQYJKwYBBAGCNy4DMIGDMD8GCCsGAQUFBwIB
# FjNodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2RvY3MvcHJpbWFyeWNw
# cy5odG0wQAYIKwYBBQUHAgIwNB4yIB0ATABlAGcAYQBsAF8AcABvAGwAaQBjAHkA
# XwBzAHQAYQB0AGUAbQBlAG4AdAAuIB0wDQYJKoZIhvcNAQELBQADggIBAGfyhqWY
# 4FR5Gi7T2HRnIpsLlhHhY5KZQpZ90nkMkMFlXy4sPvjDctFtg/6+P+gKyju/R6mj
# 82nbY78iNaWXXWWEkH2LRlBV2AySfNIaSxzzPEKLUtCw/WvjPgcuKZvmPRul1LUd
# d5Q54ulkyUQ9eHoj8xN9ppB0g430yyYCRirCihC7pKkFDJvtaPpoLpWgKj8qa1hJ
# Yx8JaW5amJbkg/TAj/NGK978O9C9Ne9uJa7lryft0N3zDq+ZKJeYTQ49C/IIidYf
# wzIY4vDFLc5bnrRJOQrGCsLGra7lstnbFYhRRVg4MnEnGn+x9Cf43iw6IGmYslmJ
# aG5vp7d0w0AFBqYBKig+gj8TTWYLwLNN9eGPfxxvFX1Fp3blQCplo8NdUmKGwx1j
# NpeG39rz+PIWoZon4c2ll9DuXWNB41sHnIc+BncG0QaxdR8UvmFhtfDcxhsEvt9B
# xw4o7t5lL+yX9qFcltgA1qFGvVnzl6UJS0gQmYAf0AApxbGbpT9Fdx41xtKiop96
# eiL6SJUfq/tHI4D1nvi/a7dLl+LrdXga7Oo3mXkYS//WsyNodeav+vyL6wuA6mk7
# r/ww7QRMjt/fdW1jkT3RnVZOT7+AVyKheBEyIXrvQQqxP/uozKRdwaGIm1dxVk5I
# RcBCyZt2WwqASGv9eZ/BvW1taslScxMNelDNMYIVWDCCFVQCAQEwgZUwfjELMAkG
# A1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQx
# HjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEoMCYGA1UEAxMfTWljcm9z
# b2Z0IENvZGUgU2lnbmluZyBQQ0EgMjAxMQITMwAAAd9r8C6Sp0q00AAAAAAB3zAN
# BglghkgBZQMEAgEFAKCBrjAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAcBgor
# BgEEAYI3AgELMQ4wDAYKKwYBBAGCNwIBFTAvBgkqhkiG9w0BCQQxIgQg7mdtvlBO
# IMWsxAur8iFPmEjbLKDu4lqJ9LA8l1roRLYwQgYKKwYBBAGCNwIBDDE0MDKgFIAS
# AE0AaQBjAHIAbwBzAG8AZgB0oRqAGGh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbTAN
# BgkqhkiG9w0BAQEFAASCAQCqxi6g9Ubnmt33WGQARMG6qd0ROep1NZl6s1OBOLHh
# AMzg7nb+m+1JeVjnQTClEuWYktyVKmbNLThUbeFJQQHqHzQSewkn9LthcM41BrLc
# ERliIlDrEwNlrFD4cndY912TdTlOB81LOezOe1kLTnvoTNjJjze6jEZR2WtIsc/U
# 7lnmx/JlIBRtlliCYUVxbDpnqhTlvE0z5mc/GxXou0+VzQJmbKeiOMWWM2ogQ4si
# o8YfUK9A4fz3quf9OU2EWPZs0KkZSdNol0CYAfg5CZUc69GCv3qsEVv9JHfhHjW6
# q/QqKedTJ2tLKsKgEBm8I79K4ccHNFr+IFsQwOgFqfC/oYIS4jCCEt4GCisGAQQB
# gjcDAwExghLOMIISygYJKoZIhvcNAQcCoIISuzCCErcCAQMxDzANBglghkgBZQME
# AgEFADCCAVEGCyqGSIb3DQEJEAEEoIIBQASCATwwggE4AgEBBgorBgEEAYRZCgMB
# MDEwDQYJYIZIAWUDBAIBBQAEIGVtghZIN8BZN5ldvIY/HHq4m7awOyjWV4rB2Z+6
# 3RekAgZg0RRmhZEYEzIwMjEwNjI0MDkyMTQ0Ljc2MlowBIACAfSggdCkgc0wgcox
# CzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRt
# b25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJTAjBgNVBAsTHE1p
# Y3Jvc29mdCBBbWVyaWNhIE9wZXJhdGlvbnMxJjAkBgNVBAsTHVRoYWxlcyBUU1Mg
# RVNOOjhBODItRTM0Ri05RERBMSUwIwYDVQQDExxNaWNyb3NvZnQgVGltZS1TdGFt
# cCBTZXJ2aWNloIIOOTCCBPEwggPZoAMCAQICEzMAAAFLT7KmSNXkwlEAAAAAAUsw
# DQYJKoZIhvcNAQELBQAwfDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0
# b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3Jh
# dGlvbjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIwMTAwHhcN
# MjAxMTEyMTgyNTU5WhcNMjIwMjExMTgyNTU5WjCByjELMAkGA1UEBhMCVVMxEzAR
# BgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1p
# Y3Jvc29mdCBDb3Jwb3JhdGlvbjElMCMGA1UECxMcTWljcm9zb2Z0IEFtZXJpY2Eg
# T3BlcmF0aW9uczEmMCQGA1UECxMdVGhhbGVzIFRTUyBFU046OEE4Mi1FMzRGLTlE
# REExJTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1wIFNlcnZpY2UwggEiMA0G
# CSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQChNnpQx3YuJr/ivobPoLtpQ9egUFl8
# THdWZ6SAKIJdtP3L24D3/d63ommmjZjCyrQm+j/1tHDAwjQGuOwYvn79ecPCQfAB
# 91JnEp/wP4BMF2SXyMf8k9R84RthIdfGHPXTWqzpCCfNWolVEcUVm8Ad/r1LrikR
# O+4KKo6slDQJKsgKApfBU/9J7Rudvhw1rEQw0Nk1BRGWjrIp7/uWoUIfR4rcl6U1
# utOiYIonC87PPpAJQXGRsDdKnVFF4NpWvMiyeuksn5t/Otwz82sGlne/HNQpmMzi
# gR8cZ8eXEDJJNIZxov9WAHHj28gUE29D8ivAT706ihxvTv50ZY8W51uxAgMBAAGj
# ggEbMIIBFzAdBgNVHQ4EFgQUUqpqftASlue6K3LePlTTn01K68YwHwYDVR0jBBgw
# FoAU1WM6XIoxkPNDe3xGG8UzaFqFbVUwVgYDVR0fBE8wTTBLoEmgR4ZFaHR0cDov
# L2NybC5taWNyb3NvZnQuY29tL3BraS9jcmwvcHJvZHVjdHMvTWljVGltU3RhUENB
# XzIwMTAtMDctMDEuY3JsMFoGCCsGAQUFBwEBBE4wTDBKBggrBgEFBQcwAoY+aHR0
# cDovL3d3dy5taWNyb3NvZnQuY29tL3BraS9jZXJ0cy9NaWNUaW1TdGFQQ0FfMjAx
# MC0wNy0wMS5jcnQwDAYDVR0TAQH/BAIwADATBgNVHSUEDDAKBggrBgEFBQcDCDAN
# BgkqhkiG9w0BAQsFAAOCAQEAFtq51Zc/O1AfJK4tEB2Nr8bGEVD5qQ8l8gXIQMrM
# ZYtddHH+cGiqgF/4GmvmPfl5FAYh+gf/8Yd3q4/iD2+K4LtJbs/3v6mpyBl1mQ4v
# usK65dAypWmiT1W3FiXjsmCIkjSDDsKLFBYH5yGFnNFOEMgL+O7u4osH42f80nc2
# WdnZV6+OvW035XPV6ZttUBfFWHdIbUkdOG1O2n4yJm10OfacItZ08fzgMMqE+f/S
# TgVWNCHbR2EYqTWayrGP69jMwtVD9BGGTWti1XjpvE6yKdO8H9nuRi3L+C6jYntf
# aEmBTbnTFEV+kRx1CNcpSb9os86CAUehZU1aRzQ6CQ/pjzCCBnEwggRZoAMCAQIC
# CmEJgSoAAAAAAAIwDQYJKoZIhvcNAQELBQAwgYgxCzAJBgNVBAYTAlVTMRMwEQYD
# VQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24xMjAwBgNVBAMTKU1pY3Jvc29mdCBSb290IENlcnRp
# ZmljYXRlIEF1dGhvcml0eSAyMDEwMB4XDTEwMDcwMTIxMzY1NVoXDTI1MDcwMTIx
# NDY1NVowfDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNV
# BAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQG
# A1UEAxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIwMTAwggEiMA0GCSqGSIb3
# DQEBAQUAA4IBDwAwggEKAoIBAQCpHQ28dxGKOiDs/BOX9fp/aZRrdFQQ1aUKAIKF
# ++18aEssX8XD5WHCdrc+Zitb8BVTJwQxH0EbGpUdzgkTjnxhMFmxMEQP8WCIhFRD
# DNdNuDgIs0Ldk6zWczBXJoKjRQ3Q6vVHgc2/JGAyWGBG8lhHhjKEHnRhZ5FfgVSx
# z5NMksHEpl3RYRNuKMYa+YaAu99h/EbBJx0kZxJyGiGKr0tkiVBisV39dx898Fd1
# rL2KQk1AUdEPnAY+Z3/1ZsADlkR+79BL/W7lmsqxqPJ6Kgox8NpOBpG2iAg16Hgc
# sOmZzTznL0S6p/TcZL2kAcEgCZN4zfy8wMlEXV4WnAEFTyJNAgMBAAGjggHmMIIB
# 4jAQBgkrBgEEAYI3FQEEAwIBADAdBgNVHQ4EFgQU1WM6XIoxkPNDe3xGG8UzaFqF
# bVUwGQYJKwYBBAGCNxQCBAweCgBTAHUAYgBDAEEwCwYDVR0PBAQDAgGGMA8GA1Ud
# EwEB/wQFMAMBAf8wHwYDVR0jBBgwFoAU1fZWy4/oolxiaNE9lJBb186aGMQwVgYD
# VR0fBE8wTTBLoEmgR4ZFaHR0cDovL2NybC5taWNyb3NvZnQuY29tL3BraS9jcmwv
# cHJvZHVjdHMvTWljUm9vQ2VyQXV0XzIwMTAtMDYtMjMuY3JsMFoGCCsGAQUFBwEB
# BE4wTDBKBggrBgEFBQcwAoY+aHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraS9j
# ZXJ0cy9NaWNSb29DZXJBdXRfMjAxMC0wNi0yMy5jcnQwgaAGA1UdIAEB/wSBlTCB
# kjCBjwYJKwYBBAGCNy4DMIGBMD0GCCsGAQUFBwIBFjFodHRwOi8vd3d3Lm1pY3Jv
# c29mdC5jb20vUEtJL2RvY3MvQ1BTL2RlZmF1bHQuaHRtMEAGCCsGAQUFBwICMDQe
# MiAdAEwAZQBnAGEAbABfAFAAbwBsAGkAYwB5AF8AUwB0AGEAdABlAG0AZQBuAHQA
# LiAdMA0GCSqGSIb3DQEBCwUAA4ICAQAH5ohRDeLG4Jg/gXEDPZ2joSFvs+umzPUx
# vs8F4qn++ldtGTCzwsVmyWrf9efweL3HqJ4l4/m87WtUVwgrUYJEEvu5U4zM9GAS
# inbMQEBBm9xcF/9c+V4XNZgkVkt070IQyK+/f8Z/8jd9Wj8c8pl5SpFSAK84Dxf1
# L3mBZdmptWvkx872ynoAb0swRCQiPM/tA6WWj1kpvLb9BOFwnzJKJ/1Vry/+tuWO
# M7tiX5rbV0Dp8c6ZZpCM/2pif93FSguRJuI57BlKcWOdeyFtw5yjojz6f32WapB4
# pm3S4Zz5Hfw42JT0xqUKloakvZ4argRCg7i1gJsiOCC1JeVk7Pf0v35jWSUPei45
# V3aicaoGig+JFrphpxHLmtgOR5qAxdDNp9DvfYPw4TtxCd9ddJgiCGHasFAeb73x
# 4QDf5zEHpJM692VHeOj4qEir995yfmFrb3epgcunCaw5u+zGy9iCtHLNHfS4hQEe
# gPsbiSpUObJb2sgNVZl6h3M7COaYLeqN4DMuEin1wC9UJyH3yKxO2ii4sanblrKn
# QqLJzxlBTeCG+SqaoxFmMNO7dDJL32N79ZmKLxvHIa9Zta7cRDyXUHHXodLFVeNp
# 3lfB0d4wwP3M5k37Db9dT+mdHhk4L7zPWAUu7w2gUDXa7wknHNWzfjUeCLraNtvT
# X4/edIhJEqGCAsswggI0AgEBMIH4oYHQpIHNMIHKMQswCQYDVQQGEwJVUzETMBEG
# A1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWlj
# cm9zb2Z0IENvcnBvcmF0aW9uMSUwIwYDVQQLExxNaWNyb3NvZnQgQW1lcmljYSBP
# cGVyYXRpb25zMSYwJAYDVQQLEx1UaGFsZXMgVFNTIEVTTjo4QTgyLUUzNEYtOURE
# QTElMCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUtU3RhbXAgU2VydmljZaIjCgEBMAcG
# BSsOAwIaAxUAkToz97fseHxNOUSQ5O/bBVSF+e6ggYMwgYCkfjB8MQswCQYDVQQG
# EwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwG
# A1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQg
# VGltZS1TdGFtcCBQQ0EgMjAxMDANBgkqhkiG9w0BAQUFAAIFAOR+NdAwIhgPMjAy
# MTA2MjQwNjM2MDBaGA8yMDIxMDYyNTA2MzYwMFowdDA6BgorBgEEAYRZCgQBMSww
# KjAKAgUA5H410AIBADAHAgEAAgIP5DAHAgEAAgITHDAKAgUA5H+HUAIBADA2Bgor
# BgEEAYRZCgQCMSgwJjAMBgorBgEEAYRZCgMCoAowCAIBAAIDB6EgoQowCAIBAAID
# AYagMA0GCSqGSIb3DQEBBQUAA4GBAFm+8FsZFFZtF/IzdOVTii3Uyp3gfHwHHpXT
# IuZFLUHGmjWLQelcgtiisOOClRj1s4w8ALFx3dE1qi4IpirZ6PA8Es4LgxvWp6xb
# fwmFcZ/XN6VwgFuVIqsDc0W74gvPZswTIOZk1Tf/ZlXT6imzYcaR36eVop8hqTEl
# sZgMctsPMYIDDTCCAwkCAQEwgZMwfDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldh
# c2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBD
# b3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIw
# MTACEzMAAAFLT7KmSNXkwlEAAAAAAUswDQYJYIZIAWUDBAIBBQCgggFKMBoGCSqG
# SIb3DQEJAzENBgsqhkiG9w0BCRABBDAvBgkqhkiG9w0BCQQxIgQgH3YbFRRhK/0z
# JBXr2eNs5P9vQaf53JYIsx8PJGcUtSwwgfoGCyqGSIb3DQEJEAIvMYHqMIHnMIHk
# MIG9BCBr9u6EInnsZYEts/Fj/rIFv0YZW1ynhXKOP2hVPUU5IzCBmDCBgKR+MHwx
# CzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRt
# b25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1p
# Y3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwAhMzAAABS0+ypkjV5MJRAAAAAAFL
# MCIEIJ9JMqz7DLR5kXSV9CUyX0oIQp90P/RiCYoicKh+9FM6MA0GCSqGSIb3DQEB
# CwUABIIBAAwX/o0eYIO5ixTM3ntSLbfP8hD8G8I2DZUl8MyxUeesMzm6Jl79Tw82
# E8YLSMAd/FtQaxouUdqZCobsmCLkfAHNnUfQNZxpTYmi2XIoYW6n+WfXwcmqJycd
# ZTBEfNmO/i0fmaBcAWYRWTLBkPw+XHcoyIFBpVs8UUPRkvvIgC3i2jxPtJ+BU1Rh
# UD38RZehgNb5ZAPRKm8lL+lQ1JRC9lDexrB7dI26X/8Z4NqJKWAB4aPLnF6PGmiW
# WnQ5xqX3A7KNmL5YVWiKVqdqOogwcWqGEPXCNA6iO74x8aBiv40OhXFpkGr5JvwZ
# 24XiqG+yGHqKgDB22npm75vj8anBMN8=
# SIG # End signature block
