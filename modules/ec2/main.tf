

resource "aws_instance" "my-instance" {
    ami           = var.ami-id
    instance_type = var.instance-type
    key_name      = var.key_name
    vpc_security_group_ids = [aws_security_group.allow_ssh_http.id]

    
    tags = {
        Name = "MyInstance"
    }
  
}

