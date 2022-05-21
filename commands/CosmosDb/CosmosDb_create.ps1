"###############################################################"
"Now running : " + $MyInvocation.MyCommand.Path
"###############################################################"


################################################################
"CREATE A COSMOS DATABASE ACCOUNT :"

az cosmosdb create `
    --name $CDBDatabaseAccount `
    --resource-group $RGName `
    --kind $CDBKind `
    --server-version $CDBServerVersion `
    --default-consistency-level $CDBDefaultConsistencyLevel `
    --enable-automatic-failover $CDBenableAutomaticFailover
    # --subscription $Subscription



#######################################################################
# Next step :

$script = "commands\CosmosDb\CosmosDb_proceed.ps1"
.$script




