variable "is_enabled" {
  description = "Whether the application management policy is enabled."
  type        = bool
  default     = true
}

variable "password_credentials" {
  description = "List of password credential restrictions for applications."
  type = list(object({
    restriction_type                        = string
    state                                   = string
    max_lifetime                            = optional(string)
    restrict_for_apps_created_after_datetime = string
  }))
  default = [
    {
      restriction_type                        = "passwordAddition"
      state                                   = "enabled"
      max_lifetime                            = null
      restrict_for_apps_created_after_datetime = "2027-02-20T10:37:00Z"
    },
    {
      restriction_type                        = "customPasswordAddition"
      state                                   = "enabled"
      max_lifetime                            = null
      restrict_for_apps_created_after_datetime = "2027-05-20T10:37:00Z"
    },
    {
      restriction_type                        = "symmetricKeyAddition"
      state                                   = "enabled"
      max_lifetime                            = null
      restrict_for_apps_created_after_datetime = "2027-02-20T10:37:00Z"
    },
  ]
}

variable "key_credentials" {
  description = "List of key credential restrictions for applications."
  type = list(object({
    restriction_type                        = string
    state                                   = string
    max_lifetime                            = optional(string)
    restrict_for_apps_created_after_datetime = string
  }))
  default = [
    {
      restriction_type                        = "asymmetricKeyLifetime"
      state                                   = "enabled"
      max_lifetime                            = "P180D"
      restrict_for_apps_created_after_datetime = "2025-02-20T10:37:00Z"
    }
  ]
}
