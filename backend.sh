#!/bin/bash
# for more secured version we can use key vault herer
STORAGE_ACCOUNT_NAME="storageaccount"
RESOURCE_GROUP_NAME="recruitment-challenge" #i'm thinging if we should use the same resource group or another one 

ACCOUNT_KEY=$(az storage account keys list --resource-group $RESOURCE_GROUP_NAME --account-name $STORAGE_ACCOUNT_NAME --query '[0].value' -o tsv)
export ARM_ACCESS_KEY=$ACCOUNT_KEY
