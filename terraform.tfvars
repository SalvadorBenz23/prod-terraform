#certificate_arn = "arn:aws:acm:eu-west-3:767397659707:certificate/43614006-a848-42f0-a8c6-eed3af1ffaf4"
#route53_zone_id = "Z0485291S1HVGB28P2OW"
#domain_name     = "sapesu.com"

frontend_instance_count   = 2
frontend_ami              = "ami-00ac45f3035ff009e" # Replace with your frontend AMI ID
frontend_instance_type    = "t3.micro"
frontend_min_size         = 2
frontend_max_size         = 3
frontend_desired_capacity = 2

backend_instance_count = 2
backend_ami            = "ami-00ac45f3035ff009e" # Replace with your backend AMI ID
backend_instance_type  = "t3.medium"

database_instance_count = 2
database_ami            = "ami-00ac45f3035ff009e" # Replace with your database AMI ID
database_instance_type  = "t2.micro"

key_name = "keypair_sal"