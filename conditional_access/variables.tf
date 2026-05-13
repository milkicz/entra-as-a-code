variable "project_name" {
  description = "Short project identifier used as a naming prefix."
  type        = string
}

variable "tenant_id" {
  description = "The Azure AD tenant ID."
  type        = string
}

variable "client_id" {
  description = "Service principal client ID"
  type        = string
  sensitive   = true
}

variable "client_secret" {
  description = "Service principal client secret"
  type        = string
  sensitive   = true
}

variable "environment" {
  description = "Environment name, for example dev, test, or prod."
  type        = string
}
