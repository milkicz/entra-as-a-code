locals {
  name_prefix = "${var.project_name}-${var.environment}"
}

resource "msgraph_resource" "application" {
  url = "applications"
  body = {
    displayName = "My Application"
  }
  response_export_values = {
    all    = "@"
    app_id = "appId"
  }
}

module "entra_application_management_policy" {
  source = "./_modules/entra_application_management_policy"
}

output "app_id" {
  value = msgraph_resource.application.output.app_id
}