data "alibabacloudstack_ascm_users" "existing" {
  name_regex = var.username
}

# Guard against non-deterministic user resolution: name_regex is a partial
# match and may hit multiple users; picking [0] could drift between plans.
check "single_ascm_user_match" {
  assert {
    condition     = length(data.alibabacloudstack_ascm_users.existing.users) <= 1
    error_message = "name_regex '${var.username}' matched ${length(data.alibabacloudstack_ascm_users.existing.users)} ASCM users; use a more specific username to avoid drift."
  }
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
