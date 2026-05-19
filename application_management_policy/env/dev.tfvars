tenant_id    = "4c1723e7-c283-4c8b-8d7d-589063202b46"
project_name = "entra-training"
environment  = "dev"

# Application Management Policy Configuration
is_enabled = true

password_credentials = [
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

key_credentials = [
  {
    restriction_type                        = "asymmetricKeyLifetime"
    state                                   = "enabled"
    max_lifetime                            = "P180D"
    restrict_for_apps_created_after_datetime = "2025-02-20T10:37:00Z"
  }
]

