output "public_subnet1_id" {
  value = aws_subnet.public_subnet1.id
}

output "public_subnet2_id" {
  value = aws_subnet.public_subnet2.id
}

output "app_subnet1_id" {
  value = aws_subnet.app_subnet1.id
}

output "app_subnet2_id" {
  value = aws_subnet.app_subnet2.id
}

output "db_subnet1_id" {
  value = aws_subnet.db_subnet1.id
}

output "db_subnet2_id" {
  value = aws_subnet.db_subnet2.id
}

output "main_acl_id" {
  value = aws_network_acl.main_acl.id
}

output "public_acl_id" {
  value = aws_network_acl.main_acl.id
}

output "private_acl_id" {
  value = aws_network_acl.main_acl.id
}

output "public_subnet1_private_ip" {
  value = aws_subnet.public_subnet1.id
}

output "public_subnet2_private_ip" {
  value = aws_subnet.public_subnet2.id
}