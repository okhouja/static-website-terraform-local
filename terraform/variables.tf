# Resource Group and Storage Account
variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
  default     = "terraform-static-website-rg"
}

variable "location" {
  description = "Azure region for resource deployment"
  type        = string
  default     = "eastus"
}
variable "storage_account_name" {
  description = "Name of the Azure Storage Account"
  type        = string
}
variable "storage_account_tier" {
  description = "The performance tier of the storage account"
  type        = string
  default     = "Standard"
}
variable "storage_account_replication_type" {
  description = "The replication type for the storage account"
  type        = string
  default     = "LRS" # Locally Redundant Storage
}
variable "storage_account_kind" {
  description = "The kind of storage account to create"
  type        = string
  default     = "StorageV2"
}

# Static Website Deployment
variable "website_zip_file" {
  description = "Path to the website ZIP file for deployment"
  type        = string
  default     = ""  # You can provide a default empty string or placeholder
}

variable "container_name" {
  description = "Name of the storage container for the website files"
  type        = string
  default     = "$web" # Special container name for Azure Static Websites
}

variable "static_website_index_document" {
  description = "The name of the index document for the static website."
  type        = string
  default     = "index.html"
}

variable "static_website_error_404_document" {
  description = "The name of the 404 error document for the static website."
  type        = string
  default     = "404.html"
}