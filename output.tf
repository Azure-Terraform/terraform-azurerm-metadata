output "location" {
  value = local.location
  description = "Azure region"
}

output "names" {
  value = local.names
  description = "Map of validated names for resources"
}

output "tags" {
  value = local.tags
  description = "Map of tags with any global defaults appended"
}