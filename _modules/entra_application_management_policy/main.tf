terraform {
  required_providers {
    msgraph = {
      source = "microsoft/msgraph"
    }
  }
}


resource "msgraph_update_resource" "application_management_policy" {
  url = "policies/defaultAppManagementPolicy"

  body = {
    "isEnabled" : var.is_enabled,
    "applicationRestrictions" : {
      "passwordCredentials" : [
        for cred in var.password_credentials : {
          "restrictionType"                    = cred.restriction_type
          "state"                              = cred.state
          "maxLifetime"                        = cred.max_lifetime
          "restrictForAppsCreatedAfterDateTime" = cred.restrict_for_apps_created_after_datetime
        }
      ],
      "keyCredentials" : [
        for cred in var.key_credentials : {
          "restrictionType"                    = cred.restriction_type
          "state"                              = cred.state
          "maxLifetime"                        = cred.max_lifetime
          "restrictForAppsCreatedAfterDateTime" = cred.restrict_for_apps_created_after_datetime
        }
      ]
    },
  }
}

