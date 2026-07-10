resource "azurerm_resource_group" "example" {
  name     = "${var.prefix}-rg"
  location = "West Europe"
}
