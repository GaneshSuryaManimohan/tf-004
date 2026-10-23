output "vpc_id" {
  description = "ID of the created VPC"
  value       = aws_vpc.prod.id
}

output "subnet_id" {
  description = "ID of the subnet"
  value       = aws_subnet.private.id
}

output "availability_zone" {
  description = "AZ of the subnet"
  value       = aws_subnet.private.availability_zone
}

output "account_info" {
  description = "AWS Account info"
  value       = "${data.aws_caller_identity.current.account_id} - ${data.aws_caller_identity.current.arn} - ${data.aws_region.current.name}"
}
