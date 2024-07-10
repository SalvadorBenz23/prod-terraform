variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "region" {
  description = "AWS Region"
  type        = string
}

variable "public_subnet1_cidr" {
  description = "Public Subnet 1"
  type        = string
}

variable "public_subnet2_cidr" {
  description = "Public Subnet 2"
  type        = string
}

variable "app_subnet1_cidr" {
  description = "App Subnet 1"
  type        = string
}

variable "app_subnet2_cidr" {
  description = "App Subnet 2"
  type        = string
}

variable "db_subnet1_cidr" {
  description = "Database Subnet 1"
  type        = string
}

variable "db_subnet2_cidr" {
  description = "Database Subnet 2"
  type        = string
}