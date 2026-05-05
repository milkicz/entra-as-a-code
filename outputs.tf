# Entra Groups outputs
output "entra_group_ids" {
  description = "Map of Entra group IDs keyed by configuration name"
  value       = { for key, group in msgraph_resource.entra_group : key => group.output.id }
}

output "team_enabled_groups" {
  description = "Map of groups with Teams enabled (includes SharePoint site)"
  value       = { for key, team in msgraph_resource.team_for_group : key => try(team.output.id, msgraph_resource.entra_group[key].output.id) }
}
