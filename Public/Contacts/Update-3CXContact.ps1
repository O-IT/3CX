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
        $Business = "",

        [Parameter(Mandatory=$false)]
        [ValidateNotNull()]
        $Business2 = "",

        [Parameter(Mandatory=$false)]
        [ValidateNotNull()]
        $BusinessFax ="",

        [Parameter(Mandatory=$false)]
        [ValidateNotNull()]
        $CompanyName = "",

        [Parameter(Mandatory=$false)]
        [ValidateNotNull()]
        $Department = "",

        [Parameter(Mandatory=$false)]
        [ValidateNotNull()]
        $Email = "",

        [Parameter(Mandatory=$false)]
        [ValidateNotNull()]
        $FirstName = "",

        [Parameter(Mandatory=$false)]
        [ValidateNotNull()]
        $HomeVar = "",

        [Parameter(Mandatory=$false)]
        [ValidateNotNull()]
        $LastName = "",

        [Parameter(Mandatory=$false)]
        [ValidateNotNull()]
        $Mobile2 = "",

        [Parameter(Mandatory=$false)]
        [ValidateNotNull()]
        $Other = "",

        [Parameter(Mandatory=$false)]
        [ValidateNotNull()]
        $PhoneNumber = "",

        [Parameter(Mandatory=$false)]
        [ValidateNotNull()]
        $Title = ""
    )
    $body = @{}
    if ($Business) { $body['Business'] = $Business }
    if ($Business2) { $body['Business2'] = $Business2 }
    if ($BusinessFax) { $body['BusinessFax'] = $BusinessFax }
    if ($CompanyName) { $body['CompanyName'] = $CompanyName }
    if ($Department) { $body['Department'] = $Department }
    if ($Email) { $body['Email'] = $Email }
    if ($FirstName) { $body['FirstName'] = $FirstName }
    if ($HomeVar) { $body['Home'] = $HomeVar }
    if ($LastName) { $body['LastName'] = $LastName }
    if ($Mobile2) { $body['Mobile2'] = $Mobile2 }
    if ($Other) { $body['Other'] = $Other }
    if ($PhoneNumber) { $body['PhoneNumber'] = $PhoneNumber }
    if ($Title) { $body['Title'] = $Title }

    if ($body.Count -eq 0) {
        throw "At least one parameter must be provided to update a contact."
    }

    return Get-3CXResult -Endpoint ("/xapi/v1/Contacts({0})" -f $Id) -Method 'PATCH' -Body $body
}