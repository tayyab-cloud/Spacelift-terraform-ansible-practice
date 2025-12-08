provider "aws" {
    region = var.region
}
resource "aws_key_pair" "deployer"{
    key_name   = "${var.instance_name}-key"
    public_key = file(var.public_key_path)
  
}
# Call the EC2 module to create multiple instances
module "ec2" {
    source         = "../modules/ec2"
    count = 4
    ami-id         = var.ami_id
    instance_name  = "${var.instance_name}-${count.index + 1}"
    instance-type  = var.instance_type
    key_name       = aws_key_pair.deployer.key_name
    security_group_ids = [aws_security_group.allow_ssh_http.id]

}

# Create a security group to allow SSH and HTTP access
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