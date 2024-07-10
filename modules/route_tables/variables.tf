variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR blocks for destination rt"
}

variable "igw_id" {
  description = "Internet Gateway ID"
  type        = string
}

variable "public_subnet1_id" {
  description = "Public Subnet 1 ID"
  type        = string
}

variable "public_subnet2_id" {
  description = "Public Subnet 2 ID"
  type        = string
}

variable "app_subnet1_id" {
  description = "App Subnet 1 ID"
  type        = string
}

variable "app_subnet2_id" {
  description = "App Subnet 2 ID"
  type        = string
}

variable "db_subnet1_id" {
  description = "Database Subnet 1 ID"
  type        = string
}

variable "db_subnet2_id" {
  description = "Database Subnet 2 ID"
  type        = string
}

variable "nat_gw1_id" {
  description = "NAT Gateway 1 ID"
  type        = string
}

variable "nat_gw2_id" {
  description = "NAT Gateway 2 ID"
  type        = string
}