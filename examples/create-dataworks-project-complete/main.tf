module "dataworks_project" {
  source       = "../../modules/dataworks_project"
  project_name = var.project_name

  # Create folders
  create_folders = true
  folders = [
    "data_processing",
    "reports",
    "imports"
  ]

  # Create connection
  create_connection   = true
  connection_name     = "${var.project_name}-rds-connection"
  connection_type     = "rds"
  connection_sub_type = "mysql"
  connection_env_type = 1
  connection_config = {
    username     = var.db_username
    database     = var.db_name
    password     = var.db_password
    instanceName = var.rds_instance_name
    tag          = "rds"
  }

  # Create reminder
  create_reminder = true
  reminder_name   = "${var.project_name}-reminder"

  # Add users (if provided)
  add_users = length(var.user_ids) > 0
  user_ids  = var.user_ids
  role_code = var.role_code
}
