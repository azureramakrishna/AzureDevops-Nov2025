New-AzResourceGroup -Name arm -Location centralindia

New-AzResourceGroupDeployment -ResourceGroupName arm -TemplateFile ./main.bicep -TemplateParameterFile ./main.bicepparam -Verbose