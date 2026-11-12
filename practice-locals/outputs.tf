output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.prod.id
}

output "public_subnet_a_id" {
  description = "ID of the public subnet ID in 1a"
  value       = aws_subnet.public_a.id
}

output "public_subnet_b_id" {
  description = "ID of the public subnet ID in 1b"
  value       = aws_subnet.public_b.id
}

output "private_subnet_a_id" {
  description = "ID of the private subnet ID in 1a"
  value       = aws_subnet.private_a.id
}

output "private_subnet_b_id" {
  description = "ID of the private subnet ID in 1b"
  value       = aws_subnet.private_b.id
}
