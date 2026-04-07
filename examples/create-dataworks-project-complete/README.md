# Complete DataWorks Project

This example creates a complete DataWorks project with all features: folders, RDS connection, reminder, and optional users.

## Usage

1. Configure variables (via `terraform.tfvars` or CLI):
   ```hcl
   project_name      = "my-complete-dataworks"
   rds_instance_name = "rm-xxxxxxxx"
   rds_owner_id      = "123456789"
   db_username       = "dbuser"
   db_password       = "dbpassword"
   db_name           = "mydb"
   user_ids          = ["5225501456060119238", "5225501456060119239"]
   role_code         = "role_project_guest"
   ```
2. Run:
   ```bash
   terraform init
   terraform plan
   terraform apply
   ```

3. Clean up:
   ```bash
   terraform destroy
   ```

## Features Included

- ✅ DataWorks Project
- ✅ Multiple Folders (MaxCompute, General, JDBC)
- ✅ RDS MySQL Connection
- ✅ Reminder Rule
- ✅ User Management (optional)

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.5.6 |

## Provider

| Name | Version |
|------|---------|
| alibabacloudstack | >= 3.18.24, < 3.19.0 |

## Module

| Name | Source | Version |
|------|--------|---------|
| dataworks_project | ../../modules/dataworks_project | n/a |

## Input Variables

| Name | Description | Type | Example | Required |
|------|-------------|------|--------|----------|
| project_name | Name of the new DataWorks project to create. | string | "tfdataworks1" | Yes |
| rds_instance_name | Name of the RDS instance. | string | "rm-xxxxxxxx" | Yes |
| rds_owner_id | Owner ID of the RDS instance. | string | "123456789" | Yes |
| db_username | Database username. | string | "dbuser" | Yes |
| db_password | Database password. | string | "dbpassword" | Yes |
| db_name | Database name. | string | "mydb" | Yes |
| user_ids | List of user IDs to add (optional). | list(string) | `["5225501456060119238"]` | No |
| role_code | Role code to assign to users. | string | "role_project_guest" | No |

## Output Variables

| Name | Description |
|------|-------------|
| project_id | ID of the created DataWorks project. |
| project_name | Name of the created DataWorks project. |
| folder_ids | IDs of the created folders. |
| connection_id | ID of the created connection. |
