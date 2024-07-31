function Get-3CXResult {
    [CmdletBinding()]
    param(
        [ValidateNotNull()]
        [string]$Endpoint,
        [string]$Method = 'GET'
    )

    if($null -eq $script:3CXSession){
        throw "3CX session not established - Please run Connect-3CX"
    }

    $params = @{
        Uri = ("https://{0}:{1}{2}" -f $script:3CXSession.APIHost, $script:APIPort, $Endpoint)
        Method = $Method
        Headers = @{
            Authorization = "Bearer $($script:3CXSession.AccessToken)"
        } 
    }
    Write-Debug ($params | ConvertTo-Json)
    $result = Invoke-WebRequest @params 
    return $result.Content | ConvertFrom-Json
}