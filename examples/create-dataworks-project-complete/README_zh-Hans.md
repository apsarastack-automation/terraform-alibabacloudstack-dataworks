# 完整的 DataWorks 项目

本示例用于创建一个包含所有功能的完整 DataWorks 项目：文件夹、RDS 连接、提醒和用户（可选）。

## 使用方法

1. 通过 `terraform.tfvars` 或命令行配置变量：
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
2. 执行以下命令：
   ```bash
   terraform init
   terraform plan
   terraform apply
   ```

3. 清理资源：
   ```bash
   terraform destroy
   ```

## 包含的功能

- ✅ DataWorks 项目
- ✅ 多个文件夹（MaxCompute、通用、JDBC）
- ✅ RDS MySQL 连接
- ✅ 提醒规则
- ✅ 用户管理（可选）

## 要求

| 名称 | 版本 |
|------|------|
| terraform | >= 1.5.6 |

## 提供商

| 名称 | 版本 |
|------|------|
| alibabacloudstack | >= 3.18.24, < 3.19.0 |

## 模块

| 名称 | 来源 | 版本 |
|------|------|------|
| dataworks_project | ../../modules/dataworks_project | n/a |

## 输入变量

| 名称 | 描述 | 类型 | 示例值 | 必需 |
|------|------|------|--------|------|
| project_name | 要创建的新 DataWorks 项目名称。 | string | "tfdataworks1" | 是 |
| rds_instance_name | RDS 实例的名称。 | string | "rm-xxxxxxxx" | 是 |
| rds_owner_id | RDS 实例的所有者 ID。 | string | "123456789" | 是 |
| db_username | 数据库用户名。 | string | "dbuser" | 是 |
| db_password | 数据库密码。 | string | "dbpassword" | 是 |
| db_name | 数据库名称。 | string | "mydb" | 是 |
| user_ids | 要添加到项目的用户 ID 列表（可选）。 | list(string) | `["5225501456060119238"]` | 否 |
| role_code | 要分配给用户的角色代码。 | string | "role_project_guest" | 否 |

## 输出变量

| 名称 | 描述 |
|------|------|
| project_id | 创建的 DataWorks 项目 ID。 |
| project_name | 创建的 DataWorks 项目名称。 |
| folder_ids | 创建的文件夹 ID 列表。 |
| connection_id | 创建的连接 ID。 |
