variable "sqlName" {
  type = string
  description = "(optional) describe your variable"
}

variable "sqlServerName" {
  type = string
  description = "(optional) describe your variable"
}

variable "resource_group" {
  description = "The details of the Resource Group where the resources will be deployed."
  type = object({
    location = string           
    name     = string
  })
}