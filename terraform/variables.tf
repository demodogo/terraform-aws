variable "aws_region" {
  description = "Región de AWS"
  type        = string
}
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

variable "public_subnet_name" {
  description = "Nombre de la subnet pública"
  type        = string
  default     = "tf-public-subnet"
}

variable "private_subnet_name" {
  description = "Nombre de la subnet privada"
  type        = string
  default     = "tf-private-subnet"
}

variable "gateway_name" {
  description = "Nombre del Internet Gateway"
  type        = string
  default     = "tf-internet-gateway"
}

variable "sg_name" {
  description = "Nombre del Security Group"
  type        = string
  default     = "tf-main-sg"
}


variable "my_ip" {
  description = "My IP"
  type        = string
}

variable "ec2_name" {
  description = "EC2 instance name"
  type        = string
}

variable "ami_id" {
  description = "AMI id"
  type        = string
}

variable "public_route_table_name" {
  description = "Public route table name"
  type        = string
}

variable "key_name" {
  description = "Key pair name"
  type        = string
}