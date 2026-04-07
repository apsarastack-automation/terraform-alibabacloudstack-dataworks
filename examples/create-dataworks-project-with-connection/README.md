# DataWorks Project with RDS Connection

This example creates a DataWorks project with an RDS MySQL connection.

## Usage

1. Configure variables (via `terraform.tfvars` or CLI):
   ```hcl
   project_name      = "my-dataworks-with-connection"
   rds_instance_name = "rm-xxxxxxxx"
   rds_owner_id      = "123456789"
   db_username       = "dbuser"
   db_password       = "dbpassword"
   db_name           = "mydb"
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
| connection_name | Name of the connection (optional). | string | "rds-connection" | No |
| rds_instance_name | Name of the RDS instance. | string | "rm-xxxxxxxx" | Yes |
| rds_owner_id | Owner ID of the RDS instance. | string | "123456789" | Yes |
| db_username | Database username. | string | "dbuser" | Yes |
| db_password | Database password. | string | "dbpassword" | Yes |
| db_name | Database name. | string | "mydb" | Yes |

## Output Variables

| Name | Description |
|------|-------------|
| project_id | ID of the created DataWorks project. |
| project_name | Name of the created DataWorks project. |
| connection_id | ID of the created connection. |
