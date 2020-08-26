resource "azurerm_storage_account" "storage_account" {
  name                     = "mssql${var.service_name_prefix}${var.service_shortname}${var.tag_environment}"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.mssql_storage_account_tier
  account_replication_type = var.mssql_storage_account_replication_type
}