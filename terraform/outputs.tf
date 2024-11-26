output "primary_web_host" {
  description = "The URL of the static website Project for ReDi School"
  value       = azurerm_storage_account.storage_account.primary_web_host
}
output "storage_account_name" {
  value = azurerm_storage_account.storage_account.name
}
