provider "aws" {
    region = var.region
}

module "ec2" {
    source         = "../modules/ec2"
    ami-id         = var.ami_id
    instance_name  = var.instance_name
    instance-type  = var.instance_type
    public_key     = file(var.public_key_path)
}