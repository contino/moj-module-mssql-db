resource "azurerm_resource_group" "azurerm_resource_group" {
  name     = "${var.product}-data-${var.env}"
  location = "${var.resource_group_location}"
}

resource "random_string" "password" {
  length  = 16
  special = true
  upper   = true
  lower   = true
  number  = true
}

resource "azurerm_sql_server" "sql_server" {
  name                = "${var.product}-${var.env}"
  location            = "${azurerm_resource_group.azurerm_resource_group.location}"
  resource_group_name = "${azurerm_resource_group.azurerm_resource_group.name}"
  version                      = "${var.mssql_version}"
  administrator_login          = "${var.mssql_user}"
  administrator_login_password = "${random_string.password.result}"
}

resource "azurerm_sql_database" "sql_server_database" {
  name                = "${var.product}-${var.env}"
  location            = "${azurerm_resource_group.azurerm_resource_group.location}"
  resource_group_name = "${azurerm_resource_group.azurerm_resource_group.name}"
  server_name         = "${var.product}-${var.env}"

}

