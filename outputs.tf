output "id" {
  description = "Resource ID of the Azure Static Web App."
  value       = azurerm_static_web_app.this.id
}

output "default_host_name" {
  description = "Default hostname of the Azure Static Web App."
  value       = azurerm_static_web_app.this.default_host_name
}

output "api_key" {
  description = "Deployment API key for the Azure Static Web App."
  value       = azurerm_static_web_app.this.api_key
  sensitive   = true
}
