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
