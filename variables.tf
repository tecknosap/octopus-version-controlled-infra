variable "address" {
  type        = string
  description = "Octopus Deploy server URL"
  default     = "https://tecknosap.octopus.app"
  # default = "https://octopus.office.interxion.net"
}

variable "api_key" {
  type        = string
  sensitive   = true
  description = "API key for Octopus Deploy"
}

variable "space_id" {
  type        = string
  description = "Octopus space ID"
  default     = "Spaces-1"
}

variable "project_group_name" {
  type        = string
  default     = "Infrastructures"
}

variable "project_name" {
  type        = string
  default     = "octopus-infra-project"
}

variable "project_description" {
  type        = string
  default     = "devops managed by Terraform"
}

variable "lifecycle_name" {
  type        = string
  default     = "Standard Promotion"
}

variable "variable_set_names" {
  type        = list(string)
  default     = [
    "Azure Resources",
    "Azure SQL Server Resources",
    "Certificates",
    "Database Server"
  ]
}

variable "git_username" {
  type = string
  default = "mahad.mohamed@rewtechnology.com"
}
variable "git_password" {
  sensitive = true
}