module "dataworks_project" {
  source       = "../../modules/dataworks_project"
  project_name = var.project_name

  create_folders = true
  folders = length(var.folders) > 0 ? var.folders : [
    "data_processing",
    "reports",
    "imports"
  ]
}
