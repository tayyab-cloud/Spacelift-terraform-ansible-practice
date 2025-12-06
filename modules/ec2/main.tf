

resource "aws_instance" "my-instance" {
    ami           = var.ami-id
    instance_type = var.instance-type
    key_name      = var.key_name
    vpc_security_group_ids = [aws_security_group.allow_ssh_http.id]

    
    tags = {
        Name = "MyInstance"
    }
  
}

resource "aws_security_group" "allow_ssh_http" {
    name        = "${var.instance_name}-sg"
    description = "Allow SSH and HTTP inbound traffic"

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}