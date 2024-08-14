![Really not 3CX](https://img.shields.io/badge/Not%20Official-Not%203CX-red)
![Reverse Engineered](https://img.shields.io/badge/Reverse%20Engineered-yellow)
![Data Counter Badge](https://img.shields.io/github/search/xasz/3cx/data?label=Data%20Counter%20%28Test%29)
![Last Commit](https://img.shields.io/github/last-commit/xasz/3cx)

# 3CX - A Inofficial Powershell Module for 3CX V20

## What does this

This Powershell module contains a set of functions for connecting and talking to a 3CX V20+ System via the REST-API.


## Installation

To install the module, you can use the following command:

```powershell
Install-Module -Name 3CX
```

## Usage

Once the module is installed, you can import it using the `Import-Module` cmdlet:

```powershell
Import-Module -Name 3CX
```

### Example System Health

```powershell
$cred = Get-Credential
Connect-3CX -Credential $cred -APIHost "my.3cx.de"
Get-3CXSystemHealth | ft
```

### Example Custom API Call

```powershell
$cred = Get-Credential
Connect-3CX -Credential $cred -APIHost "my.3cx.de"
Get-3CXResult -Endpoint "/xapi/v1/SystemStatus" | ft
```

The authentication is handled by `Get-3CXResult`


## Contributing

If you would like to contribute to this project, feel free to submit a pull request or a issue.

## License

This project is licensed under the [MIT License](LICENSE).

## Availible Functions

```powershell
Connect-3CX
Get-3CXActiveCalls
Get-3CXEventLog
Get-3CXResult
Get-3CXSIPDevice
Get-3CXSystemHealth
Get-3CXSystemStatus
Get-3CXUser
Get-3CXVersion
```