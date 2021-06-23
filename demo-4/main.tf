terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.64.0"
    }
  }
  required_version = ">= 1.0.0"
}

provider "azurerm" {
  features {}
  subscription_id = "6c17afe3-315f-4664-9ead-51a3b977b178"
}

resource "azurerm_resource_group" "resource_group" {
  name     = "RG-CDAYS2021"
  location = "westeurope"
}

module "app-service" {
  source = "./modules/app-service"

  appServiceName = "demowithterraformatcdays2021"
  planName       = "demowithterraformatcdays2021"

  resource_group = {
    location = azurerm_resource_group.resource_group.location
    name     = azurerm_resource_group.resource_group.name
  }
}

module "sql" {
  source = "./modules/sql"

  sqlName       = "demowithterraformatcdays2021"
  sqlServerName = "demowithterraformatcdays2021"
  username      = var.username
  password      = var.password

  resource_group = {
    location = azurerm_resource_group.resource_group.location
    name     = azurerm_resource_group.resource_group.name
  }
}