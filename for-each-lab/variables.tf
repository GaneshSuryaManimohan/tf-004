variable "cidr_block" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "availability_zones" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "subnet_config" {
  type = map(string)
  default = {
    "public"  = "10.0.10.0/24"
    "private" = "10.0.20.0/24"
    "data"    = "10.0.30.0/24"
  }
}

variable "subnet_azs" {
  type = map(string)
  default = {
    "public"  = "us-east-1a"
    "private" = "us-east-1b"
    "data"    = "us-east-1c"
  }
}
