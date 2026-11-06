resource "azurerm_static_web_app" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku_tier            = var.sku_tier
  sku_size            = var.sku_size
  app_settings        = var.app_settings
  tags                = var.tags

  repository_url    = var.repository_url
  repository_branch = var.repository_branch
  repository_token  = var.repository_token

  configuration_file_changes_enabled = var.configuration_file_changes_enabled
  preview_environments_enabled       = var.preview_environments_enabled

  lifecycle {
    precondition {
      condition     = var.sku_tier == var.sku_size
      error_message = "sku_tier and sku_size must match."
    }

    precondition {
      condition = (
        var.repository_url == null &&
        var.repository_branch == null &&
        var.repository_token == null
        ) || (
        var.repository_url != null &&
        var.repository_branch != null &&
        var.repository_token != null &&
        trimspace(var.repository_url) != "" &&
        trimspace(var.repository_branch) != "" &&
        trimspace(var.repository_token) != ""
      )
      error_message = "Set repository_url, repository_branch, and repository_token together, or leave all three unset."
    }
  }
}
