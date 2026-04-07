# 阿里云 DataWorks Terraform 模块

该模块用于在阿里云 Stack 上创建 **DataWorks 项目**，并可选地配置 **文件夹、数据源连接、提醒规则和用户管理**。

## 功能特性

- 创建新的 DataWorks 项目
- 可选：在项目中创建文件夹
- 可选：创建数据源连接（RDS 等）
- 可选：创建提醒规则
- 可选：添加用户并分配角色

## 使用方法

### 基础用法：创建 DataWorks 项目

```hcl
module "dataworks" {
  source = "<Module Path>"

  project_name = "my-dataworks-project"
}
```

### 高级用法：创建带文件夹的项目

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

### 高级用法：创建带 RDS 连接的项目

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

### 高级用法：创建带用户的项目

```hcl
module "dataworks" {
  source = "<Module Path>"

  project_name = "my-dataworks-project"
  add_users    = true
  user_ids     = ["5225501456060119238", "5225501456060119239"]
  role_code    = "role_project_guest"
}
```

## 环境依赖

### Terraform Core

| 名称 | 版本 |
|------|------|
| Terraform | >= 1.5.6 |

### Provider

| 名称 | 版本 |
|------|------|
| alibabacloudstack | >= 3.18.24, < 3.19.0 |

## 模块变量

### 输入变量

| 名称 | 描述 | 类型 | 默认值 | 必需 |
|------|------|------|--------|------|
| `project_name` | DataWorks 项目名称 | `string` | — | 是 |
| `task_auth_type` | 任务授权类型（`PROJECT` 或 `CUSTOM`） | `string` | `PROJECT` | 否 |
| `create_folders` | 是否创建文件夹 | `bool` | `false` | 否 |
| `folders` | 要创建的文件夹路径列表 | `list(string)` | `[]` | 否 |
| `create_connection` | 是否创建数据源连接 | `bool` | `false` | 否 |
| `connection_name` | 连接名称 | `string` | `""` | 否 |
| `connection_type` | 连接类型（例如 `rds`） | `string` | `rds` | 否 |
| `connection_sub_type` | 连接子类型（例如 `mysql`、`sqlserver`） | `string` | `mysql` | 否 |
| `connection_env_type` | 环境类型（0=开发环境，1=生产环境） | `number` | `1` | 否 |
| `connection_config` | 连接配置映射 | `map(string)` | `{}` | 否 |
| `create_reminder` | 是否创建提醒规则 | `bool` | `false` | 否 |
| `reminder_name` | 提醒规则名称 | `string` | `""` | 否 |
| `add_users` | 是否添加用户到项目 | `bool` | `false` | 否 |
| `user_ids` | 要添加的用户 ID 列表 | `list(string)` | `[]` | 否 |
| `role_code` | 分配给用户的角色代码 | `string` | `role_project_guest` | 否 |

### 输出变量

| 名称 | 描述 |
|------|------|
| `project_id` | 创建的 DataWorks 项目 ID |
| `project_name` | 创建的 DataWorks 项目名称 |
| `folder_ids` | 创建的文件夹 ID 列表 |
| `connection_id` | 创建的连接 ID |

## 示例

更多使用场景请参见 [`examples/`](./examples) 目录：
- `create-dataworks-project-basic`
- `create-dataworks-project-with-connection`
- `create-dataworks-project-with-folders`

## 注意事项

- 本模块**总是创建新的 DataWorks 项目**。
- 文件夹路径必须遵循格式：`业务流程/{业务流程名称}/{类型}/{名称}`
- 支持的文件夹类型：`folderDi`、`folderMaxCompute`、`folderGeneral`、`folderJdbc`、`folderUserDefined`
