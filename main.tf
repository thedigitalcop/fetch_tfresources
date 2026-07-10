resource "azurerm_resource_group" "example" {
  name     = "${var.prefix}-rg"
  location = "West Europe"
}

resource "azurerm_storage_account" "example" {
  name                     = "${var.prefix}storage"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_container" "container" {
  name                  = "${var.prefix}-container"
  storage_account_id    = azurerm_storage_account.example.id
  container_access_type = "private"
}