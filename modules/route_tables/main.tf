# Public Route Table and Routes
resource "aws_route_table" "public_rt" {
  vpc_id = var.vpc_id
  tags = {
    Name = "PublicRouteTable"
  }
}

resource "aws_route" "public_route_igw" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = var.igw_id  # Ensure var.igw_id is correctly set to your Internet Gateway ID
}

#resource "aws_route" "public_route_vpc" {
#  route_table_id         = aws_route_table.public_rt.id
#  destination_cidr_block = var.vpc_cidr  # Ensure var.vpc_cidr_block is correctly set to your VPC CIDR
#}

resource "aws_route_table_association" "public_rt_assoc1" {
  subnet_id      = var.public_subnet1_id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_rt_assoc2" {
  subnet_id      = var.public_subnet2_id
  route_table_id = aws_route_table.public_rt.id
}

# Private Route Table for AZ1 and Routes
resource "aws_route_table" "private_rt1" {
  vpc_id = var.vpc_id
  tags = {
    Name = "PrivateRouteTableAZ1"
  }
}

resource "aws_route" "private_route_AZ1_igw" {
  route_table_id         = aws_route_table.private_rt1.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = var.nat_gw1_id  # Ensure var.nat_gw1_id is correctly set to your NAT Gateway ID
}

#resource "aws_route" "private_route_AZ1_vpc" {
#  route_table_id         = aws_route_table.private_rt1.id
#  destination_cidr_block = var.vpc_cidr  # Ensure var.vpc_cidr_block is correctly set to your VPC CIDR
#}

resource "aws_route_table_association" "private_rt1_assoc1" {
  subnet_id      = var.app_subnet1_id
  route_table_id = aws_route_table.private_rt1.id
}

resource "aws_route_table_association" "private_rt1_assoc2" {
  subnet_id      = var.db_subnet1_id
  route_table_id = aws_route_table.private_rt1.id
}

# Private Route Table for AZ2 and Routes
resource "aws_route_table" "private_rt2" {
  vpc_id = var.vpc_id
  tags = {
    Name = "PrivateRouteTableAZ2"
  }
}

resource "aws_route" "private_route_AZ2_igw" {
  route_table_id         = aws_route_table.private_rt2.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = var.nat_gw2_id  # Ensure var.nat_gw2_id is correctly set to your NAT Gateway ID
}

#resource "aws_route" "private_route_AZ2_vpc" {
#  route_table_id         = aws_route_table.private_rt2.id
#  destination_cidr_block = var.vpc_cidr  # Ensure var.vpc_cidr_block is correctly set to your VPC CIDR
#}

resource "aws_route_table_association" "private_rt2_assoc1" {
  subnet_id      = var.app_subnet2_id
  route_table_id = aws_route_table.private_rt2.id
}

resource "aws_route_table_association" "private_rt2_assoc2" {
  subnet_id      = var.db_subnet2_id
  route_table_id = aws_route_table.private_rt2.id
}