function Get-3CXResult {
    [CmdletBinding()]
    param(

        [Parameter(Mandatory=$True, ParameterSetName="Simple")]
        [Parameter(Mandatory=$True, ParameterSetName="Paginate")]
        [string]$Endpoint,

        [Parameter(Mandatory=$False, ParameterSetName="Simple")]
        [Parameter(Mandatory=$False, ParameterSetName="Paginate")]
        [object]$Body = $null,

        [Parameter(Mandatory=$False, ParameterSetName="Simple")]
        [string]$Method = 'GET',
        
        [Parameter(Mandatory=$True, ParameterSetName="Paginate")]
        [switch]$Paginate,

        [Parameter(Mandatory=$False, ParameterSetName="Paginate")]
        [int]$PageSize = 50,
        
        [Parameter(Mandatory=$False, ParameterSetName="Paginate")]
        [string]$PageFilter = '',

        [Parameter(Mandatory=$False, ParameterSetName="Paginate")]
        [string]$PageOrderBy = '',

        [Parameter(Mandatory=$False, ParameterSetName="Paginate")]
        [string]$PageSelect = '',
        
        [Parameter(Mandatory=$False, ParameterSetName="Paginate")]
        [string]$PageExpand = ''
    )

    if($null -eq $script:3CXSession){
        throw "3CX session not established - Please run Connect-3CX"
    }

    switch($PSCmdlet.ParameterSetName){

        "Simple" {
            $params = @{
                Uri = ("https://{0}:{1}{2}" -f $script:3CXSession.APIHost, $script:3CXSession.APIPort, $Endpoint)
                Method = $Method
                Headers = @{
                    Authorization = "Bearer $($script:3CXSession.AccessToken)"
                } 
                Body = $Body
            }
            Write-Debug "Parameter $($params | ConvertTo-Json)"

            $result = Invoke-WebRequest @params 
            Write-Debug "Raw Content Result $($result.Content)"

            return ($result.Content | ConvertFrom-Json)
        }

        "Paginate" {

            $targetCount = -1
            $values = New-Object Collections.Generic.List[object]

            while($targetCount -lt 0 -or $values.Count -lt $targetCount){
                Write-Verbose "Retrieving SIP Devices from Top $PageSize and Skip $($values.Count)"
                $body = @{
                    '$top' = $PageSize
                    '$skip' = $values.Count
                    '$count' = 'true'
                }
                
                if(-not [string]::IsNullOrEmpty($PageFilter)){
                    $body.'$filter' = $PageFilter
                }

                if(-not [string]::IsNullOrEmpty($PageExpand)){
                    $body.'$expand' = $PageExpand
                }

                if(-not [string]::IsNullOrEmpty($PageSelect)){
                    $body.'$select' = $PageSelect
                }
                
                if(-not [string]::IsNullOrEmpty($PageOrderBy)){
                    $body.'$orderby' = $PageOrderBy
                }
                
                $result =  Get-3CXResult -Endpoint $Endpoint -Body $body
                $targetCount = $result.'@odata.count'
                $result.value | ForEach-Object {$values.Add($_)}
            }
            
            return $values
        }
    }
}