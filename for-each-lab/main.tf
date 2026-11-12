resource "aws_vpc" "demo-vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "demo-vpc"
  }
}

# resource "aws_subnet" "subnets" {
#   count             = 3
#   vpc_id            = aws_vpc.demo-vpc.id
#   cidr_block        = var.cidr_block[count.index]
#   availability_zone = var.availability_zones[count.index]
# }

resource "aws_subnet" "demo-subnets" {
  vpc_id            = aws_vpc.demo-vpc.id
  for_each          = var.subnet_config
  cidr_block        = each.value
  availability_zone = var.subnet_azs[each.key]
  tags = {
    "Name" = "subnet-${each.key}"
  }
}

resource "aws_security_group" "demo-sgs" {
  count  = 3
  name   = "demo-sg-${count.index + 1}"
  vpc_id = aws_vpc.demo-vpc.id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}