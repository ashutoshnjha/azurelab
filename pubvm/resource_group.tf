resource "azurerm_resource_group" "anjLabGroup"{
  name     = var.resourceGroupName
  location = var.location
  tags     = var.tags
}
