resource "azurerm_storage_account" "sample" {
  name                     = "samplestoragernakamine"
  resource_group_name      = azurerm_resource_group.sample.name
  location                 = azurerm_resource_group.sample.location
  account_tier             = "standard"
  account_replication_type = "LRS"
}
