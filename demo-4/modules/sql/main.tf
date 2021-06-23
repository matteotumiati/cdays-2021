resource "azurerm_sql_server" "sql_server" {
  name                         = var.sqlServerName
  resource_group_name          = var.resource_group.name
  location                     = var.resource_group.location
  version                      = "12.0"
  administrator_login          = var.username
  administrator_login_password = var.password
}

resource "azurerm_sql_database" "sql_database" {
  name                             = var.sqlName
  resource_group_name              = var.resource_group.name
  location                         = var.resource_group.location
  server_name                      = azurerm_sql_server.sql_server.name
  edition                          = "Standard" # Standard, Premium...
  requested_service_objective_name = "S1" # S1, S3...
}