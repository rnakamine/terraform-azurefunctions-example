resource "azurerm_application_insights" "sample" {
  name                = "sample-application-insights-rnakamine"
  location            = azurerm_resource_group.sample.location
  resource_group_name = azurerm_resource_group.sample.name
  application_type    = "web"
}

resource "azurerm_app_service_plan" "sample" {
  name                = "sample-app-service-plan-rnakamine"
  location            = azurerm_resource_group.sample.location
  resource_group_name = azurerm_resource_group.sample.name
  kind                = "FunctionApp"
  reserved            = true

  sku {
    size = "Y1"
    tier = "Dynamic"
  }
}

resource "azurerm_function_app" "sample" {
  name                       = "sample-function-app-rnakamine"
  location                   = azurerm_resource_group.sample.location
  resource_group_name        = azurerm_resource_group.sample.name
  app_service_plan_id        = azurerm_app_service_plan.sample.id
  storage_account_name       = azurerm_storage_account.sample.name
  storage_account_access_key = azurerm_storage_account.sample.primary_access_key
  os_type                    = "linux"
  version                    = "~3"
  enable_builtin_logging     = false

  app_settings = {
    FUNCTIONS_WORKER_RUNTIME       = "python"
    APPINSIGHTS_INSTRUMENTATIONKEY = azurerm_application_insights.sample.instrumentation_key
    AzureWebJobsStorage            = azurerm_storage_account.sample.primary_connection_string
  }
}
