output "project_id" {
  description = "The ID of the DataWorks project."
  value       = module.default.project_id
}

output "project_name" {
  description = "The name of the DataWorks project."
  value       = module.default.project_name
}

output "folder_ids" {
  description = "The IDs of the created folders."
  value       = module.default.folder_ids
}

output "connection_id" {
  description = "The ID of the connection."
  value       = module.default.connection_id
}
