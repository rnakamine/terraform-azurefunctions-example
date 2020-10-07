resource "azurerm_application_insights" "sample" {
  name                = "sample-application-insights-rnakamine"
  location            = azurerm_resource_group.sample.location
  resource_group_name = azurerm_resource_group.sample.name
  application_type    = "web"
}
