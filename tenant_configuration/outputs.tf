output "branding_id" {
  description = "The ID of the company branding configuration"
  value       = msgraph_resource.company_branding.output.id
}

output "branding_background_color" {
  description = "The configured background color"
  value       = msgraph_resource.company_branding.output.backgroundColor
}
