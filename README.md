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

## CI/CD Pipeline

This project uses GitHub Actions to deploy Terraform changes automatically on repository events and manually through `workflow_dispatch`. Automatic runs detect which directories changed and only run `plan`/`apply` on affected modules.

### Workflow Behavior

| Event | Action |
|-------|--------|
| Pull Request to `main` | `terraform plan` on changed directories, posts output as PR comment |
| Push/Merge to `main` | `terraform apply` on changed directories |
| Manual `workflow_dispatch` | `terraform plan` or `terraform apply` for a selected directory, or all directories |

**Change detection**: If files in `_common/` or `_modules/` change, all root modules are deployed. Otherwise, only directories with direct changes are affected.

### Manual execution

You can run the workflow manually from the **Actions** tab using the `Terraform Entra Deployment` workflow.

- **operation**
  - `plan` runs Terraform plan only
  - `apply` runs plan first and then apply
- **directory**
  - choose one Terraform root directory
  - choose `all` to run every root directory

Manual `apply` runs keep the existing `production` environment protection and are only allowed from the `main` branch.

### Required GitHub Setup

1. **Create a Service Principal** with permissions to manage Entra ID resources
2. **Configure Federated Credentials** for GitHub Actions OIDC:
   - Issuer: `https://token.actions.githubusercontent.com`
   - Subject: `repo:<org>/<repo>:ref:refs/heads/main` (and for PRs)
3. **Create Azure Storage** for Terraform state (storage account, blob container)
4. **Grant backend state access** to the GitHub Actions principal:
   - `Storage Blob Data Contributor` on the Terraform state container or storage account
   - No storage account access keys are required
5. **Add GitHub Secrets**:

| Secret | Description |
|--------|-------------|
| `AZURE_CLIENT_ID` | Service principal application (client) ID |
| `AZURE_TENANT_ID` | Entra tenant ID |
| `AZURE_SUBSCRIPTION_ID` | Azure subscription for backend storage |
| `BACKEND_STORAGE_ACCOUNT` | Storage account name for Terraform state |
| `BACKEND_CONTAINER` | Blob container name for Terraform state files |

6. **Create a GitHub Environment** named `production` (optional, for apply approval gates)

### Remote Backend

Each root module uses Azure Storage (`azurerm` backend) with partial configuration. In GitHub Actions, `terraform init` authenticates to the backend with Microsoft Entra ID over OIDC (`ARM_USE_OIDC=true` and `ARM_USE_AZUREAD=true`) and stores state as `<directory-name>.tfstate` in the configured container.

The GitHub Actions service principal must have `Storage Blob Data Contributor` on the backend container or storage account. This repository's workflow does not use storage account access keys for Terraform state access.

For local development, you can still init with a local backend override:

```bash
terraform -chdir=groups init -backend=false
```

## Notes

- After `apply`, review objects in [Microsoft Entra admin center](https://entra.microsoft.com/).
- This project uses the `microsoft/msgraph` provider which works directly with Microsoft Graph API endpoints.
- The apply job uses `max-parallel: 1` and concurrency controls to prevent race conditions.
