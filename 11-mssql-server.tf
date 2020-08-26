resource "azurerm_sql_server" "sql_server" {
  name = format("%s%s%s",
    var.service_name_prefix,
    var.service_shortname,
    lookup(data.null_data_source.tag_defaults.inputs, "Environment")
    )

  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = var.mssql_version
  administrator_login          = var.mssql_administrator_login
  administrator_login_password = var.mssql_administrator_login_password


  extended_auditing_policy {
    storage_endpoint                        = azurerm_storage_account.storage_account.primary_blob_endpoint
    storage_account_access_key              = azurerm_storage_account.storage_account.primary_access_key
    storage_account_access_key_is_secondary = var.mssql_extended_auditing_policy_storage_account_access_key_is_secondary
    retention_in_days                       = var.mssql_extended_auditing_policy_retention_in_days
  }

  tags = merge(
    data.null_data_source.tag_defaults.inputs,
    map(
      "Name", replace(
        format("%s%s-%s",
          var.service_name_prefix,
          var.service_shortname,
          lookup(data.null_data_source.tag_defaults.inputs, "Environment")
        ),
        "_",
        "-"
      )
    )
  )

}
