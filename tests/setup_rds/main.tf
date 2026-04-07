data "alibabacloudstack_db_zones" "existing" {
}

data "alibabacloudstack_rds_instance_types" "existing" {
  engine    = "MySQL"
  sorted_by = "CPU"
  series    = "dual_ha"
}

resource "alibabacloudstack_vpc_vpc" "existing" {
  vpc_name   = "${var.name}-vpc"
  cidr_block = "172.16.0.0/12"
}

resource "alibabacloudstack_vpc_vswitch" "existing" {
  vpc_id       = alibabacloudstack_vpc_vpc.existing.id
  cidr_block   = "172.16.0.0/21"
  zone_id      = data.alibabacloudstack_db_zones.existing.ids.0
  vswitch_name = "${var.name}-vswitch"
}

resource "alibabacloudstack_db_instance" "existing" {
  engine                   = data.alibabacloudstack_rds_instance_types.existing.instance_types.0.engine
  cpu_type                 = data.alibabacloudstack_rds_instance_types.existing.instance_types.0.cpu_type
  engine_version           = data.alibabacloudstack_rds_instance_types.existing.instance_types.0.engine_version
  db_instance_class        = data.alibabacloudstack_rds_instance_types.existing.instance_types.0.id
  db_instance_storage      = data.alibabacloudstack_rds_instance_types.existing.instance_types.0.storage_min
  db_instance_description  = var.name
  vswitch_id               = alibabacloudstack_vpc_vswitch.existing.id
  monitoring_period        = "60"
  db_instance_storage_type = data.alibabacloudstack_rds_instance_types.existing.instance_types.0.storage_type
  zone_id                  = data.alibabacloudstack_db_zones.existing.ids.0
}

resource "alibabacloudstack_db_database" "existing" {
  data_base_instance_id = alibabacloudstack_db_instance.existing.id
  data_base_name        = "${var.name}-db"
  data_base_description = "from terraform"
  character_set_name    = "utf8"
}

resource "alibabacloudstack_db_account" "existing" {
  data_base_instance_id = alibabacloudstack_db_instance.existing.id
  account_name          = "tftest"
  password              = var.password
  account_description   = "from terraform"
}

resource "alibabacloudstack_db_account_privilege" "existing" {
  data_base_instance_id = alibabacloudstack_db_instance.existing.id
  account_name          = alibabacloudstack_db_account.existing.account_name
  privilege             = "ReadOnly"
  db_names              = [alibabacloudstack_db_database.existing.data_base_name]
}
