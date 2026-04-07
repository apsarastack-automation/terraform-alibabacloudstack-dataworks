# 带文件夹的 DataWorks 项目

本示例用于创建一个带有多个业务文件夹的 DataWorks 项目。

## 使用方法

1. 通过 `terraform.tfvars` 或命令行配置变量：
   ```hcl
   project_name = "my-dataworks-with-folders"
   folders = [
     "业务流程/flow1/folderMaxCompute/data_processing",
     "业务流程/flow1/folderGeneral/reports",
     "业务流程/flow1/folderJdbc/imports"
   ]
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

## 文件夹路径格式

文件夹路径必须遵循格式：`业务流程/{业务流程名称}/{文件夹类型}/{文件夹名称}`

### 支持的文件夹类型

| 类型 | 描述 |
|------|------|
| `folderDi` | 数据集成文件夹 |
| `folderMaxCompute` | MaxCompute 文件夹 |
| `folderGeneral` | 通用文件夹 |
| `folderJdbc` | JDBC 连接文件夹 |
| `folderUserDefined` | 用户自定义文件夹 |

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
| folders | 要创建的文件夹路径列表（可选，为空时使用默认值）。 | list(string) | 见上文 | 否 |

## 输出变量

| 名称 | 描述 |
|------|------|
| project_id | 创建的 DataWorks 项目 ID。 |
| project_name | 创建的 DataWorks 项目名称。 |
| folder_ids | 创建的文件夹 ID 列表。 |
