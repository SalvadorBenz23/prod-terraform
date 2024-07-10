variable "ami" {
  description = "AMI ID for the instances"
  type        = string
}

variable "instance_type" {
  description = "Instance type"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs"
  type        = list(string)
}

#variable "security_group_id" {
#  description = "Security group ID"
#  type        = string
#}

variable "frontend_sg_id" {
  description = "Security group ID for the frontend instances"
  type        = string
}

variable "bastion_sg_id" {
  description = "Security group ID for the bastion host"
  type        = string
}

variable "key_name" {
  description = "Key pair name"
  type        = string
}

variable "frontend_min_size" {
  description = "Minimum size of the frontend ASG"
  type        = number
}

variable "frontend_max_size" {
  description = "Maximum size of the frontend ASG"
  type        = number
}

variable "frontend_desired_capacity" {
  description = "Desired capacity of the frontend ASG"
  type        = number
}

variable "frontend_target_group_arn" {
  description = "ARN of the frontend target group"
  type        = string
}