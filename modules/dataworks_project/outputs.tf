output "project_id" {
  description = "The ID of the DataWorks project."
  value       = local.project_id
}

output "project_name" {
  description = "The name of the DataWorks project."
  value       = local.project_name
}

output "folder_ids" {
  description = "The IDs of the created folders."
  value       = [for folder in alibabacloudstack_data_works_folder.default : folder.id]
}

output "connection_id" {
  description = "The ID of the connection."
  value       = var.create_connection ? one(alibabacloudstack_data_works_connection.default).connection_id : null
}
