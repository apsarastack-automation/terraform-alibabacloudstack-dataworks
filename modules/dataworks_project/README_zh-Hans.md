# 阿里云 DataWorks Terraform 模块

该模块用于在阿里云 Stack 上管理 DataWorks 项目，支持：
- **创建新的 DataWorks 项目**
- **在项目中创建文件夹**
- **创建数据源连接**（RDS 等）
- **创建提醒规则**
- **添加用户并分配角色**

## 支持资源

* [alibabacloudstack_data_works_project](https://registry.terraform.io/providers/aliyun/alibabacloudstack/latest/docs/resources/data_works_project)
* [alibabacloudstack_data_works_folder](https://registry.terraform.io/providers/aliyun/alibabacloudstack/latest/docs/resources/data_works_folder)
* [alibabacloudstack_data_works_connection](https://registry.terraform.io/providers/aliyun/alibabacloudstack/latest/docs/resources/data_works_connection)
* [alibabacloudstack_data_works_user](https://registry.terraform.io/providers/aliyun/alibabacloudstack/latest/docs/resources/data_works_user)
* [alibabacloudstack_data_works_user_role_binding](https://registry.terraform.io/providers/aliyun/alibabacloudstack/latest/docs/resources/data_works_user_role_binding)
* [alibabacloudstack_data_works_remind](https://registry.terraform.io/providers/aliyun/alibabacloudstack/latest/docs/resources/data_works_remind)

## 使用方法

### 场景 1：创建基本的 DataWorks 项目

```hcl
module "dataworks" {
  source = "./terraform-alibabacloudstack-dataworks"

  project_name = "my-dataworks-project"
}
```

### 场景 2：创建带文件夹的项目

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

### 场景 3：创建带 RDS 连接的项目

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

### 场景 4：创建带用户的项目

```hcl
module "dataworks" {
  source = "./terraform-alibabacloudstack-dataworks"

  project_name = "my-dataworks-project"
  add_users    = true
  user_ids     = ["5225501456060119238", "5225501456060119239"]
  role_code    = "role_project_guest"
}
```

## 要求

| 名称 | 版本 |
|------|------|
| terraform | >= 1.5.6 |

## 提供商

| 名称 | 版本 |
|------|------|
| alibabacloudstack | >= 3.18.24, < 3.19.0 |

## 输入变量

| 名称 | 描述 | 类型 | 默认值 | 必需 |
|------|------|------|--------|------|
| **project_name** | **新 DataWorks 项目的名称** | `string` | — | 是 |
| task_auth_type | 任务授权类型（`PROJECT` 或 `CUSTOM`） | `string` | `PROJECT` | 否 |
| create_folders | 是否创建文件夹 | `bool` | `false` | 否 |
| folders | 要创建的文件夹路径列表 | `list(string)` | `[]` | 否 |
| create_connection | 是否创建数据源连接 | `bool` | `false` | 否 |
| connection_name | 连接名称 | `string` | `""` | 否 |
| connection_type | 连接类型（例如 `rds`） | `string` | `rds` | 否 |
| connection_sub_type | 连接子类型（例如 `mysql`、`sqlserver`） | `string` | `mysql` | 否 |
| connection_env_type | 环境类型（0=开发环境，1=生产环境） | `number` | `1` | 否 |
| connection_config | 连接配置映射 | `map(string)` | `{}` | 否 |
| create_reminder | 是否创建提醒规则 | `bool` | `false` | 否 |
| reminder_name | 提醒规则名称 | `string` | `""` | 否 |
| add_users | 是否添加用户到项目 | `bool` | `false` | 否 |
| user_ids | 要添加的用户 ID 列表 | `list(string)` | `[]` | 否 |
| role_code | 分配给用户的角色代码 | `string` | `role_project_guest` | 否 |

## 输出变量

| 名称 | 描述 |
|------|------|
| project_id | DataWorks 项目的 ID |
| project_name | DataWorks 项目的名称 |
| folder_ids | 创建的文件夹 ID 列表 |
| connection_id | 创建的连接 ID |

## 注意事项

* 文件夹路径必须遵循格式：`业务流程/{业务流程名称}/{类型}/{名称}`
* 支持的文件夹类型：`folderDi`、`folderMaxCompute`、`folderGeneral`、`folderJdbc`、`folderUserDefined`

## 提交问题

如果您在使用此模块时遇到任何问题，请提交 [provider issue](https://github.com/aliyun/terraform-provider-alibabacloudstack/issues/new) 并告知我们。

**注意：** 不建议在此仓库上提交 issue。

## 作者

由阿里云 Terraform 团队创建和维护

## 许可证

MIT 许可证。详情请参见 LICENSE。

## 参考

* [Terraform-Provider-Alibabacloudstack Github](https://github.com/aliyun/terraform-provider-alibabacloudstack)
* [Terraform-Provider-Alibabacloudstack Release](https://registry.terraform.io/providers/aliyun/alibabacloudstack)
* [Terraform-Provider-Alibabacloudstack 文档](https://registry.terraform.io/providers/aliyun/alibabacloudstack/latest/docs)
