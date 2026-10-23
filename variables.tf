variable "cidr_block" {
  description = "cidr block for the vpc"
  type        = string
  default     = "10.0.0.0/16"
}

variable "environment" {
  description = "Environment Name"
  type        = string
  default     = "production"
}

variable "project" {
  description = "project name"
  type        = string
  default     = "tf-004"
}

variable "subnet_cidr" {
  description = "subnet cidr block"
  type        = string
  default     = "10.0.1.0/24"
}