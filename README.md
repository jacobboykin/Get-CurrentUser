# Get-CurrentUser

Powershell module to retreive the currently logged in user on a remote host. 

NAME
    Get-CurrentUser
    
SYNOPSIS
    Gets the currently logged in user on a machine
    
SYNTAX
    Get-CurrentUser [[-ComputerName] <String[]>] [-WhatIf] [-Confirm] [<CommonParameters>]
    
    
DESCRIPTION
    Gets the currently logged in user on a machine
    

PARAMETERS
    -ComputerName <String[]>
        The computer in which the current user will be fetched from
        
        Required?                    false
        Position?                    1
        Default value                $env:COMPUTERNAME
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Accept wildcard characters?  false
        
    -WhatIf [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    -Confirm [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see 
        about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
NOTES
    
    
        Name: Get-CurrentUser
        Author: Jacob Boykin
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Get-CurrentUser client01
    
    
    Description:
    Will fetch the currently logged in user on client01
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    C:\PS>Get-CurrentUser client01, client02, client03
    
    
    Description:
    Will fetch the currently logged in users on client01, client02 and client03
    
    
    
    
    
    -------------------------- EXAMPLE 3 --------------------------
    
    C:\PS>GCU client01
    
    
    Description:
    Will fetch the currently logged in user on client01 using the short-hand 'GCU' alias
    
    
    
    
    
    -------------------------- EXAMPLE 4 --------------------------
    
    C:\PS>'client01' | Get-CurrentUser
    
    
    Description:
    Will fetch the currently logged in user on client01 using the piped input
    
    
    
    
    
    
RELATED LINKS
