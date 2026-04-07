variable "project_name" {
  description = "The name of the DataWorks project to create."
  type        = string
}

variable "folders" {
  description = "List of folder paths to create."
  type        = list(string)
  default     = []
}
