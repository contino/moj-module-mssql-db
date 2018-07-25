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

output "host_name" {
	value = "${azurerm_sql_server.sql_server.fully_qualified_domain_name}"
}

output "database_name" {
	value = "${azurerm_sql_database.sql_server_database.name}"
}

output "administrator_login_password" {
	value = "${random_string.password.result}"
}

output "jdbc_connection_string" {
	value = "jdbc:sqlserver://${azurerm_sql_server.sql_server.fully_qualified_domain_name}:1433;database=${azurerm_sql_server.sql_server.name};user=${var.mssql_user}@${azurerm_sql_server.sql_server.name};password=${random_string.password.result};encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;"
	sensitive = true
}

output "odbc_connection_string" {
	value = "Driver={ODBC Driver 13 for SQL Server};Server=tcp:${azurerm_sql_server.sql_server.fully_qualified_domain_name},1433;Database=${azurerm_sql_server.sql_server.name};Uid=${var.mssql_user}@${azurerm_sql_server.sql_server.name};Pwd=${random_string.password.result};Encrypt=yes;TrustServerCertificate=no;Connection Timeout=30;"
	sensitive = true
}

output "connectionString"{
	value = "Data Source=${azurerm_sql_server.sql_server.fully_qualified_domain_name},1433;Initial Catalog=${azurerm_sql_server.sql_server.name};Persist Security Info=False;User ID=${var.mssql_user};Password=${random_string.password.result};MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
}