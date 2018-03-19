variable "product" {
  type = "string"
}

variable "env" {
  type = "string"
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
