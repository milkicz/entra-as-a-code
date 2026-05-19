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
