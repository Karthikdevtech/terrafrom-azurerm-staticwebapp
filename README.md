# Azure Static Web App Terraform module

Creates an Azure Static Web App in an existing resource group. The module does
not create the resource group or upload application files.

## Usage

```hcl
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "app" {
  name     = "rg-static-web-app"
  location = "East US"
}

module "static_web_app" {
  source = "../terrafrom-azurerm-staticwebapp"

  name                = "my-static-web-app"
  resource_group_name = azurerm_resource_group.app.name
  location            = azurerm_resource_group.app.location
  sku_tier            = "Free"
  sku_size            = "Free"
  tags = {
    environment = "demo"
  }
}
```

To connect a source repository for automatic builds, set `repository_url`,
`repository_branch`, and `repository_token` together. Store the token in a
Terraform variable marked sensitive or a secrets manager; do not commit it.

The module exports the resource `id`, `default_host_name`, and sensitive
`api_key`. Static Web App deployment and application artifact upload are not
performed by Terraform.
