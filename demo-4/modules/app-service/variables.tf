variable "appServiceName" {
  type = string
  description = "The name of the App Service"
}

variable "planName" {
  type = string
  description = "The name of the App Service Plan"
}

variable "resource_group" {
  description = "The details of the Resource Group where the resources will be deployed."
  type = object({
    location = string           
    name     = string
  })
}