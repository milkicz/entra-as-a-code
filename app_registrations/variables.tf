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

variable "create_demo_application" {
  description = "Whether to create a sample Entra app registration and service principal."
  type        = bool
  default     = true
}

variable "application_redirect_uris" {
  description = "Redirect URIs for the sample application (if created)."
  type        = list(string)
  default     = []
}
