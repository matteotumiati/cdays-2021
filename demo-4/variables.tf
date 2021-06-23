variable "username" {
  description = "The username used to connect to the SQL instance"
  type        = string
}

variable "password" {
  description = "The password used to connect to the SQL instance"
  type        = string
  sensitive   = true
}