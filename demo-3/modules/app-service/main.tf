resource "azurerm_app_service_plan" "appservice_plan" {
  name                = var.planName
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "appservice" {
  name                = var.appServiceName
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
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