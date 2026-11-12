resource "aws_s3_bucket" "for_each_demo" {
  for_each = var.bucket_name_map
  bucket   = each.value
  tags = {
    Name        = each.value
    Environment = "Dev"
  }
}
