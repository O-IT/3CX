<#
    .SYNOPSIS
        Get 3CX System Status
    .DESCRIPTION
        Retrieve the 3CX System Status which alot of information about the 3CX system
    .EXAMPLE
        PS> Get-3CXSystemStatus
    .OUTPUTS
        powershell object containing the 3CX response
#>
function Get-3CXSystemStatus {
    [CmdletBinding()]
    param()
    return Get-3CXResult -Endpoint "/xapi/v1/SystemStatus"
}