# --- DataWorks Project Resource ---

resource "alibabacloudstack_data_works_project" "default" {
  project_name   = var.project_name
  task_auth_type = var.task_auth_type
  description    = "DataWorks project created by Terraform"

  lifecycle {
    precondition {
      condition     = var.project_name != ""
      error_message = "Configuration error: 'project_name' must be set."
    }
  }
}

# --- Project derived locals ---

locals {
  project_id   = alibabacloudstack_data_works_project.default.project_id
  project_name = alibabacloudstack_data_works_project.default.project_name
}


# --- DataWorks Folder Resources ---

resource "alibabacloudstack_data_works_business" "default" {
  count       = length(var.folders) > 0 ? 1 : 0
  project_id  = local.project_id
  name        = var.business_name
  description = "${var.business_name}_desc"
}

locals {
  business_name = length(alibabacloudstack_data_works_business.default) > 0 ? alibabacloudstack_data_works_business.default[0].name : ""
}

resource "alibabacloudstack_data_works_folder" "default" {
  for_each      = var.create_folders ? toset(var.folders) : []
  project_id    = local.project_id
  folder_path   = each.value
  business_name = local.business_name
  engine_type   = var.engine_type
}

# --- DataWorks Connection Resource ---

resource "alibabacloudstack_data_works_connection" "default" {
  count           = var.create_connection ? 1 : 0
  project_id      = local.project_id
  name            = var.connection_name != "" ? var.connection_name : "${var.project_name}-connection"
  connection_type = var.connection_type
  sub_type        = var.connection_sub_type
  env_type        = tostring(var.connection_env_type)
  description     = "Connection for ${var.project_name}"

  content = {
    username     = lookup(var.connection_config, "username", "")
    database     = lookup(var.connection_config, "database", "")
    tag          = var.connection_type
    password     = lookup(var.connection_config, "password", "")
    instanceName = lookup(var.connection_config, "instanceName", "")
    rdsOwnerId   = lookup(var.connection_config, "rdsOwnerId", "")
  }
}

# --- DataWorks User Resources ---

resource "alibabacloudstack_data_works_user" "default" {
  for_each   = var.add_users ? toset(var.user_ids) : []
  project_id = local.project_id
  user_id    = each.value
  role_code  = [var.role_code]
}

# --- DataWorks User Role Binding Resources ---

resource "alibabacloudstack_data_works_user_role_binding" "default" {
  for_each   = var.add_users ? toset(var.user_ids) : []
  project_id = local.project_id
  user_id    = each.value
  role_code  = var.role_code
}

# --- DataWorks Remind Resource ---

resource "alibabacloudstack_data_works_remind" "default" {
  count         = var.create_reminder ? 1 : 0
  project_id    = local.project_id
  remind_name   = var.reminder_name != "" ? var.reminder_name : "${var.project_name}-reminder"
  remind_type   = var.remind_type
  remind_unit   = var.remind_unit
  alert_unit    = var.alert_unit
  alert_targets = [for u in alibabacloudstack_data_works_user.default : u.project_member_id]
  alert_methods = var.alert_methods
  robot_urls    = length(var.robot_urls) > 0 ? var.robot_urls : null
  webhooks      = length(var.webhooks) > 0 ? var.webhooks : null
  detail        = var.remind_detail
}
