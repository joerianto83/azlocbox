using './main.bicep'
var subscriptionId = '2a234050-17d0-44a2-9755-08e59607bcd9' // InstantIntranet-Dev-Subs
var resourceGroupName = 'rg-azlocalboxjoe'
var keyVaultName = 'kv-azlocalbox'
var uGuid = guid(subscriptionId,'LocalBox')
param tenantId = az.getSecret(subscriptionId, resourceGroupName, keyVaultName, 'tenantId')
param spnProviderId = az.getSecret(subscriptionId, resourceGroupName, keyVaultName, 'spnProviderId') // Microsoft.AzureStackHCI Resource Provider object ID (Enterprise App)
param windowsAdminUsername = 'superadmin'

param windowsAdminPassword = az.getSecret(subscriptionId, resourceGroupName, keyVaultName, 'azlocalAdminPassword')
var subString = substring(uGuid,0,8)
param logAnalyticsWorkspaceName = 'law-azlocalbox${subString}'
param natDNS = '8.8.8.8'
param vmName = 'AzLocalBox-Joe'
param githubAccount = 'microsoft'
param githubBranch = 'main'
param deployBastion = true
param location = 'westeurope'
param azureLocalInstanceLocation = 'westeurope'
param rdpPort = '3389'
param autoDeployClusterResource = true
param autoUpgradeClusterResource = false
param vmAutologon = true
param vmSize = 'Standard_E32s_v6'
param enableAzureSpotPricing = false
param governResourceTags = true
param tags = {
  Project: 'Az Local Box the learning experience for PoC'
}
