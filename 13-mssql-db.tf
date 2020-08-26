
resource "azurerm_mssql_database" "mssql_database" {
  name           = var.mssql_database_name
  server_id      = azurerm_sql_server.sql_server.id
  collation      = var.mssql_database_collation
  license_type   = var.mssql_database_license_type
  # max_size_gb    = var.mssql_database_max_size_gb
  # read_scale     = var.mssql_database_read_scale
  sku_name       = var.mssql_database_sku_name
  # zone_redundant = var.mssql_database_zone_redundant

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