output "location" {
  value       = local.location
  description = "Azure region"
}

output "location_pair" {
  value       = local.paired_regions[var.location]
  description = "Azure paired region"
}

output "names" {
  value       = local.names
  description = "Map of validated names for resources"
}

output "tags" {
  value       = local.tags
  description = "Map of tags with any global defaults appended"
}
