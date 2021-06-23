variable "sqlName" {
  type = string
  description = "The name of the SQL Database instance"
}

variable "sqlServerName" {
  type = string
  description = "The name of the SQL Server"
}

variable "resource_group" {
  description = "The details of the Resource Group where the resources will be deployed."
  type = object({
    location = string           
    name     = string
  })
}

variable "username" {
  description = "The username used to connect to the SQL instance"
  type        = string
}

variable "password" {
  description = "The password used to connect to the SQL instance"
  type        = string
}