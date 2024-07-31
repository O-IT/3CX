<#
    .SYNOPSIS
        Get 3CX System Health
    .DESCRIPTION
        Retrieve the 3CX System Health which contains firewall, trunks and phones health
    .EXAMPLE
        PS> Get-3CXSystemHealth
    .OUTPUTS
        powershell object containing the 3CX response
#>
function Get-3CXSystemHealth {
    [CmdletBinding()]
    param()
    return Get-3CXResult -Endpoint "/xapi/v1/SystemStatus/Pbx.SystemHealthStatus()"
}