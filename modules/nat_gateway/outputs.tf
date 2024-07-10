output "nat_gw1_id" {
  value = aws_nat_gateway.nat_gw1.id
}

output "nat_gw2_id" {
  value = aws_nat_gateway.nat_gw2.id
}

output "nat_gw1_private_ip" {
  value = aws_nat_gateway.nat_gw1.private_ip
}

output "nat_gw2_private_ip" {
  value = aws_nat_gateway.nat_gw2.private_ip
}