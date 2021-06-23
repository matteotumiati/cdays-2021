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
}

resource "azurerm_resource_group" "resource_group" {
  name = "RG-CDAYS2021"
  location = "westeurope"
}

resource "azurerm_app_service_plan" "appservice_plan" {
  depends_on          = [ azurerm_resource_group.resource_group ]
  name                = "demowithterraformatcdays2021"
  location            = "westeurope"
  resource_group_name = "RG-CDAYS2021"

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "appservice" {
  depends_on          = [ azurerm_app_service_plan.appservice_plan ]
  name                = "demowithterraformatcdays2021"
  location            = "westeurope"
  resource_group_name = "RG-CDAYS2021"
  app_service_plan_id = azurerm_app_service_plan.appservice_plan.id

  site_config {
    always_on     = true
    ftps_state    = "Disabled"
    http2_enabled = true
  }

  connection_string {
    name  = "Database"
    type  = "SQLServer"
    value = "Server=some-server.mydomain.com;Integrated Security=SSPI"
  }

  app_settings = {
    "SOME_KEY" = "some-value"
  }
}

resource "azurerm_sql_server" "sql_server" {
  depends_on                   = [ azurerm_resource_group.resource_group ]
  name                         = "demowithterraformatcdays2021"
  resource_group_name          = "RG-CDAYS2021"
  location                     = "westeurope"
  version                      = "12.0"
  administrator_login          = "myadminuser"
  administrator_login_password = "AVeryC0mplicat3dPa$$word!"
}

resource "azurerm_sql_database" "sql_database" {
  depends_on                       = [ azurerm_sql_server.sql_server ]
  name                             = "demowithterraformatcdays2021"
  resource_group_name              = "RG-CDAYS2021"
  location                         = "westeurope"
  server_name                      = azurerm_sql_server.sql_server.name
  edition                          = "Standard" # Standard, Premium...
  requested_service_objective_name = "S1" # S1, S3...
}