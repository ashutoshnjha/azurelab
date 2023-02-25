resource "azurerm_storage_account" "anj-storage" {
  name                     = var.storageName
  resource_group_name      = var.resourceGroupName
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = var.tags
}

resource "azurerm_storage_container" "anjcontainer" {
  name                  = var.storageContainer
  storage_account_name  = azurerm_storage_account.anj-storage.name
  container_access_type = "blob"
}