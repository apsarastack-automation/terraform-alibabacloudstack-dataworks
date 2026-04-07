output "project_id" {
  description = "The ID of the DataWorks project."
  value       = module.dataworks_project.project_id
}

output "project_name" {
  description = "The name of the DataWorks project."
  value       = module.dataworks_project.project_name
}

output "connection_id" {
  description = "The ID of the connection."
  value       = module.dataworks_project.connection_id
}
