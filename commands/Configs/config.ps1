################################################################
"Admin :"

$Global:Subscription = "alexeisubscription"
$Global:Subscription = "Azure subscription 1"
"Subscription : " + $Subscription



################################################################
"resource Group :"

#southcentralus centralus francecentral westus2 eastus
$Global:RGLocation = "eastus"
"resource Group Location : " + $RGLocation

$Global:RGName = "cosmosdb-rg"
"Resource Group Name : " + $RGName



################################################################
"Web App :"

$Global:WAName = "alexeiwa"
"Web app name : " + $WAName

$Global:WALocation = $RGLocation
"Web App location : " + $WALocation

$Global:SKU = "F1"
"SKU : " + $SKU



################################################################
"VM :"

$Global:VMName = "flask-linux-vm"
"VM name : " + $VMName

$Global:ImageName = "UbuntuLTS"
"Image name : " + $ImageName

$Global:Size = "Standard_B1s"
"Size : " + $Size

$Global:AdminUsername = "alexadmin"
"Admin user name : " + $AdminUsername

$Global:Port = "80"
"Port : " + $Port

$Global:storageSku = "Standard_HDD"
"storageSku : "  + $storageSku



################################################################
"Secret key :"

$Global:SSHKeyName = "mySSHKey"
"Secret key name : "  + $SSHKeyName

$Global:SAKey = "SAKey"
"Storage Account key name : "  + $SAKey



################################################################
"SQL database :"

$Global:SQLAdminUser = "alexadmin"
"SQL admin user : "  + $SQLAdminUser

$Global:SQLAdminPassword = "p@ssword1234"
"SQL Admin password : " + $SQLAdminPassword

$Global:SQLServerName = "flask-sql-server"
"SQL server name : " + $SQLServerName

$Global:SQLLocation = "francecentral"
"SQL Location : " + $SQLLocation

$Global:SQLEnablePublicNetwork = "true"
"SQL enable public network : " + $SQLEnablePublicNetwork

$Global:SQLBDName = "flask-db"
"DB name : " + $SQLBDName

$Global:FirewallRuleName = "azureaccess"
"Firewall Rule Name : " + $FirewallRuleName

$Global:ClientIPFirewallRuleName = "clientip"
"ClientIP Firewall Rule Name : " + $ClientIPFirewallRuleName

$Global:Tier = "Basic"
"Tier : " + $Tier



################################################################
"Storage Account :"

$Global:SAName = "flaskstorageaccount"
"Storage Account name : " + $SAName

#southcentralus centralus francecentral
$Global:SALocation = $RGLocation
"Storage Account Location : " + $SALocation

$Global:SAKind = "BlockBlobStorage"
"Storage Account kind : " + $SAKind

$Global:SASKU = "Standard_LRS"
"Storage Account SKU : " + $SASKU

$Global:SCName = "flask-images"
"Storage container name : " + $SCName

$Global:SCAuthMode = "login"
"Storage container auth mode : " + $SCAuthMode

$Global:SCPublicAccess = "container"
"Storage container public access : " + $SCPublicAccess



################################################################
"Function App :"

$Global:FAName = "alexeifa"
"Function App name : "  + $FAName

# python node
$Global:FARuntime = "python"
"Runtime : "  + $FARuntime

# Linux Windows
$Global:FAOSType = "Linux"
"OS Type : "  + $FAOSType

$Global:FAConsumptionPlanLocation = "eastus"
"Consumption plan location : "  + $FAConsumptionPlanLocation

$Global:FAFunctionVersion = 3
"Function version : "  + $FAFunctionVersion

$Global:FAKeyName = "alexeifa"
"Key name : "  + $FAKeyName

$Global:FAKeyType = "functionKeys"
"Key type : "  + $FAKeyType



################################################################
"Cosmos database :"

$Global:CDBName = "alexeicosmos"
"Cosmos database  : "  + $CDBName

$Global:CDBServerVersion = "4.0"
"Server Version  : "  + $CDBServerVersion

# Needs to be lower case
$Global:CDBDatabaseAccount = "alexeidatabaseaccount"
"CosmosDB Database Account : "  + $CDBDatabaseAccount

#GlobalDocumentDB, MongoDB, Parse
$Global:CDBKind = "MongoDB"
"Kind : "  + $CDBKind

$Global:CDBMaxThroughput = 4000
"Max Throughput : "  + $CDBMaxThroughput

$Global:CDBThroughput = 400
"Throughput : "  + $CDBThroughput

$Global:CDBCollectionName = 'myfirstcollection'
"Collection Name : "  + $CDBCollectionName

$Global:CDBDefaultConsistencyLevel = 'Eventual'
"Default consistency level : "  + $CDBDefaultConsistencyLevel

$Global:CDBenableAutomaticFailover = 'false'
"Enable automatic failover : "  + $CDBenableAutomaticFailover



#######################################################################
"Set config file :"

$file = ".\commands\Configs\var.cfg"

(Get-Content -Path $file) | ForEach-Object { $_ = $_.split("=")[0]; $_ } | Set-Content -Path $file

(Get-Content -Path $file) | ForEach-Object { $rep = 'SQL_SERVER=' + $SQLServerName; $_ -Replace 'SQL_SERVER', $rep } | Set-Content -Path $file
(Get-Content -Path $file) | ForEach-Object { $rep = 'SQL_DATABASE=' + $SQLBDName; $_ -Replace 'SQL_DATABASE', $rep } | Set-Content -Path $file
(Get-Content -Path $file) | ForEach-Object { $rep = 'SQL_USER_NAME=' + $SQLAdminUser; $_ -Replace 'SQL_USER_NAME', $rep } | Set-Content -Path $file
(Get-Content -Path $file) | ForEach-Object { $rep = 'SQL_PASSWORD=' + $SQLAdminPassword; $_ -Replace 'SQL_PASSWORD', $rep } | Set-Content -Path $file

(Get-Content -Path $file) | ForEach-Object { $rep = 'BLOB_ACCOUNT=' + $SAName; $_ -Replace 'BLOB_ACCOUNT', $rep } | Set-Content -Path $file
(Get-Content -Path $file) | ForEach-Object { $rep = 'BLOB_CONTAINER=' + $SCName; $_ -Replace 'BLOB_CONTAINER', $rep } | Set-Content -Path $file



#######################################################################
# Next step :

$script = "commands\ResourceGroup\ResourceGroup_create.ps1"
.$script

