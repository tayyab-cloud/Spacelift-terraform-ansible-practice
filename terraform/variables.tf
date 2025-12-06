variable "region" {
    description = "The AWS region to deploy resources in"
    type        = string

  
}

variable "ami_id" {
    description = "The AMI ID to use for the instance"
    type        = string
  
}
variable "instance_name" {
    description = "The name tag for the instance"
    type        = string
  
}

variable "instance_type" {
    description = "The type of instance to use"
    type        = string
  
}

variable "public_key_path" {
    description = "The path to the public key file"
    type        = string
}
