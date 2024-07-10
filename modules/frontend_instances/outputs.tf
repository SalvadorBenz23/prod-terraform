output "frontend_instance_public_ips" {
  description = "The public IP addresses of the frontend instances"
  value       = data.aws_instances.frontend_instances.public_ips
}

output "frontend_asg_id" {
  description = "The ID of the frontend autoscaling group"
  value       = aws_autoscaling_group.frontend_asg.id
}

output "bastion_public_ip" {
  value = aws_instance.bastion.public_ip
  description = "The public IP of the bastion host."
}