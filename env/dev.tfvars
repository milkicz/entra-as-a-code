tenant_id               = "0130e710-4381-4af2-ae7e-a81cf4c2ae6d"
project_name            = "entra-training"
environment             = "dev"
create_demo_group       = true
create_demo_application = true
application_redirect_uris = [
  "http://localhost:3000/auth/callback"
]

# Company branding
branding_background_color      = "#d40094"
branding_sign_in_page_text     = "Welcome to SoftwareOne Training Environment"
branding_username_hint_text    = "someone@example.com"


client_id     = "69a48237-b15a-485e-a872-c820006e7769"
client_secret = "btK8Q~Ii5J08tqzSvZi1fvx~fQ9FFeZgpziXXcDZ"

# Entra Groups Configuration
entra_groups = {
  all_company = {
    display_name       = "All Company"
    mail_nickname      = "allcompany"
    group_id           = "20a81922-a6e1-48f6-99b4-44da0fe5a4c6"
    description        = "Organization-wide group for all employees"
    mail_enabled       = true
    security_enabled   = false
    visibility         = "Public"
  }
  
  digital_initiative_pr = {
    display_name       = "Digital Initiative Public Relations"
    mail_nickname      = "DigitalInitiativePublicRelations"
    group_id           = "8a1e9446-4548-4016-a97a-fdc57026a68b"
    description        = "Digital Initiative Public Relations team"
    mail_enabled       = true
    security_enabled   = false
    visibility         = "Private"
  }
  
  mark8_project_team = {
    display_name       = "Mark 8 Project Team"
    mail_nickname      = "Mark8ProjectTeam"
    group_id           = "29a3eb33-a7b3-4031-8faf-ce2633ce75a7"
    description        = "Mark 8 Project Team members"
    mail_enabled       = true
    security_enabled   = false
    visibility         = "Private"
    create_team        = false
  }
  
  msft = {
    display_name       = "MSFT"
    mail_nickname      = "MSFT"
    group_id           = "4a0b426f-aeaf-4fc6-a99a-304d79ee1b2c"
    description        = "Microsoft operations team"
    mail_enabled       = true
    security_enabled   = false
    visibility         = "Private"
  }
  
  retail = {
    display_name       = "Retail"
    mail_nickname      = "Retail"
    group_id           = "a12c3db6-a0ed-4f7f-aa12-6f393daa90d7"
    description        = "Retail operations group"
    mail_enabled       = true
    security_enabled   = false
    visibility         = "Private"
  }
  
  sales_and_marketing = {
    display_name       = "Sales and Marketing"
    mail_nickname      = "SalesandMarketing"
    group_id           = "9a95e071-c827-4c38-a97c-f1ebb6ca929e"
    description        = "Sales and Marketing team"
    mail_enabled       = true
    security_enabled   = false
    visibility         = "Private"
    create_team        = false
  }
  
  us_sales = {
    display_name       = "U.S. Sales"
    mail_nickname      = "U.S.Sales"
    group_id           = "84facebb-622e-4ad6-a864-19eebc4d8db5"
    description        = "U.S. Sales team"
    mail_enabled       = true
    security_enabled   = false
    visibility         = "Private"
    group_types        = ["Unified", "DynamicMembership"]
    membership_rule    = "user.department -eq \"Sales\""
    membership_rule_processing_state = "on"
    create_team        = false
  }
}
