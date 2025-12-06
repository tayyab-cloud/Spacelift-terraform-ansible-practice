output "ec2_ip" {
    description = "The public IP address of the EC2 instance from the ec2 module"
    value       = module.ec2[*].public_ip
  
}