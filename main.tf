###################
## UPDATED Version
###################

module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
}


module "subnets" {
  source              = "./modules/subnets"
  vpc_id              = module.vpc.vpc_id
  public_subnet1_cidr = var.public_subnet1_cidr
  public_subnet2_cidr = var.public_subnet2_cidr
  app_subnet1_cidr    = var.app_subnet1_cidr
  app_subnet2_cidr    = var.app_subnet2_cidr
  db_subnet1_cidr     = var.db_subnet1_cidr
  db_subnet2_cidr     = var.db_subnet2_cidr
  region              = var.region
}

module "nat_gateway" {
  source                    = "./modules/nat_gateway"
  public_subnet1_id         = module.subnets.public_subnet1_id
  public_subnet1_private_ip = module.subnets.public_subnet1_private_ip
  public_subnet2_id         = module.subnets.public_subnet2_id
  public_subnet2_private_ip = module.subnets.public_subnet2_private_ip
}

module "route_tables" {
  source            = "./modules/route_tables"
  vpc_id            = module.vpc.vpc_id
  igw_id            = module.vpc.igw_id
  vpc_cidr          = module.vpc.vpc_cidr
  public_subnet1_id = module.subnets.public_subnet1_id
  public_subnet2_id = module.subnets.public_subnet2_id
  app_subnet1_id    = module.subnets.app_subnet1_id
  app_subnet2_id    = module.subnets.app_subnet2_id
  db_subnet1_id     = module.subnets.db_subnet1_id
  db_subnet2_id     = module.subnets.db_subnet2_id
  nat_gw1_id        = module.nat_gateway.nat_gw1_id
  nat_gw2_id        = module.nat_gateway.nat_gw2_id
}

module "security_groups" {
  source = "./modules/security_groups"
  vpc_id = module.vpc.vpc_id
}


# THIS STEP IS FOR PURE TEST PURPOSES ONLY (EC2 creation, LBtargets and A Record DNS creation):

module "alb" {
  source            = "./modules/alb"
  vpc_id            = module.vpc.vpc_id
  public_subnet1_id = module.subnets.public_subnet1_id
  public_subnet2_id = module.subnets.public_subnet2_id
  frontend_asg_id   = module.frontend_instances.frontend_asg_id
  #public_subnet_ids    = [module.subnets.public_subnet1_id, module.subnets.public_subnet2_id]
  security_group_id = module.security_groups.frontend_sg_id
  #certificate_arn      = var.certificate_arn
  #route53_zone_id      = var.route53_zone_id
  #domain_name          = var.domain_name
}

module "frontend_instances" {
  source            = "./modules/frontend_instances"
  ami               = var.frontend_ami
  instance_type     = var.frontend_instance_type
  public_subnet_ids = [module.subnets.public_subnet1_id, module.subnets.public_subnet2_id]
  frontend_sg_id    = module.security_groups.frontend_sg_id
  bastion_sg_id     = module.security_groups.bastion_sg_id
  #security_group_id         = module.security_groups.frontend_sg_id
  key_name                  = var.key_name
  frontend_min_size         = var.frontend_min_size
  frontend_max_size         = var.frontend_max_size
  frontend_desired_capacity = var.frontend_desired_capacity
  frontend_target_group_arn = module.alb.target_group_arn
}

module "backend_instances" {
  source                 = "./modules/backend_instances"
  instance_count         = var.backend_instance_count
  ami                    = var.backend_ami
  instance_type          = var.backend_instance_type
  private_app_subnet_ids = [module.subnets.app_subnet1_id, module.subnets.app_subnet2_id]
  security_group_id      = module.security_groups.app_sg_id
  key_name               = var.key_name
}

module "database_instances" {
  source                = "./modules/database_instances"
  instance_count        = var.database_instance_count
  ami                   = var.database_ami
  instance_type         = var.database_instance_type
  private_db_subnet_ids = [module.subnets.db_subnet1_id, module.subnets.db_subnet2_id]
  security_group_id     = module.security_groups.rds_sg_id
}