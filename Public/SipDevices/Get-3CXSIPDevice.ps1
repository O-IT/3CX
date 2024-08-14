<#
    .SYNOPSIS
        Get 3CX SIP Device
    .DESCRIPTION
        Retrieve the 3CX SIP Device(s)
    .EXAMPLE
        PS> Get-3CXSIPDevice
    .OUTPUTS
        powershell object containing the 3CX response
#>
function Get-3CXSIPDevice {
    [CmdletBinding()]
    param()
    $params = @{
        Endpoint = '/xapi/v1/SipDevices'
        Paginate = $true
        PageExpand = 'DN'
        PageFilter = "DN/Type eq 'Extension'"
        PageOrderBy = "DN/Number"
    }
    return Get-3CXResult @params
}