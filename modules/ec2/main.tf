

resource "aws_instance" "my-instance" {
    ami           = var.ami-id
    instance_type = var.instance-type
    key_name      = var.key_name
    vpc_security_group_ids = var.security_group_ids
    

    
    tags = {
        Name = "MyInstance"
    }
  
}

