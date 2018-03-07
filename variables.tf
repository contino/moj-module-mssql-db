variable "mssql_name" {
  type = "string"
  description = "Name of MS SQL Server."
}

variable "resource_group_name" {
  type    = "string"
  description = "Your MS SQL DB needs to be in a resource group. Use the name of an existing group or use a new one to have one created."
}

variable "resource_group_location" {
  type    = "string"
  default = "UK South"
  description = "Where you want your resource group to be. List of all current Azure locations https://azure.microsoft.com/en-gb/regions/services/"
}

variable "mssql_version" {
  type    = "string"
  default = "12.0"
  description = "The MS SQL version"
}

variable "mssql_user" {
  type    = "string"
  description = "Administrator login account name"
}