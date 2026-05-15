resource "azuread_named_location" "poland_named_location" {
  display_name = "Poland Named Location"
  country {
    countries_and_regions = [
      "PL",      
    ]
    
    include_unknown_countries_and_regions = false
    
  }
}

resource "azuread_conditional_access_policy" "block_workload_identities_outside_trusted_locations" {
  display_name = "Block workload identities outside trusted locations"
  state        = "enabledForReportingButNotEnforced"

  conditions {
    client_app_types    = ["all"]
    sign_in_risk_levels = ["medium"]
    user_risk_levels    = ["medium"]

    applications {
      included_applications = ["All"]
      excluded_applications = []
    }    

    locations {
      included_locations = ["All"]
      excluded_locations = [azuread_named_location.poland_named_location.id]
    }
    
    users {
      included_users = ["All"]
      excluded_users = ["GuestsOrExternalUsers"]
    }
  }

  grant_controls {
    operator          = "OR"
    built_in_controls = ["mfa"]
  }

  session_controls {
    application_enforced_restrictions_enabled = true
    disable_resilience_defaults               = false
    sign_in_frequency                         = 10
    sign_in_frequency_period                  = "hours"
    cloud_app_security_policy                 = "monitorOnly"
  }
}