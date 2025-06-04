<#
    .SYNOPSIS
        Add 3CX Contact
    .DESCRIPTION
        
    .EXAMPLE
        PS> Add-3CXContact
    .OUTPUTS
        powershell object containing the 3CX response
#>
function Update-3CXContact {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [ValidateNotNull()]
        [int]$Id,
        
        [Parameter(Mandatory=$false)]
        [ValidateNotNull()]
        $Business = $null,

        [Parameter(Mandatory=$false)]
        [ValidateNotNull()]
        $Business2 = $null,

        [Parameter(Mandatory=$false)]
        [ValidateNotNull()]
        $BusinessFax = $null,

        [Parameter(Mandatory=$false)]
        [ValidateNotNull()]
        $CompanyName = $null,

        [Parameter(Mandatory=$false)]
        [ValidateNotNull()]
        $Department = $null,

        [Parameter(Mandatory=$false)]
        [ValidateNotNull()]
        $Email = $null,

        [Parameter(Mandatory=$false)]
        [ValidateNotNull()]
        $FirstName = $null,

        [Parameter(Mandatory=$false)]
        [ValidateNotNull()]
        $HomeVar = $null,

        [Parameter(Mandatory=$false)]
        [ValidateNotNull()]
        $LastName = $null,

        [Parameter(Mandatory=$false)]
        [ValidateNotNull()]
        $Mobile2 = $null,

        [Parameter(Mandatory=$false)]
        [ValidateNotNull()]
        $Other = $null,

        [Parameter(Mandatory=$false)]
        [ValidateNotNull()]
        $PhoneNumber = $null,

        [Parameter(Mandatory=$false)]
        [ValidateNotNull()]
        $Title = $null
    )
    $body = @{}
    if ($null -ne $Business) { $body['Business'] = $Business }
    if ($null -ne $Business2) { $body['Business2'] = $Business2 }
    if ($null -ne $BusinessFax) { $body['BusinessFax'] = $BusinessFax }
    if ($null -ne $CompanyName) { $body['CompanyName'] = $CompanyName }
    if ($null -ne $Department) { $body['Department'] = $Department }
    if ($null -ne $Email) { $body['Email'] = $Email }
    if ($null -ne $FirstName) { $body['FirstName'] = $FirstName }
    if ($null -ne $HomeVar) { $body['Home'] = $HomeVar }
    if ($null -ne $LastName) { $body['LastName'] = $LastName }
    if ($null -ne $Mobile2) { $body['Mobile2'] = $Mobile2 }
    if ($null -ne $Other) { $body['Other'] = $Other }
    if ($null -ne $PhoneNumber) { $body['PhoneNumber'] = $PhoneNumber }
    if ($null -ne $Title) { $body['Title'] = $Title }

    if ($body.Count -eq 0) {
        throw "At least one parameter must be provided to update a contact."
    }

    return Get-3CXResult -Endpoint ("/xapi/v1/Contacts({0})" -f $Id) -Method 'PATCH' -Body $body
}