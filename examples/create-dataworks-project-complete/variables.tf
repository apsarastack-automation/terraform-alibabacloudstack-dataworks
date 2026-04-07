variable "project_name" {
  description = "The name of the DataWorks project to create."
  type        = string
}

variable "rds_instance_name" {
  description = "The name of the RDS instance."
  type        = string
}

variable "db_username" {
  description = "The database username."
  type        = string
}

variable "db_password" {
  description = "The database password."
  type        = string
}

variable "db_name" {
  description = "The database name."
  type        = string
}

variable "user_ids" {
  description = "List of user IDs to add to the project."
  type        = list(string)
  default     = []
}

variable "role_code" {
  description = "Role code to assign to users."
  type        = string
  default     = "role_project_guest"
}
