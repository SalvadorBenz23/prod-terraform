variable "region" {
  description = "AWS Region"
  type        = string
  default     = "eu-west-3"
}

variable "vpc_cidr" {
  description = "CIDR Block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet1_cidr" {
  description = "Public Subnet 1"
  type        = string
  default     = "10.0.0.0/24"
}

variable "public_subnet2_cidr" {
  description = "Public Subnet 2"
  type        = string
  default     = "10.0.1.0/24"
}

variable "app_subnet1_cidr" {
  description = "App Subnet 1"
  type        = string
  default     = "10.0.2.0/24"
}

variable "app_subnet2_cidr" {
  description = "App Subnet 2"
  type        = string
  default     = "10.0.3.0/24"
}

variable "db_subnet1_cidr" {
  description = "Database Subnet 1"
  type        = string
  default     = "10.0.4.0/24"
}

variable "db_subnet2_cidr" {
  description = "Database Subnet 2"
  type        = string
  default     = "10.0.5.0/24"
}

# THIS STEP IS FOR PURE TEST PURPOSES ONLY (EC2 creation, LBtargets and DNS):

#variable "certificate_arn" {
#  description = "The ARN of the ACM certificate for HTTPS"
#  type        = string
#}

#variable "security_group_id" {
#  description = "The ID of the security group (for the ALB)"
#  type        = string
#}

#variable "vpc_id" {
#  description = "The VPC ID"
#  type        = string
#}

#variable "public_subnet1_id" {
#  description = "The ID of the first public subnet. Hi from root variable.tf"
#  type        = string
#}

#variable "public_subnet2_id" {
#  description = "The ID of the second public subnet.  Hi from root variable.tf"
#  type        = string
#}

#variable "route53_zone_id" {
#  description = "The ID of the Route 53 hosted zone"
#  type        = string
#}

#variable "domain_name" {
#  description = "The domain name to be used for the ALB"
#  type        = string
#}

#variable "frontend_instance_ids" {
#  description = "List of front-end instance IDs"
#  type        = list(string)
#}



variable "frontend_instance_count" {
  description = "Number of frontend instances to launch"
  type        = number
}

variable "frontend_ami" {
  description = "AMI ID for frontend instances"
  type        = string
}

variable "frontend_instance_type" {
  description = "Instance type for frontend instances"
  type        = string
}

variable "backend_instance_count" {
  description = "Number of backend instances to launch"
  type        = number
}

variable "backend_ami" {
  description = "AMI ID for backend instances"
  type        = string
}

variable "backend_instance_type" {
  description = "Instance type for backend instances"
  type        = string
}

variable "database_instance_count" {
  description = "Number of database instances to launch"
  type        = number
}

variable "database_ami" {
  description = "AMI ID for database instances"
  type        = string
}

variable "database_instance_type" {
  description = "Instance type for database instances"
  type        = string
}

variable "key_name" {
  description = "Key pair name for instances"
  type        = string
}

variable "frontend_min_size" {
  type = number
}

variable "frontend_max_size" {
  type = number
}

variable "frontend_desired_capacity" {
  type = number
}