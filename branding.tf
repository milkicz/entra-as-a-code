# Organization branding - Sets default sign-in page branding
# https://learn.microsoft.com/en-us/graph/api/organizationalbranding-post-localizations
resource "msgraph_resource" "company_branding" {
  url = "/organization/${var.tenant_id}/branding/localizations"

  body = {    
    backgroundColor  = var.branding_background_color    
    signInPageText   = var.branding_sign_in_page_text
    usernameHintText = var.branding_username_hint_text
  }

  response_export_values = {
    id              = "id"
    backgroundColor = "backgroundColor"
    signInPageText  = "signInPageText"
  }
}
