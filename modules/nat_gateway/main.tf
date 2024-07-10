resource "aws_eip" "eip1" {
  associate_with_private_ip = var.public_subnet1_private_ip
  tags = {
    Name = "ElasticIPAddress1"
  }
}

resource "aws_nat_gateway" "nat_gw1" {
  allocation_id = aws_eip.eip1.id
  subnet_id     = var.public_subnet1_id
  tags = {
    Name = "NATGateway1"
  }
}

resource "aws_eip" "eip2" {
  associate_with_private_ip = var.public_subnet2_private_ip
  tags = {
    Name = "ElasticIPAddress2"
  }
}

resource "aws_nat_gateway" "nat_gw2" {
  allocation_id = aws_eip.eip2.id
  subnet_id     = var.public_subnet2_id
  tags = {
    Name = "NATGateway2"
  }
}