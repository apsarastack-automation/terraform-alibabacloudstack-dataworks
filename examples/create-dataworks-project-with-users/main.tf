module "dataworks_project" {
  source       = "../../modules/dataworks_project"
  project_name = var.project_name

  add_users = true
  user_ids  = var.user_ids
  role_code = var.role_code
}
