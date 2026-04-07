data "alibabacloudstack_ascm_users" "existing" {
  name_regex = var.username
}

locals {
  create_user = length(data.alibabacloudstack_ascm_users.existing.users) > 0 ? 0 : 1
  user_id     = length(data.alibabacloudstack_ascm_users.existing.users) > 0 ? data.alibabacloudstack_ascm_users.existing.users[0].id : alibabacloudstack_ascm_user.existing.0.id
  user_uid    = length(data.alibabacloudstack_ascm_users.existing.users) > 0 ? data.alibabacloudstack_ascm_users.existing.users[0].primary_key : alibabacloudstack_ascm_user.existing.0.user_uid
}


resource "alibabacloudstack_ascm_user" "existing" {
  count              = local.create_user
  login_name         = var.username
  display_name       = var.username
  email              = "${var.username}@example.com"
  cellphone_number   = "13811111111"
  mobile_nation_code = "86"
  login_policy_id    = 1
}
