# DataWorks Project with Users

This example creates a DataWorks project with users and role assignments.

## Usage

1. Configure variables (via `terraform.tfvars` or CLI):
   ```hcl
   project_name = "my-dataworks-with-users"
   user_ids     = ["5225501456060119238", "5225501456060119239"]
   role_code    = "role_project_guest"
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

## Supported Role Codes

| Role Code | Description |
|-----------|-------------|
| `role_project_admin` | Project Administrator |
| `role_project_dev` | Developer |
| `role_project_guest` | Guest (read-only) |
| `role_project_ops` | Operations |
| `role_project_deploy` | Deployment |

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
| user_ids | List of user IDs to add to the project. | list(string) | `["5225501456060119238"]` | Yes |
| role_code | Role code to assign to users. | string | "role_project_guest" | No |

## Output Variables

| Name | Description |
|------|-------------|
| project_id | ID of the created DataWorks project. |
| project_name | Name of the created DataWorks project. |
