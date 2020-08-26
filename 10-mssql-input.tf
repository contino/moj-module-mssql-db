variable "mssql_storage_account_tier" {
  default = "Standard"
}
variable "mssql_storage_account_replication_type" {
  default = "LRS"
}


variable "mssql_version" {
  default = "12.0"
}


variable "mssql_administrator_login" {
  default = "admin"
}

variable "mssql_administrator_login_password" {
  default = "password"
}


variable "mssql_identity_type" {
  default = "SystemAssigned"
}

variable "mssql_extended_auditing_policy_retention_in_days" {
  default = 14
}

variable "mssql_extended_auditing_policy_storage_account_access_key_is_secondary" {
  default = true
}

variable "mssql_database_collation" {
  default = "SQL_Latin1_General_CP1_CI_AS"
}

variable "mssql_database_license_type" {
  default = "LicenseIncluded"
}

variable "mssql_database_max_size_gb" {
  default = 4
}

variable "mssql_database_read_scale" {
  default = true
}

variable "mssql_database_sku_name" {
  default = "S3"
}

variable "mssql_database_zone_redundant" {
  default = true
}

variable "mssql_database_name" {
  default = "example"
}

variable "sql_firewall_rule_name" {
  default = "example"
}

variable "sql_firewall_rule_start_ip_address" {
  default = "192.168.0.0"
}
