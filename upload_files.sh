#!/bin/bash

# Step 1: Initialize Terraform and Apply
echo "Running Terraform..."
cd terraform

# Initialize Terraform
terraform init

# Initialize Terraform
terraform validate

# Apply the Terraform configuration
terraform apply -auto-approve

# Step 2: Get the Storage Account Name and Website URL from Terraform output
STORAGE_ACCOUNT_NAME=$(terraform output -raw storage_account_name)
STATIC_WEBSITE_URL=$(terraform output -raw primary_web_host)

# Step 3: Get the Storage Account Key
echo "Fetching Storage Account Key..."
STORAGE_ACCOUNT_KEY=$(az storage account keys list --account-name "$STORAGE_ACCOUNT_NAME" --query "[0].value" -o tsv)

# Step 4: Upload the Static Website Files to Azure Blob Storage
echo "Uploading files to Azure Blob Storage..."
az storage blob upload-batch \
    --destination "\$web" \
    --source ../static-website \
    --account-name "$STORAGE_ACCOUNT_NAME" \
    --account-key "$STORAGE_ACCOUNT_KEY" \
    --pattern "*" \
    --overwrite false \
    --output none

# Step 5: Display Success Message
echo "Files uploaded successfully to the \$web container in storage account $STORAGE_ACCOUNT_NAME."

# Step 6: Output the URL
echo "Your static website is now live at: https://$STATIC_WEBSITE_URL"
