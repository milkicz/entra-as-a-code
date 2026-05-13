output "tenant_id" {
  description = "The Azure AD tenant ID"
  value       = var.tenant_id
}

output "client_id" {
  description = "Service principal client ID"
  value       = var.client_id
  sensitive   = true
}

output "client_secret" {
  description = "Service principal client secret"
  value       = var.client_secret
  sensitive   = true
}
