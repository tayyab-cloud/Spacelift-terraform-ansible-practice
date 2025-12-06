variable "instance-type" {
    description = "The type of instance to use"
    type        = string
    
  
}

variable "ami-id" {
    description = "The AMI ID to use for the instance"
    type        = string
  
}

variable "instance_name" {
    description = "The name tag for the instance"
    type        = string
  
}



variable "key_name" {
    description = "The name of the key pair"
    type        = string
  
}