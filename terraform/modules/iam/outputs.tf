output "role_name" {
  value = aws_iam_role.ec2_cloudwatch_role.name
}

output "instance_profile_name" {
  value = aws_iam_instance_profile.ec2_cloudwatch_profile.name
}
