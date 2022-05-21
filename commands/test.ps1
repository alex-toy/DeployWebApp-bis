# $result = az group list | ConvertFrom-Json
# $result.location

$resources = az resource list | ConvertFrom-Json
$resources | Foreach-Object { $_.resourceGroup }