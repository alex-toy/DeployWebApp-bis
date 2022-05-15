################################################################
"Now running : " + $MyInvocation.MyCommand.Path

################################################################
#CREATE AND DEPLOY AN APP SERVICE :

#cd to web directory
$init_path = $pwd
$app_path = ".\"
Set-Location $app_path

az webapp up `
    --resource-group $RGName `
    --location $WALocation `
    --name $WAName `
    --sku $SKU `
    --verbose

#Go back to root folder
Set-Location $init_path

#Open a browser and navigate to the app URL (http://<myAppName>.azurewebsites.net) and verify the app is running
$url = "http://" + $WAName + ".azurewebsites.net"
$url