
resource "azurerm_sql_virtual_network_rule" "sql_virtual_network_rule" {
  name                = "${var.service_name_prefix}${var.service_shortname}-mssql-vnet-rule-${var.tag_environment}"
  resource_group_name = var.resource_group_name
  server_name         = azurerm_sql_server.sql_server.name
  subnet_id           = var.mssql_endpoint_subnet_id
}



########### PRIVATE ENDPOINT ###############

# resource "azurerm_private_endpoint" "mssql_private_endpoint" {
#   name = "${var.service_name_prefix}${var.service_shortname}-mssql-endpoint-${var.tag_environment}"

#   resource_group_name = var.resource_group_name
#   location            = var.location

#   subnet_id = var.mssql_endpoint_subnet_id

#   private_service_connection {
#     name                           = "${var.service_name_prefix}${var.service_shortname}-privateserviceconnection"
#     private_connection_resource_id = azurerm_sql_server.sql_server.id
#     subresource_names              = ["sqlServer"]
#     is_manual_connection           = false
#   }
# }

# resource "azurerm_private_dns_zone" "mssql_private_dns_zone" {
#   name                = "privatelink.database.core.windows.net"
#   resource_group_name = var.network_resource_group_name
# }

# resource "azurerm_private_dns_zone_virtual_network_link" "private_dns_zone_virtual_network_link" {
#   name                  = "${var.service_name_prefix}${var.service_shortname}-mssql-endpoint-${var.tag_environment}"
#   resource_group_name   = var.network_resource_group_name
#   private_dns_zone_name = azurerm_private_dns_zone.mssql_private_dns_zone.name
#   virtual_network_id    = var.network_id
#   registration_enabled  = false
# }

# resource "azurerm_private_dns_a_record" "mssql_private_dns_a_record" {
#   name                = "${var.service_name_prefix}${var.service_shortname}${var.tag_environment}"
#   zone_name           = azurerm_private_dns_zone.mssql_private_dns_zone.name
#   resource_group_name = var.network_resource_group_name
#   ttl                 = 300
#   records             = [azurerm_private_endpoint.mssql_private_endpoint.private_service_connection.0.private_ip_address]
# }