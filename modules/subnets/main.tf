###############
## NEW Version
###############

resource "aws_subnet" "public_subnet1" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.public_subnet1_cidr
  map_public_ip_on_launch = true
  availability_zone       = "${var.region}a"
  tags = {
    Name = "PublicSubnet1"
  }
}

resource "aws_subnet" "public_subnet2" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.public_subnet2_cidr
  map_public_ip_on_launch = true
  availability_zone       = "${var.region}b"
  tags = {
    Name = "PublicSubnet2"
  }
}

resource "aws_subnet" "app_subnet1" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.app_subnet1_cidr
  map_public_ip_on_launch = false
  availability_zone       = "${var.region}a"
  tags = {
    Name = "AppSubnet1"
  }
}

resource "aws_subnet" "app_subnet2" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.app_subnet2_cidr
  map_public_ip_on_launch = false
  availability_zone       = "${var.region}b"
  tags = {
    Name = "AppSubnet2"
  }
}

resource "aws_subnet" "db_subnet1" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.db_subnet1_cidr
  map_public_ip_on_launch = false
  availability_zone       = "${var.region}a"
  tags = {
    Name = "DatabaseSubnet1"
  }
}

resource "aws_subnet" "db_subnet2" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.db_subnet2_cidr
  map_public_ip_on_launch = false
  availability_zone       = "${var.region}b"
  tags = {
    Name = "DatabaseSubnet2"
  }
}

resource "aws_network_acl" "main_acl" {
  vpc_id = var.vpc_id

  ingress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  egress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Name = "MainNetworkACL"
  }
}

resource "aws_network_acl_association" "public_acl_assoc1" {
  subnet_id      = aws_subnet.public_subnet1.id
  network_acl_id = aws_network_acl.main_acl.id
}

resource "aws_network_acl_association" "public_acl_assoc2" {
  subnet_id      = aws_subnet.public_subnet2.id
  network_acl_id = aws_network_acl.main_acl.id
}

resource "aws_network_acl_association" "app_acl_assoc1" {
  subnet_id      = aws_subnet.app_subnet1.id
  network_acl_id = aws_network_acl.main_acl.id
}

resource "aws_network_acl_association" "app_acl_assoc2" {
  subnet_id      = aws_subnet.app_subnet2.id
  network_acl_id = aws_network_acl.main_acl.id
}

resource "aws_network_acl_association" "db_acl_assoc1" {
  subnet_id      = aws_subnet.db_subnet1.id
  network_acl_id = aws_network_acl.main_acl.id
}

resource "aws_network_acl_association" "db_acl_assoc2" {
  subnet_id      = aws_subnet.db_subnet2.id
  network_acl_id = aws_network_acl.main_acl.id
}