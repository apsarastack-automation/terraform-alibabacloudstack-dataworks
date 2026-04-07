variable "project_name" {
  description = "The name of the DataWorks project."
  type        = string
}

variable "task_auth_type" {
  description = "The task authorization type for the DataWorks project."
  type        = string
  default     = "PROJECT"
}

variable "create_folders" {
  description = "Whether to create folders in the DataWorks project."
  type        = bool
  default     = false
}

variable "folders" {
  description = "List of folder paths to create."
  type        = list(string)
  default     = []
}

variable "business_name" {
  description = "The name of the business flow."
  type        = string
  default     = "default"
}

variable "engine_type" {
  description = "The type of the compute engine."
  type        = string
  default     = "General"
}

variable "create_connection" {
  type    = bool
  default = false
}

variable "connection_name" {
  description = "The name of the connection."
  type        = string
  default     = ""
}

variable "connection_type" {
  description = "Type of connection (e.g., 'rds')."
  type        = string
  default     = "rds"
}

variable "connection_sub_type" {
  description = "Sub-type of connection (e.g., 'mysql', 'sqlserver')."
  type        = string
  default     = "mysql"
}

variable "connection_env_type" {
  description = "The environment type (0=Development, 1=Production)."
  type        = number
  default     = 1
}

variable "connection_config" {
  description = "Connection configuration map containing username, database, password, instanceName, etc."
  type        = map(string)
  default     = {}
}

variable "create_reminder" {
  description = "Whether to create a reminder rule."
  type        = bool
  default     = false
}

variable "reminder_name" {
  description = "The name of the reminder rule."
  type        = string
  default     = ""
}

variable "add_users" {
  description = "Whether to add users to the project."
  type        = bool
  default     = false
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

variable "remind_type" {
  description = "Reminder type (e.g., 'TIMEOUT', 'ALERT')."
  type        = string
  default     = "TIMEOUT"
}

variable "remind_unit" {
  description = "Reminder unit (e.g., 'PROJECT', 'TASK')."
  type        = string
  default     = "PROJECT"
}

variable "alert_unit" {
  description = "Alert unit (e.g., 'OTHER')."
  type        = string
  default     = "OTHER"
}

variable "alert_methods" {
  description = "List of alert methods (e.g., 'SMS')."
  type        = list(string)
  default     = ["SMS"]
}


variable "robot_urls" {
  description = "List of robot URLs to add to the project."
  type        = list(string)
  default     = []
}
variable "webhooks" {
  description = "List of webhook URLs to add to the project."
  type        = list(string)
  default     = []
}

variable "remind_detail" {
  description = "Reminder detail."
  type        = number
  default     = 600
}
