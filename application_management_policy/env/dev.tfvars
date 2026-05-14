tenant_id    = "0130e710-4381-4af2-ae7e-a81cf4c2ae6d"
project_name = "entra-training"
environment  = "dev"

client_id     = "69a48237-b15a-485e-a872-c820006e7769"
client_secret = "btK8Q~Ii5J08tqzSvZi1fvx~fQ9FFeZgpziXXcDZ"

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

