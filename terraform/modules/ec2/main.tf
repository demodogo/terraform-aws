resource "aws_instance" "ec2_api_instance" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  subnet_id       = var.subnet_id
  security_groups = [var.security_group_id]
  key_name = var.key_name
  iam_instance_profile = var.iam_instance_profile

  lifecycle {
    ignore_changes = [
      security_groups,
      subnet_id,
      tags,
      iam_instance_profile,
      vpc_security_group_ids,
      associate_public_ip_address,
    ]
  }

  user_data = <<-EOT
              #!/bin/bash
              yum update -y
              yum install -y awslogs
              echo 'Logs configured!'
              EOT
  tags = {
    Name = var.name
  }
}

