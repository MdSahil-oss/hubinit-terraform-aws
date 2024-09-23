variable "ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID where the EC2 instance will be deployed"
  type        = string
}

variable "security_group_ids" {
  description = "Security Group ID for the EC2 instance"
  type        = list(string)
}

variable "tags" {
  description = "Tags"
  type        = map(string)
  default = {}
}
