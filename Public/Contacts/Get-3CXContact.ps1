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
function Get-3CXContact {
    [CmdletBinding(DefaultParameterSetName = "Id")]
    param(
        [Parameter(Mandatory=$true, ParameterSetName="Id")]
        [ValidateNotNullOrEmpty()]
        [string]$Id
    )

    return Get-3CXResult -Endpoint ("/xapi/v1/Contacts({0})" -f $Id)
}