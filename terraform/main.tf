provider "aws" {
    region = var.region
}

module "ec2" {
    source         = "../modules/ec2"
    count = 3
    ami-id         = var.ami_id
    instance_name  = "${var.instance_name}-${count.index + 1}"
    instance-type  = var.instance_type
    public_key     = file(var.public_key_path)
}