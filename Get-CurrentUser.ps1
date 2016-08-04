Function Get-CurrentUser
{
<#
.Synopsis
Gets the currently logged in user on a machine

.DESCRIPTION
Gets the currently logged in user on a machine

.NOTES   
Name: Get-CurrentUser
Author: Jacob Boykin

.PARAMETER ComputerName
The computer in which the current user will be fetched from

.EXAMPLE
Get-CurrentUser client01

Description:
Will fetch the currently logged in user on client01

.EXAMPLE
Get-CurrentUser client01, client02, client03

Description:
Will fetch the currently logged in users on client01, client02 and client03

.EXAMPLE
GCU client01

Description:
Will fetch the currently logged in user on client01 using the short-hand 'GCU' alias

.EXAMPLE
'client01' | Get-CurrentUser

Description:
Will fetch the currently logged in user on client01 using the piped input

#>
    [CmdletBinding(SupportsShouldProcess=$true)]
    param(
        [Parameter(ValueFromPipeline=$true,
            ValueFromPipelineByPropertyName=$true,
            Position=0)]
        [string[]] $ComputerName = $env:COMPUTERNAME
    )

    begin
    {
        $results = @()
    }
    
    process
    {
        foreach ($computer in $ComputerName)
        {
            $result = New-Object System.Object

            try
            {
                if (!(Test-Connection -Computername $computer -BufferSize 16 -Count 2 -Quiet))
                {
                    throw "computerOffline"
                }

                $ErrorActionPreference = "Stop"

                $userInfo = gwmi win32_computersystem -ComputerName $computer
                $userInfo | Select Username,Caption | out-null
                $username = $userInfo.Username
            }
            catch
            {
                Switch -Wildcard ($Error[0].Exception)
                {
                    "*computerOffline*"
                    {
                        Write-Host -BackgroundColor Black -ForegroundColor Red "`n$computer appears to be offline!`n"      
                    }
                    Default
                    {
                        Write-Host -BackgroundColor Black -ForegroundColor Red "`nUnable to fetch username!`n"
                        Write-Host -BackgroundColor black -ForegroundColor Red $Error[0].Exception
                    }
                }

                $username = 'unknown'  
            }
            finally
            {
                $result | Add-Member -MemberType NoteProperty -Name "Username" -Value $username
                $result | Add-Member -MemberType NoteProperty -Name "Computer" -Value $computer
                $results += $result
            }
        }
    }
    
    end
    {
        $results
    }
}
