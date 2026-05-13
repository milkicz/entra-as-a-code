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
