#############
# NEW Version
#############

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "public_subnet1_id" {
  description = "The ID of the first public subnet"
  type        = string
}

variable "public_subnet2_id" {
  description = "The ID of the second public subnet"
  type        = string
}

variable "security_group_id" {
  description = "The ID of the security group to use for the ALB"
  type        = string
}

# THIS STEP IS FOR PURE TEST PURPOSES ONLY (EC2 creation, LBtargets and DNS):

variable "frontend_asg_id" {
  description = "The ASG ID for frontend instances"
  type        = string
}

#variable "instance_count" {
#  description = "Number of frontend instances to create for testing"
#  type        = number
#  default     = 2
#}

# not needed, we rely on count
#variable "frontend_instance_ids" {
#  description = "List of front-end instance IDs"
#  type        = list(string)
#}

#variable "aws_route53_record" {
#  description = "Route 53 record"
#  type = string
#}

# default = null

#variable "certificate_arn" {
#  description = "The ARN of the ACM certificate for HTTPS"
#  type        = string
#  default = null
#}

#variable "route53_zone_id" {
#  description = "The Route 53 hosted zone ID"
#  type        = string
#  default = null
#}

#variable "domain_name" {
#  description = "The domain name for the ALB"
#  type        = string
#  default = null
#}
