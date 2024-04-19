configuration website { #This is structure of dsc it is using the keyword configuration and the name website.

    Import-DscResource -ModuleName WebAdministrationDsc -ModuleVersion 4.1.0 #This line is for import the module that it is using with the version.

    Node $env:COMPUTERNAME #Define the name the node, you can use localhost for example.

    {
        WindowsFeature IIS #Module
        {
            Ensure          = 'Present'
            Name            = 'Web-Server'
        }
        WindowsFeature AspNet45
        {
            Ensure          = 'Present'
            Name            = 'Web-Asp-Net45'
        }

        WebSite DefaultSite
        {
            Ensure          = 'Present'
            Name            = 'Default Web Site'
            State           = 'Stopped'
            ServerAutoStart = $false
            PhysicalPath    = 'C:\inetpub\wwwroot'
            DependsOn       = '[WindowsFeature]IIS'
        }

        File WebContent
        {
            Ensure          = 'Present'
            DestinationPath = 'C:\segoja7\www\index.html'
            Recurse         = $true
            Type            = 'File'
            Contents        = 'cloud people website using dsc'
            DependsOn       = '[WindowsFeature]AspNet45'
        }
        WebSite NewWebsite
        {
            Ensure          = 'Present'
            Name            = 'segoja7'
            State           = 'Started'
            ServerAutoStart = $true
            PhysicalPath    = 'C:\segoja7\www\'
            DependsOn       = '[File]WebContent'
        }
    }
}

website -OutputPath ".\website"
Start-DscConfiguration -Path ".\website" -Wait -Force -ComputerName $env:COMPUTERNAME