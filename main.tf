module "default" {
  source = "./modules/dataworks_project"

  project_name        = var.project_name
  task_auth_type      = var.task_auth_type
  create_folders      = var.create_folders
  folders             = var.folders
  create_connection   = var.create_connection
  connection_name     = var.connection_name
  connection_type     = var.connection_type
  connection_sub_type = var.connection_sub_type
  connection_env_type = var.connection_env_type
  connection_config   = var.connection_config
  create_reminder     = var.create_reminder
  reminder_name       = var.reminder_name
  add_users           = var.add_users
  user_ids            = var.user_ids
  role_code           = var.role_code
}
