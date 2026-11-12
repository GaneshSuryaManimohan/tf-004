# Get info about the current AWS region
data "aws_region" "current" {}

resource "aws_vpc" "prod" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name        = "prod-vpc-us-east-1"
    Environment = "prod"
    project     = "tf-demo"
    ManagedBy   = "terraform"
    Region      = "us-east-1"
    Owner       = "infra-team"
  }
}

resource "aws_subnet" "public_a" {
  vpc_id                  = aws_vpc.prod.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name        = "prod-public-subnet-us-east-1a"
    Environment = "prod"
    Project     = "tf-demo"
    ManagedBy   = "terraform"
    Region      = "us-east-1"
    Owner       = "infra-team"
    Tier        = "public"
  }
}

resource "aws_subnet" "public_b" {
  vpc_id                  = aws_vpc.prod.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true
  # One way to use locals is to reference them in the resource block
  tags = {
    Name        = "${local.name_prefix}public-subnet-us-east-1b"
    Environment = local.tags.Environment
    Project     = local.tags.Project
    ManagedBy   = local.tags.ManagedBy
    Region      = local.tags.Region
    Owner       = local.tags.Owner
    Tier        = "public"
  }
}

resource "aws_subnet" "private_a" {
  vpc_id                  = aws_vpc.prod.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false

  # Another way to use locals is to merge them with other values in resource block
  tags = merge(local.tags, {
    Name = "${local.name_prefix}private-subnet-us-east-1a"
    Tier = "private"
  })
}


resource "aws_subnet" "private_b" {
  vpc_id                  = aws_vpc.prod.id
  cidr_block              = "10.0.4.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = false

  tags = merge(local.tags, {
    Name = "${local.name_prefix}private-subnet-us-east-1b"
    Tier = "private"
  })
}

resource "aws_security_group" "web" {
  vpc_id      = aws_vpc.prod.id
  name        = "prod-web-sg"
  description = "Allow web traffic"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = local.tags
}
