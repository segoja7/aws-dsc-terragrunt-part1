<powershell>
New-NetFirewallRule -DisplayName 'Allow local VPC' -Direction Inbound -LocalAddress 172.16.0.0/16 -LocalPort Any -Action Allow
# Instalar y cargar el proveedor NuGet
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
Import-PackageProvider -Name NuGet -Force
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted

#Powershell DSC modules
#DSC module IIS
Install-Module -Name WebAdministrationDsc -Force -RequiredVersion 4.1.0 -Confirm:$false
</powershell>