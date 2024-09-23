variable "bucket_name" {
  description = "name will assign to bucket"
  type        = string
}

variable "versioning" {
  description = "Whether set it to Suspended, Enabled or Disabled"
  type = string
  default = "Enabled"
}

variable "tags" {
  description = "tags for the bucket"
  type = map(string)
  default = {}
}
