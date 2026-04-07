# Basic DataWorks Project

This example creates a basic DataWorks project.

## Usage

1. Configure variables (via `terraform.tfvars` or CLI):
   ```hcl
   project_name = "my-basic-dataworks"
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

## Output Variables

| Name | Description |
|------|-------------|
| project_id | ID of the created DataWorks project. |
| project_name | Name of the created DataWorks project. |
