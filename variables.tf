variable "name" {
  description = "Name of the Azure Static Web App."
  type        = string

  validation {
    condition     = length(var.name) >= 2 && length(var.name) <= 60 && can(regex("^[A-Za-z0-9](?:[A-Za-z0-9-]*[A-Za-z0-9])?$", var.name))
    error_message = "The name must be 2-60 characters, use only letters, numbers, and hyphens, and start and end with a letter or number."
  }
}

variable "resource_group_name" {
  description = "Name of an existing resource group in which to create the Static Web App."
  type        = string
}

variable "location" {
  description = "Azure region for the Static Web App."
  type        = string
}

variable "sku_tier" {
  description = "Pricing tier for the Static Web App."
  type        = string
  default     = "Free"

  validation {
    condition     = contains(["Free", "Standard"], var.sku_tier)
    error_message = "sku_tier must be Free or Standard."
  }
}

variable "sku_size" {
  description = "Pricing size for the Static Web App. Use the same value as sku_tier."
  type        = string
  default     = "Free"

  validation {
    condition     = contains(["Free", "Standard"], var.sku_size)
    error_message = "sku_size must be Free or Standard."
  }
}

variable "repository_url" {
  description = "Optional source repository URL. Configure this together with repository_branch and repository_token."
  type        = string
  default     = null
}

variable "repository_branch" {
  description = "Branch to build for the configured source repository."
  type        = string
  default     = null
}

variable "repository_token" {
  description = "Access token for the configured source repository."
  type        = string
  sensitive   = true
  default     = null
}

variable "app_settings" {
  description = "Application settings for the Static Web App."
  type        = map(string)
  default     = {}
}

variable "configuration_file_changes_enabled" {
  description = "Whether changes to the Static Web App configuration file are enabled."
  type        = bool
  default     = true
}

variable "preview_environments_enabled" {
  description = "Whether preview environments are enabled."
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags to apply to the Static Web App."
  type        = map(string)
  default     = {}
}
