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
