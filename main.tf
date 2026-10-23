# Static Configuration with hardcoded values
resource "aws_vpc" "prod" {
  cidr_block           = var.cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name        = "${var.environment}-vpc"
    Environment = var.environment
    project     = var.project
    ManagedBy   = "manual-deployment"
    Region      = data.aws_region.current.name
    AccountID   = data.aws_caller_identity.current.account_id
  }
}

resource "aws_subnet" "private" {
  vpc_id                  = aws_vpc.prod.id
  cidr_block              = var.subnet_cidr
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = false

  tags = {
    Name        = "private-subnet"
    Environment = var.environment
    Project     = var.project
    ManagedBy   = "terraform"
    Region      = data.aws_region.current.name
    AZ          = data.aws_availability_zones.available.names[0]
  }
}

resource "aws_route_table" "static" {
  vpc_id = aws_vpc.prod.id
  tags = {
    Name        = "${var.environment}-rt"
    Environment = var.environment
    Project     = var.project
    ManagedBy   = "terraform"
    Region      = data.aws_region.current.name
  }
}
