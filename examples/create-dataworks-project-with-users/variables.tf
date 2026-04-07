variable "project_name" {
  description = "The name of the DataWorks project to create."
  type        = string
}

variable "user_ids" {
  description = "List of user IDs to add to the project."
  type        = list(string)
}

variable "role_code" {
  description = "Role code to assign to users."
  type        = string
  default     = "role_project_guest"
}
