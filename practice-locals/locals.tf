locals {
  tags = {
    Environment = var.environment
    Project     = "tf-improved-demo"
    Owner       = "DevOps-team"
    ManagedBy   = "terraform"
    Region      = data.aws_region.current.name
  }
  # common name prefix for resources
  name_prefix = "${var.environment}-"
}