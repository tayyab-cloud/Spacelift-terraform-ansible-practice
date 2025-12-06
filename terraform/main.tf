provider "aws" {
    region = var.region
}
resource "aws_key_pair" "deployer"{
    key_name   = "${var.instance_name}-key"
    public_key = file(var.public_key_path)
  
}

module "ec2" {
    source         = "../modules/ec2"
    count = 3
    ami-id         = var.ami_id
    instance_name  = "${var.instance_name}-${count.index}"
    instance-type  = var.instance_type
    key_name       = aws_key_pair.deployer.key_name

}