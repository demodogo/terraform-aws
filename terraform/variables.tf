// Región AWS
variable "aws_region" {
  description = "Región de AWS"
  type        = string
}

// EC2
variable "iam_instance_profile" {
  description = "IAM instance profile"
  type        = string
  default = "ec2-cloudwatch-logs-profile"
  nullable = true
}

variable "ec2_name" {
  description = "EC2 instance name"
  type        = string
}

// Redes
variable "vpc_cidr_block" {
  description = "Rango CIDR para la VPC"
  type        = string
}

variable "public_subnet_cidr_block" {
  description = "Rango CIDR para la subnet pública"
  type        = string
}


variable "private_subnet_cidr_block" {
  description = "Rango CIDR para la subnet privada"
  type        = string
}

variable "vpc_name" {
  description = "Nombre de la VPC"
  type        = string
  default     = "tf-vpc"
}

variable "vpc_id" {
  description = "ID de la VPC"
  type        = string
  default = ""
}

variable "public_subnet_name" {
  description = "Nombre de la subnet pública"
  type        = string
  default     = "tf-public-subnet"
}

variable "public_subnet_id" {
  description = "ID de la subnet pública"
  type        = string
  default = ""
}

variable "private_subnet_name" {
  description = "Nombre de la subnet privada"
  type        = string
  default = "tf-private-subnet"
}

variable "gateway_name" {
  description = "Nombre del Internet Gateway"
  type        = string
  default     = "tf-internet-gateway"
}

variable "public_route_table_name" {
  description = "Public route table name"
  type        = string
}

// Security Group
variable "security_group_name" {
  description = "Nombre del Security Group"
  type        = string
  default     = "tf-main-sg"
}

variable "security_group_id" {
    description = "ID del Security Group"
    type        = string
    default     = "tf-main-sg"
}

// SNS
variable "sns_topic_name" {
    description = "Nombre del topic SNS"
    type        = string
    default     = "tf-alarm-notifications"
}

variable "subscriber_email" {
    description = "Correo electrónico para suscripción"
    type        = string
}

variable "subscriber_email_lambda" {
  description = "Correo electrónico para el SNS del lambda"
  type = string
}

variable "sns_lambda_topic_name" {
  description = "Nombre del SNS para lambda"
  type = string
}

// Mi IP
variable "my_ip" {
  description = "My IP"
  type        = string
}

// AMI ID (Imagen EC2)
variable "ami_id" {
  description = "AMI id"
  type        = string
}


// LLave SSH
variable "key_name" {
  description = "Key pair name"
  type        = string
  default = "test_key"
}