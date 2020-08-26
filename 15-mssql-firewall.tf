
resource "azurerm_sql_firewall_rule" "sql_firewall_rule" {
  name                = var.sql_firewall_rule_name
  resource_group_name = var.resource_group_name
  server_name         = azurerm_sql_server.sql_server.name
  start_ip_address    = var.sql_firewall_rule_start_ip_address
  end_ip_address      = var.sql_firewall_rule_start_ip_address
}
