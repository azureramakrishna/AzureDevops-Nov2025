#New-AzResourceGroup -Name arm -Location centralindia

New-AzResourceGroupDeployment -ResourceGroupName arm -TemplateFile ./storage.bicep -Verbose -Mode Complete