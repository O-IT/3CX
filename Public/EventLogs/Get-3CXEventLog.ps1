<#
    .SYNOPSIS
        Get 3CX Event Log
    .DESCRIPTION
        Retrieve the 3CX Event Log
    .EXAMPLE
        PS> Get-3CXEventLog
    .OUTPUTS
        powershell object containing the 3CX response
#>
function Get-3CXEventLog {
    [CmdletBinding()]
    param()
    $params = @{
        Endpoint = '/xapi/v1/EventLogs'
        Paginate = $true
        PageFilter = "Type eq 'Info' or Type eq 'Warning' or Type eq 'Error'"
        PageOrderBy = "TimeGenerated desc"
    }
    return Get-3CXResult @params
}