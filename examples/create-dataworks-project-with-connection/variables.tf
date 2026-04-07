variable "project_name" {
  description = "The name of the DataWorks project to create."
  type        = string
}

variable "connection_name" {
  description = "The name of the connection."
  type        = string
  default     = ""
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
