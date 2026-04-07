# 带用户的 DataWorks 项目

本示例用于创建一个带有用户和角色分配的 DataWorks 项目。

## 使用方法

1. 通过 `terraform.tfvars` 或命令行配置变量：
   ```hcl
   project_name = "my-dataworks-with-users"
   user_ids     = ["5225501456060119238", "5225501456060119239"]
   role_code    = "role_project_guest"
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

## 支持的角色代码

| 角色代码 | 描述 |
|----------|------|
| `role_project_admin` | 项目管理员 |
| `role_project_dev` | 开发者 |
| `role_project_guest` | 访客（只读） |
| `role_project_ops` | 运维人员 |
| `role_project_deploy` | 部署人员 |

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
| user_ids | 要添加到项目的用户 ID 列表。 | list(string) | `["5225501456060119238"]` | 是 |
| role_code | 要分配给用户的角色代码。 | string | "role_project_guest" | 否 |

## 输出变量

| 名称 | 描述 |
|------|------|
| project_id | 创建的 DataWorks 项目 ID。 |
| project_name | 创建的 DataWorks 项目名称。 |
