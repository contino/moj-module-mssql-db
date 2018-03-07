output "db_url" {
	value = "${azurerm_sql_server.sql_server.fully_qualified_domain_name}"
}

output "user_name" {
	value = "${var.mssql_user}"
}

output "password" {
  value = "${random_string.password.result}"
  sensitive = true
}