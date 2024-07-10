output "app_sg_id" {
  description = "ID of the app security group"
  value       = aws_security_group.app_sg.id
}

output "rds_sg_id" {
  description = "ID of the RDS security group"
  value       = aws_security_group.rds_sg.id
}

output "efs_sg_id" {
  description = "ID of the EFS security group"
  value       = aws_security_group.efs_sg.id
}

output "frontend_sg_id" {
  description = "The ID of the front-end security group"
  value       = aws_security_group.frontend_sg.id
}

output "bastion_sg_id" { 
  description = "The ID of the bastion security group"
  value = aws_security_group.bastion_sg.id
}

#Not needed, we named a frontend_sg_id for this
#output "alb_sg_id" {
#  description = "The security group ID for the ALB"
#  value       = aws_security_group.alb_sg.id
#}