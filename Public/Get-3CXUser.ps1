<#
    .SYNOPSIS
        Get 3CX User
    .DESCRIPTION
        Retrieve the 3CX User
    .EXAMPLE
        PS> Get-3CXUser
    .OUTPUTS
        powershell object containing the 3CX response
#>
function Get-3CXUser {
    [CmdletBinding()]
    param()
    $params = @{
        Endpoint = '/xapi/v1/Users'
        Paginate = $true
        PageFilter = "not startsWith(Number,'HD')"
        PageOrderBy = "Number"
        PageSelect = "IsRegistered,CurrentProfileName,DisplayName,Id,EmailAddress,Number,Tags,Require2FA"
        PageExpand = 'Groups($select=GroupId,Name,Rights;$filter=not startsWith(Name,''___FAVORITES___'');$expand=Rights($select=RoleName)),Phones($select=MacAddress,Name,Settings($select=IsSBC,ProvisionType))'
    }
    return Get-3CXResult @params
}
