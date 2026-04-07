# 带 RDS 连接的 DataWorks 项目

本示例用于创建一个带有 RDS MySQL 连接的 DataWorks 项目。

## 使用方法

1. 通过 `terraform.tfvars` 或命令行配置变量：
   ```hcl
   project_name      = "my-dataworks-with-connection"
   rds_instance_name = "rm-xxxxxxxx"
   rds_owner_id      = "123456789"
   db_username       = "dbuser"
   db_password       = "dbpassword"
   db_name           = "mydb"
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
| connection_name | 连接名称（可选）。 | string | "rds-connection" | 否 |
| rds_instance_name | RDS 实例的名称。 | string | "rm-xxxxxxxx" | 是 |
| rds_owner_id | RDS 实例的所有者 ID。 | string | "123456789" | 是 |
| db_username | 数据库用户名。 | string | "dbuser" | 是 |
| db_password | 数据库密码。 | string | "dbpassword" | 是 |
| db_name | 数据库名称。 | string | "mydb" | 是 |

## 输出变量

| 名称 | 描述 |
|------|------|
| project_id | 创建的 DataWorks 项目 ID。 |
| project_name | 创建的 DataWorks 项目名称。 |
| connection_id | 创建的连接 ID。 |
