output "vpc_id" {
  description = "The ID of the created VPC."
  value       = alibabacloudstack_vpc_vpc.existing.id
}

output "vswitch_id" {
  description = "The ID of the created VSwitch."
  value       = alibabacloudstack_vpc_vswitch.existing.id
}

output "db_instance_id" {
  value = alibabacloudstack_db_instance.existing.id
}

output "username" {
  value = alibabacloudstack_db_account.existing.account_name
}

output "database" {
  value = alibabacloudstack_db_database.existing.data_base_name
}
