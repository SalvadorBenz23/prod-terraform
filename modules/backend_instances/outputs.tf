output "backend_instance_private_ips" {
  description = "The private IP addresses of the backend instances"
  value       = aws_instance.backend_instance[*].private_ip
}