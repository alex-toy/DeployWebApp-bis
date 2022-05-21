"###############################################################"
"Now running : " + $MyInvocation.MyCommand.Path
"###############################################################"


################################################################
"CREATE A CONTAINER REGISTRY :"

az acr create --resource-group $RGName --name $containerRegistry --sku Basic

# az cosmosdb create `
#     --name $CDBDatabaseAccount `
#     --resource-group $RGName `
#     --kind $CDBKind `
#     --server-version $CDBServerVersion `


################################################################
"CREATE A CONTAINER REGISTRY :"

az acr login --name $containerRegistry
# Both these commands will give a same result
az acr show --name $containerRegistry --query loginServer --output table
az acr list --resource-group $resourceGroup --query "[].{acrLoginServer:loginServer}" --output table



#######################################################################
# Next step :

# $script = "commands\CosmosDb\CosmosDb_proceed.ps1"
# .$script






