# Alibaba Cloud DataWorks Terraform Module

This module creates **DataWorks projects** on Alibaba Cloud Stack and optionally configures **folders, connections, reminders, and user management**.

## Features

- Creates a new DataWorks project
- Optional: Creates folders within the project
- Optional: Creates data source connections (RDS, etc.)
- Optional: Creates reminder rules
- Optional: Adds users and assigns roles

## Usage

### Basic Usage: Create DataWorks Project

```hcl
module "dataworks" {
  source = "<Module Path>"

  project_name = "my-dataworks-project"
}
```

### Advanced Usage: Create Project with Folders

```hcl
module "dataworks" {
  source = "<Module Path>"

  project_name   = "my-dataworks-project"
  task_auth_type = "PROJECT"
  create_folders = true
  folders = [
    "业务流程/flow1/folderMaxCompute/folder1",
    "业务流程/flow1/folderGeneral/folder2"
  ]
}
```

### Advanced Usage: Create Project with RDS Connection

```hcl
module "dataworks" {
  source = "<Module Path>"

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

### Advanced Usage: Create Project with Users

```hcl
module "dataworks" {
  source = "<Module Path>"

  project_name = "my-dataworks-project"
  add_users    = true
  user_ids     = ["5225501456060119238", "5225501456060119239"]
  role_code    = "role_project_guest"
}
```

## Environment Dependencies

### Terraform Core

| Name      | Version   |
|-----------|-----------|
| Terraform | >= 1.5.6  |

### Provider

| Name              | Version                |
|-------------------|------------------------|
| alibabacloudstack | >= 3.18.24, < 3.19.0   |

## Module Variables

### Input Variables

| Name                         | Description                                                                                     | Type              | Default | Required |
|------------------------------|-------------------------------------------------------------------------------------------------|-------------------|---------|----------|
| `project_name`               | DataWorks project name                                                                          | `string`          | —       | Yes      |
| `task_auth_type`             | Task authorization type (`PROJECT` or `CUSTOM`)                                                 | `string`          | `PROJECT` | No     |
| `create_folders`             | Whether to create folders                                                                       | `bool`            | `false` | No       |
| `folders`                    | List of folder paths to create                                                                  | `list(string)`    | `[]`    | No       |
| `create_connection`          | Whether to create a data source connection                                                      | `bool`            | `false` | No       |
| `connection_name`            | Name of the connection                                                                          | `string`          | `""`    | No       |
| `connection_type`            | Type of connection (e.g., `rds`)                                                                | `string`          | `rds`   | No       |
| `connection_sub_type`        | Sub-type of connection (e.g., `mysql`, `sqlserver`)                                             | `string`          | `mysql` | No       |
| `connection_env_type`        | Environment type (0=Development, 1=Production)                                                  | `number`          | `1`     | No       |
| `connection_config`          | Connection configuration map                                                                    | `map(string)`     | `{}`    | No       |
| `create_reminder`            | Whether to create a reminder rule                                                               | `bool`            | `false` | No       |
| `reminder_name`              | Name of the reminder rule                                                                       | `string`          | `""`    | No       |
| `add_users`                  | Whether to add users to the project                                                             | `bool`            | `false` | No       |
| `user_ids`                   | List of user IDs to add                                                                         | `list(string)`    | `[]`    | No       |
| `role_code`                  | Role code to assign to users                                                                    | `string`          | `role_project_guest` | No |

### Output Variables

| Name                | Description                                      |
|---------------------|--------------------------------------------------|
| `project_id`        | ID of the created DataWorks project              |
| `project_name`      | Name of the created DataWorks project            |
| `folder_ids`        | IDs of the created folders                       |
| `connection_id`     | ID of the created connection                     |

## Examples

For more usage scenarios, see the [`examples/`](./examples) directory:
- `create-dataworks-project-basic`
- `create-dataworks-project-with-connection`
- `create-dataworks-project-with-folders`

## Notes

- This module **always creates a new DataWorks project**.
- Folder paths must follow the format: `业务流程/{Business Flow}/{Type}/{Name}`
- Supported folder types: `folderDi`, `folderMaxCompute`, `folderGeneral`, `folderJdbc`, `folderUserDefined`
