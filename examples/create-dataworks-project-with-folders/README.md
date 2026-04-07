# DataWorks Project with Folders

This example creates a DataWorks project with multiple business folders.

## Usage

1. Configure variables (via `terraform.tfvars` or CLI):
   ```hcl
   project_name = "my-dataworks-with-folders"
   folders = [
     "业务流程/flow1/folderMaxCompute/data_processing",
     "业务流程/flow1/folderGeneral/reports",
     "业务流程/flow1/folderJdbc/imports"
   ]
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

## Folder Path Format

Folder paths must follow the format: `业务流程/{Business Flow}/{Folder Type}/{Folder Name}`

### Supported Folder Types

| Type | Description |
|------|-------------|
| `folderDi` | Data Integration folder |
| `folderMaxCompute` | MaxCompute folder |
| `folderGeneral` | General purpose folder |
| `folderJdbc` | JDBC connection folder |
| `folderUserDefined` | User defined folder |

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
| folders | List of folder paths to create (optional, uses defaults if empty). | list(string) | See above | No |

## Output Variables

| Name | Description |
|------|-------------|
| project_id | ID of the created DataWorks project. |
| project_name | Name of the created DataWorks project. |
| folder_ids | IDs of the created folders. |
