<#
    .SYNOPSIS
        Get 3CX Trunks
    .DESCRIPTION
        Retrieve the 3CX Trunks
    .EXAMPLE
        PS> Get-3CXTrunks
    .OUTPUTS
        powershell object containing the 3CX response
#>
function Get-3CXTrunk {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$False)]
        $ID = $null
    )

    $params = @{
        Endpoint = "/xapi/v1/Trunks"
        ID = $ID
    }
    
    return Get-3CXResult @params
}