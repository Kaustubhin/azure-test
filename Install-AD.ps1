Set-ExecutionPolicy RemoteSigned -Force
# Create New Forest, add Domain Controller
$domainname = "koinfo.net"
$netbiosName = "HQDOMAIN"
$params = @{
'-DatabasePath'= 'C:\Windows\NTDS';
'-DomainMode' = 'Default';
'-DomainName' = $domainname;
'-DomainNetbiosName' = $netbiosName;
'-ForestMode' = 'Default';
'-InstallDns' = $true;
'-LogPath' = 'C:\Windows\NTDS';
'-NoRebootOnCompletion' = $false;
'-SysvolPath' = 'C:\Windows\SYSVOL';
'-Force' = $true;
'-SafeModeAdministratorPassword' = (ConvertTo-SecureString 'Adm1n!$tr@tor' -AsPlainText -Force);}
Install-WindowsFeature -name AD-Domain-Services -IncludeManagementTools
Import-Module ADDSDeployment
Install-ADDSForest @params -CreateDnsDelegation:$false 
