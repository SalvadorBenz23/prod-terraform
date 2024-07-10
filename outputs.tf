output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet1_id" {
  value = module.subnets.public_subnet1_id
}

output "public_subnet2_id" {
  value = module.subnets.public_subnet2_id
}

output "app_subnet1_id" {
  value = module.subnets.app_subnet1_id
}

output "app_subnet2_id" {
  value = module.subnets.app_subnet2_id
}

output "db_subnet1_id" {
  value = module.subnets.db_subnet1_id
}

output "db_subnet2_id" {
  value = module.subnets.db_subnet2_id
}

output "nat_gw1_id" {
  description = "ID of the first NAT Gateway"
  value       = module.nat_gateway.nat_gw1_id
}

output "nat_gw2_id" {
  description = "ID of the second NAT Gateway"
  value       = module.nat_gateway.nat_gw2_id
}

output "app_sg_id" {
  value = module.security_groups.app_sg_id
}

output "rds_sg_id" {
  value = module.security_groups.rds_sg_id
}

output "efs_sg_id" {
  value = module.security_groups.efs_sg_id
}

output "alb_id" {
  description = "The ID of the ALB"
  value       = module.alb.alb_id
}

output "alb_arn" {
  description = "The ARN of the ALB"
  value       = module.alb.alb_arn
}

output "target_group_arn" {
  description = "The ARN of the Target Group"
  value       = module.alb.target_group_arn
}

#output "alb_dns_name" {
#  description = "The DNS name of the ALB"
#  value       = module.alb.alb_dns_name
#}


output "backend_instance_private_ips" {
  description = "The private IP addresses of the backend instances"
  value       = module.backend_instances.backend_instance_private_ips
}

output "frontend_asg_id" {
  description = "The ID of the frontend autoscaling group"
  value       = module.frontend_instances.frontend_asg_id
}

#output "frontend_instance_ids" {
#  description = "The IDs of the frontend instances"
#  value       = module.frontend_instances.frontend_asg_id
#}

output "frontend_instance_public_ips" {
  description = "The public IP addresses of the frontend instances"
  value       = module.frontend_instances.frontend_asg_id # Since we are using ASG, this might need a different approach to get the actual public IPs
}

#output "frontend_instance_public_ips" {
#  description = "The public IP addresses of the frontend instances"
#  value       = module.frontend_instances.instance_public_ips
#}

output "bastion_sg_ip" {
  value = module.frontend_instances.bastion_public_ip
}