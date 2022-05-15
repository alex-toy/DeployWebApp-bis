
$CDBDatabaseAccount = "alexeiaccount"
$CDBName = "alexeicosmos"
$CDBMaxThroughput = 4000
$Throughput = 400

################################################################
"CREATE A COSMOS DATABASE :"

az cosmosdb mongodb database create `
    --account-name $CDBDatabaseAccount `
    --name $CDBName `
    --resource-group $RGName `
    --throughput $CDBThroughput



