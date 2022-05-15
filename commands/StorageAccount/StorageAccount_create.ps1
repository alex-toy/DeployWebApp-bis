"###############################################################"
"Now running : " + $MyInvocation.MyCommand.Path
"###############################################################"

################################################################
"Create the block blob storage account :"

az storage account create `
    --resource-group $RGName `
    --name $SAName `
    --location $SALocation `
    --sku $SASKU
    #--kind $SAKind `


################################################################
"Create the container :"

az storage container create `
 --account-name $SAName `
 --name $SCName `
 --auth-mode $SCAuthMode `
 --public-access $SCPublicAccess


#######################################################################
# Next step :

$script = "commands\CosmosDb\CosmosDb_create.ps1"
.$script


