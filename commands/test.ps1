
################################################################
"CREATE A COSMOS COLLECTION :"

$Global:CollectionName = "users"
"Collection name : " + $CollectionName

az cosmosdb mongodb collection create `
    --resource-group $RGName `
    --account-name $CDBDatabaseAccount `
    --database-name $CDBName `
    --name $CollectionName