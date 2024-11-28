# Static Website Hosting on Azure with Terraform

This project demonstrates how to deploy and host a static website on Azure Blob Storage using **Terraform** and a Bash script. The project automates the creation of Azure resources and uploads the website files, ensuring a streamlined workflow.

**Note:** This entire project is executed locally on your PC, but the resources (such as the Storage Account and Blob Container) are provisioned on Azure. You will need to configure your Azure credentials locally to interact with Azure services via Terraform.


## **Project Structure**
```
project/
├── static-website/ # Folder containing static website files (HTML, CSS, JS, etc.)
│ ├── index.html
│ ├── about.html
│ ├── styles.css
│ └── ...
├── terraform/ # Terraform configuration files
│ ├── main.tf
│ ├── variables.tf
│ ├── outputs.tf
│ └── ...
├── upload_files.sh # Bash script to automate Terraform and file uploads
└── README.md # Documentation for the project
```


## Prerequisites

Before running this project, ensure you have the following installed on your system:

- [Terraform](https://www.terraform.io/downloads.html)
- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
- An Azure account with sufficient permissions to create resources
- A Bash shell (Linux, macOS, or Windows Subsystem for Linux)

## Steps to Deploy the Static Website

### Step 1: Initialize Terraform

Run the following commands inside the **terraform** folder to initialize the Terraform configuration:

```bash
cd terraform
terraform init
```

### Step 2: Apply the Terraform Configuration

Apply the Terraform configuration to create the necessary Azure resources (Storage Account and Blob Container) for hosting the static website:

```bash
terraform apply -auto-approve
```

### Step 3: Run the Bash Script to Upload Files
Once the resources are created, run the upload_files.sh script to upload all files from the static-website folder to Azure Blob Storage:
```bash
./upload_files.sh
```

## The Script Will:

- Retrieve the Storage Account name and Static Website URL from Terraform output.
- Upload each file in the **static-website** folder to Azure Blob Storage.
- Skip files that already exist in Blob Storage.
- Provide a link to the live static website after uploading all files.

---

## **Configuration Details**

### **Terraform Resources**

- **Storage Account**: An Azure Storage Account is created with the name dynamically assigned by Terraform.
- **Blob Container**: A container named `$web` is used to store the website files, as required for Azure Static Websites.
- **Outputs**: The URL of the static website and the storage account name are provided as output after the Terraform `apply` command.

### **Upload Script (upload_files.sh)**

The **upload_files.sh** script performs the following tasks:

1. Initializes Terraform.
2. Applies the Terraform configuration to create Azure resources.
3. Retrieves the storage account name and static website URL.
4. Uploads files from the **static-website** folder to Azure Blob Storage, skipping files that already exist.
5. Outputs the URL of the live static website.

---

## **Important Notes**

- Ensure that your Azure CLI is logged in with an account that has sufficient permissions to create storage resources and upload files.
- The script assumes that you have already placed your website files (HTML, CSS, JS, etc.) in the **static-website** folder.
- You may need to manually adjust the storage account name if it doesn't meet Azure's naming requirements.

---

## **Destroying Resources**

Once you are done with the project and no longer need the resources on Azure, you can delete all the created resources by running the following Terraform command:

```bash
terraform destroy -auto-approve
```

## **Useful Links**

- [Terraform Documentation](https://www.terraform.io/docs)
- [Azure CLI Documentation](https://learn.microsoft.com/en-us/cli/azure/)
- [Azure Blob Storage](https://learn.microsoft.com/en-us/azure/storage/blobs/)

---

## **License**

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.