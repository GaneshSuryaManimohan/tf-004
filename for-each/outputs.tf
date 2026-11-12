output "bucket_info" {
  value = values(aws_s3_bucket.for_each_demo)[*].bucket
}
