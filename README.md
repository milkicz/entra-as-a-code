# Entra as Code (Terraform)

Manage Microsoft Entra ID configuration as code using Terraform and the Microsoft Graph provider. Each Entra domain is a **separate Terraform root configuration** that can be independently planned and deployed.

## Project Structure

```
entra-as-a-code/
├── _common/                             # Shared module for provider/auth variables
│   ├── variables.tf
│   └── outputs.tf
├── _modules/                            # Reusable Terraform sub-modules
│   ├── entra_application_management_policy/
│   └── conditional_access_for_workload_identities/
├── app_registrations/                   # App registrations & service principals
├── groups/                              # Entra security groups & Teams
├── conditional_access/                  # Conditional Access policies (placeholder)
├── tenant_configuration/                # Org branding & tenant settings
├── application_management_policy/       # App management policies
├── assets/
└── README.md
```

## Domain Descriptions

| Directory | Purpose |
|-----------|---------|
| `app_registrations/` | Manages Entra app registrations and service principals |
| `groups/` | Manages Entra security groups, M365 groups, and Teams |
| `conditional_access/` | Manages Conditional Access policies (placeholder for future use) |
| `tenant_configuration/` | Manages organization branding and tenant-level settings |
| `application_management_policy/` | Manages default app management policies (credential restrictions) |
| `_common/` | Shared module providing common authentication variables |
| `_modules/` | Reusable Terraform sub-modules |

Each domain directory contains its own `main.tf`, `variables.tf`, `outputs.tf`, `providers.tf`, `versions.tf`, and an `env/` folder with environment-specific variable files.

## Prerequisites

- Terraform `>= 1.6.0`
- Azure CLI logged into the target tenant with appropriate permissions

```powershell
winget install Hashicorp.Terraform
az login --tenant <your-tenant-id>
```

## Usage

Deploy a specific domain using `-chdir`:

```bash
# Initialize
terraform -chdir=groups init

# Plan
terraform -chdir=groups plan -var-file=env/dev.tfvars

# Apply
terraform -chdir=groups apply -var-file=env/dev.tfvars
```

Other common operations:

```bash
# Format all code
terraform fmt -recursive

# Destroy resources for a domain
terraform -chdir=groups destroy -var-file=env/dev.tfvars
```

## Adding a New Environment

Create a new `.tfvars` file in each domain's `env/` directory. For example, to add a `prod` environment:

```
groups/env/prod.tfvars
app_registrations/env/prod.tfvars
tenant_configuration/env/prod.tfvars
```

Then deploy with:

```bash
terraform -chdir=groups plan -var-file=env/prod.tfvars
```

## Notes

- State is local by default. Add a remote backend (Azure Storage) for team usage.
- After `apply`, review objects in [Microsoft Entra admin center](https://entra.microsoft.com/).
- This project uses the `microsoft/msgraph` provider which works directly with Microsoft Graph API endpoints.
