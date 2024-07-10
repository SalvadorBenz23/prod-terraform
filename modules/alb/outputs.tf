output "alb_id" {
  description = "The ID of the ALB"
  value       = aws_lb.app_alb.id
}

output "alb_sg_id" {
  description = "The ID of the security group used by the ALB"
  value       = var.security_group_id
}

output "alb_arn" {
  description = "The ARN of the ALB"
  value       = aws_lb.app_alb.arn
}

output "target_group_arn" {
  description = "The ARN of the target group"
  value       = aws_lb_target_group.frontend_target_group.arn
}

#output "alb_zone_id" {
#  description = "The Zone ID of the ALB"
#  value       = aws_lb.app_alb.zone_id
#}

#output "alb_dns_name" {
#  description = "The DNS name of the ALB"
#  value       = aws_lb.app_alb.dns_name
#}