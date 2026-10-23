#Retrieve the current AWS region
data "aws_region" "current" {}

# Retrieve the current aws account
data "aws_caller_identity" "current" {}

# Retrieve current availability zones
data "aws_availability_zones" "available" {
  state = "available"
}
