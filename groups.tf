# Entra Security Groups
# Reference: https://learn.microsoft.com/en-us/graph/api/group-post-groups

resource "msgraph_resource" "entra_group" {
  for_each = var.entra_groups
  url      = "groups"

  body = {
    displayName     = each.value.display_name
    mailNickname    = each.value.mail_nickname
    description     = try(each.value.description, null)
    groupTypes      = each.value.group_types != null ? each.value.group_types : (each.value.mail_enabled ? ["Unified"] : [])
    mailEnabled     = each.value.mail_enabled   
    securityEnabled = each.value.security_enabled
    visibility      = each.value.visibility
    membershipRule  = try(each.value.membership_rule, null)
    membershipRuleProcessingState = try(each.value.membership_rule_processing_state, null)
  }

  response_export_values = {
    id = "id"
  }
}

# Teams creation for M365 groups (creates SharePoint site automatically)
# Reference: https://learn.microsoft.com/en-us/graph/api/team-post
# Note: Teams creation is async, so we track by the group ID instead
resource "msgraph_resource" "team_for_group" {
  for_each = { for k, v in var.entra_groups : k => v if try(v.create_team, false) }
  
  url = "teams"
  
  body = {
    "template@odata.bind" = "https://graph.microsoft.com/v1.0/teamsTemplates('standard')"
    "group@odata.bind"    = "https://graph.microsoft.com/v1.0/groups/${msgraph_resource.entra_group[each.key].output.id}"
  }
  
  response_export_values = {
    all = "@"
  }
  
  depends_on = [msgraph_resource.entra_group]
}
