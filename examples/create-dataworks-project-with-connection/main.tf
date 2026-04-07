module "dataworks_project" {
  source       = "../../modules/dataworks_project"
  project_name = var.project_name

  create_connection   = true
  connection_name     = var.connection_name
  connection_type     = "rds"
  connection_sub_type = "mysql"
  connection_env_type = 1
  connection_config = {
    username     = var.db_username
    database     = var.db_name
    password     = var.db_password
    instanceName = var.rds_instance_name
  }
}
