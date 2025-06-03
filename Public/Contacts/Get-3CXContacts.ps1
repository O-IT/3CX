<#
    .SYNOPSIS
        Get 3CX Contacts
    .DESCRIPTION
        Retrieve the 3CX Contacts
    .EXAMPLE
        PS> Get-3CXContacts
    .OUTPUTS
        powershell object containing the 3CX response
#>
function Get-3CXContacts {
    [CmdletBinding(DefaultParameterSetName = "All")]
    param(
        [Parameter(Mandatory=$false, ParameterSetName="Search")]
        [string]$Search,
        [Parameter(Mandatory=$false, ParameterSetName="Tag")]
        [string]$Tag
    )
    
    $body = $null
    switch($PSCmdlet.ParameterSetName){
        "Search" {
            $body = @{ '$search' = ('"{0}"' -f $Search) }
        }
        "Tag" {
            $body = @{ '$filter' = ('contains(Tag,''{0}'')' -f $Tag) }
        }
    }
    return Get-3CXResult -Endpoint "/xapi/v1/Contacts" -Body $body
}