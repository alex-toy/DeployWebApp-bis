"###############################################################"
"Now running : " + $MyInvocation.MyCommand.Path
"###############################################################"


################################################################
"CREATE A FUNCTION APP :"

az functionapp create `
    --resource-group $RGName `
    --name $FAName `
    --runtime $FARuntime `
    --functions-version $FAFunctionVersion `
    --os-type $FAOSType `
    --consumption-plan-location $FAConsumptionPlanLocation `
    --functions-version 3 `
    --storage-account $SAName `
    # --plan MyPlan `



################################################################
"SET CONNECTION STRING :"

az functionapp config appsettings set `
    --name $FAName `
    --resource-group $RGName `
    --setting MyDbConnection=$CDBConnectionStrings
    # --settings "AzureWebJobsStorage=$CDBConnectionStrings"
    


################################################################
"SET KEYS :"

az functionapp keys set `
    --resource-group $RGName `
    --name $FAName `
    --key-type $FAKeyType `
    --key-name $FAKeyName `
    --key-value $CDBKeys


#######################################################################
# Next step :

# $script = "commands\StorageAccount\StorageAccount_create.ps1"
# .$script





    