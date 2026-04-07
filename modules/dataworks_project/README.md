# Alibaba Cloud DataWorks Terraform Module

This module manages Alibaba Cloud DataWorks projects on Alibaba Cloud Stack, supporting:
- **Creating a new DataWorks project**
- **Creating folders within the project**
- **Creating data source connections** (RDS, etc.)
- **Creating reminder rules**
- **Adding users and assigning roles**

## Supported Resources

* [alibabacloudstack_data_works_project](https://registry.terraform.io/providers/aliyun/alibabacloudstack/latest/docs/resources/data_works_project)
* [alibabacloudstack_data_works_folder](https://registry.terraform.io/providers/aliyun/alibabacloudstack/latest/docs/resources/data_works_folder)
* [alibabacloudstack_data_works_connection](https://registry.terraform.io/providers/aliyun/alibabacloudstack/latest/docs/resources/data_works_connection)
* [alibabacloudstack_data_works_user](https://registry.terraform.io/providers/aliyun/alibabacloudstack/latest/docs/resources/data_works_user)
* [alibabacloudstack_data_works_user_role_binding](https://registry.terraform.io/providers/aliyun/alibabacloudstack/latest/docs/resources/data_works_user_role_binding)
* [alibabacloudstack_data_works_remind](https://registry.terraform.io/providers/aliyun/alibabacloudstack/latest/docs/resources/data_works_remind)

## Usage Examples

### Scenario 1: Create a basic DataWorks project

```hcl
module "dataworks" {
  source = "./terraform-alibabacloudstack-dataworks"

  project_name = "my-dataworks-project"
}
```

### Scenario 2: Create project with folders

```hcl
module "dataworks" {
  source = "./terraform-alibabacloudstack-dataworks"

  project_name   = "my-dataworks-project"
  task_auth_type = "PROJECT"
  create_folders = true
  folders = [
    "业务流程/flow1/folderMaxCompute/folder1",
    "业务流程/flow1/folderGeneral/folder2"
  ]
}
```

### Scenario 3: Create project with RDS connection

```hcl
module "dataworks" {
  source = "./terraform-alibabacloudstack-dataworks"

  project_name      = "my-dataworks-project"
  create_connection = true
  connection_name   = "rds-mysql-connection"
  connection_type   = "rds"
  connection_sub_type = "mysql"
  connection_env_type = 1
  connection_config = {
    username     = "dbuser"
    database     = "mydb"
    password     = "dbpassword"
    instanceName = "rm-xxxxxxxx"
    rdsOwnerId   = "123456789"
  }
}
```

### Scenario 4: Create project with users

```hcl
module "dataworks" {
  source = "./terraform-alibabacloudstack-dataworks"

  project_name = "my-dataworks-project"
  add_users    = true
  user_ids     = ["5225501456060119238", "5225501456060119239"]
  role_code    = "role_project_guest"
}
```

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.5.6 |

## Providers

| Name | Version |
|------|---------|
| alibabacloudstack | >= 3.18.24, < 3.19.0 |

## Input Variables

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| **project_name** | **Name for the new DataWorks project** | `string` | — | Yes |
| task_auth_type | Task authorization type (`PROJECT` or `CUSTOM`) | `string` | `PROJECT` | No |
| create_folders | Whether to create folders | `bool` | `false` | No |
| folders | List of folder paths to create | `list(string)` | `[]` | No |
| create_connection | Whether to create a data source connection | `bool` | `false` | No |
| connection_name | Name of the connection | `string` | `""` | No |
| connection_type | Type of connection (e.g., `rds`) | `string` | `rds` | No |
| connection_sub_type | Sub-type of connection (e.g., `mysql`, `sqlserver`) | `string` | `mysql` | No |
| connection_env_type | Environment type (0=Development, 1=Production) | `number` | `1` | No |
| connection_config | Connection configuration map | `map(string)` | `{}` | No |
| create_reminder | Whether to create a reminder rule | `bool` | `false` | No |
| reminder_name | Name of the reminder rule | `string` | `""` | No |
| add_users | Whether to add users to the project | `bool` | `false` | No |
| user_ids | List of user IDs to add | `list(string)` | `[]` | No |
| role_code | Role code to assign to users | `string` | `role_project_guest` | No |

## Output Values

| Name | Description |
|------|-------------|
| project_id | ID of the DataWorks project |
| project_name | Name of the DataWorks project |
| folder_ids | IDs of the created folders |
| connection_id | ID of the created connection |

## Notes

* Folder paths must follow the format: `业务流程/{Business Flow}/{Type}/{Name}`
* Supported folder types: `folderDi`, `folderMaxCompute`, `folderGeneral`, `folderJdbc`, `folderUserDefined`

## Reporting Issues

If you encounter any issues while using this module, please open an issue in the [provider repository](https://github.com/aliyun/terraform-provider-alibabacloudstack/issues/new).

> **Note**: Please do **not** open issues in this module's repository.

## Authors

Created and maintained by the Alibaba Cloud Terraform Team.

## License

MIT License. See LICENSE for details.

## References

* [Terraform Provider for Alibaba Cloud Stack (GitHub)](https://github.com/aliyun/terraform-provider-alibabacloudstack)
* [Terraform Provider Registry](https://registry.terraform.io/providers/aliyun/alibabacloudstack)
* [Provider Documentation](https://registry.terraform.io/providers/aliyun/alibabacloudstack/latest/docs)
