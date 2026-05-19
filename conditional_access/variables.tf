variable "project_name" {
  description = "Short project identifier used as a naming prefix."
  type        = string
}

variable "tenant_id" {
  description = "The Azure AD tenant ID."
  type        = string
}


variable "environment" {
  description = "Environment name, for example dev, test, or prod."
  type        = string
}
