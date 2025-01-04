output "public_ip" {
  value = module.ec2.public_ip
}

output "instance_id" {
  value = module.ec2.instance_id
}

output "security_group_id" {
  value = module.sg.security_group_id
}

