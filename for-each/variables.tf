variable "bucket_name" {
  type    = set(string)
  default = ["tgsm-set-for-each-bucket-1", "tgsm-set-for-each-bucket-2"]
}

variable "bucket_name_map" {
  type = map(string)
  default = {
    "bucket1" = "tgsm-map-for-each-bucket-1"
    "bucket2" = "tgsm-map-for-each-bucket-2"
  }
}
