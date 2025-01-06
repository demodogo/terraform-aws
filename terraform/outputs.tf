output "instance_public_ip" {
  value = module.ec2.public_ip
}

output "instance_id" {
  value = module.ec2.instance_id
}

output "security_group_id" {
  value = module.sg.security_group_id
}

output "lambda_arn" {
  value = module.lambda.lambda_arn
}

output "sqs_url" {
  value = module.sqs.sqs_url
}

output "repository_name" {
    value = module.ecr.repository_name
}

output "iam_instance_profile" {
    value = module.iam.instance_profile_name
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_id" {
  value = module.subnet.public_subnet_id
}

output "private_subnet_id" {
  value = module.subnet.private_subnet_id
}