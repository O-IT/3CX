<#
    .SYNOPSIS
        Get 3CX SBCs
    .DESCRIPTION
        Retrieve the 3CX SBCs
    .EXAMPLE
        PS> Get-3CXSBC
    .OUTPUTS
        powershell object containing the 3CX response
#>
function Get-3CXSBC {
    [CmdletBinding(DefaultParameterSetName = "Default")]
    param(
        [Parameter(Mandatory=$True, ParameterSetName="Single")]
        $Name,
        
        [Parameter(Mandatory=$False, ParameterSetName="Single")]
        [Parameter(Mandatory=$False, ParameterSetName="Default")]
        [string[]]$PageSelect = @()
    )

    $params = @{
        Endpoint = "/xapi/v1/sbcs"
        ID = $Name
        PageSelect = $PageSelect
    }
    
    return Get-3CXResult @params
}