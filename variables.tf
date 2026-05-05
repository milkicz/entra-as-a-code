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

variable "create_demo_group" {
  description = "Whether to create a sample Entra security group."
  type        = bool
  default     = true
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

# Organizational branding variables
variable "branding_background_color" {
  description = "Background color for sign-in page (hex format, e.g., #FFFFFF)."
  type        = string
  default     = "#FFFFFF"
}

variable "branding_sign_in_page_text" {
  description = "Custom text displayed on the sign-in page."
  type        = string
  default     = ""
}

variable "branding_username_hint_text" {
  description = "Hint text for the username field."
  type        = string
  default     = ""
}

variable "branding_background_image" {
  description = "Path to background image file (optional). Supported formats: PNG, JPG, JPEG. Max 300KB."
  type        = string
  default     = ""
}
# Entra groups configuration
variable "entra_groups" {
  description = "Map of Entra security groups to create or manage."
  type = map(object({
    display_name            = string
    mail_nickname           = string
    group_id                = optional(string)
    group_types             = optional(list(string))
    description             = optional(string)
    is_assigned_to_role     = optional(bool, false)
    mail_enabled            = optional(bool, false)
    security_enabled        = optional(bool, true)
    visibility              = optional(string, "Private")
    membership_rule         = optional(string)
    membership_rule_processing_state = optional(string)
    create_team             = optional(bool, false)
  }))
  default = {}
}
