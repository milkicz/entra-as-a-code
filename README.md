# Entra as Code (Terraform)

Terraform project for managing Microsoft Entra ID resources as code using the Microsoft Graph provider.

## What this creates

- **Organizational branding** - Custom sign-in page colors and text
- **Security group** - `<project>-<env>-platform-admins`
- **App registration** - `<project>-<env>-app` with optional redirect URIs
- **Service principal** - For the app registration

Conditional resources are controlled via variables in `env/dev.tfvars`.

## Prerequisites

- Terraform `>= 1.6.0`
- Azure CLI logged into the target tenant with appropriate permissions

Install Terraform on Windows (if needed):

```powershell
winget install Hashicorp.Terraform
```

Login to your specific Entra tenant:

```powershell
az login --tenant 0130e710-4381-4af2-ae7e-a81cf4c2ae6d
az account show
```

## Quick start

```powershell
terraform init
terraform validate
terraform plan -var-file="env/dev.tfvars"
terraform apply -auto-approve -var-file="env/dev.tfvars"
```

## Configuration

Edit [env/dev.tfvars](env/dev.tfvars) to customize:
- Tenant ID
- Project and environment names
- Branding colors and text (background color, sign-in text, username hint)
- Optional group and application creation flags

## Common operations

```powershell
# Format code
terraform fmt -recursive

# Preview changes
terraform plan -var-file="env/dev.tfvars"

# Destroy all resources
terraform destroy -auto-approve -var-file="env/dev.tfvars"
```

## Microsoft Graph Provider

This project uses the `microsoft/msgraph` provider which works directly with Microsoft Graph API endpoints. Resources are defined using `msgraph_resource` with:
- `url` - Graph API endpoint (e.g., `/groups`, `/applications`)
- `body` - JSON request body
- `response_export_values` - Fields to extract from responses

## Notes

- State is local by default. Add remote backend (Azure Storage) for team usage.
- After `apply`, review objects in Microsoft Entra admin center: https://entra.microsoft.com/
- Branding changes appear immediately on the tenant sign-in page.
