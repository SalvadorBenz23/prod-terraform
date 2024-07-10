###############
## NEW Version
###############

resource "aws_launch_configuration" "frontend_launch_config" {
  name          = "frontendLaunchConfig"
  image_id      = var.ami
  instance_type = var.instance_type
  security_groups = [var.frontend_sg_id]  
  key_name      = var.key_name

  user_data = <<-EOF
    #!/bin/bash
    # Update package information and install Docker
    sudo apt-get update -y
    sudo apt-get upgrade -y
    sudo apt-get install -y docker.io
    sudo systemctl start docker
    sudo systemctl enable docker

    # Clone the repository and change to the directory
    git clone https://github.com/docker/awesome-compose.git
    cd awesome-compose/react-nginx

    # Build your container: 
    docker build -t react-nginx-docker .

    # Run your container: 
    docker run -d -p 80:80 react-nginx-docker

  EOF

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "frontend_asg" {
  launch_configuration   = aws_launch_configuration.frontend_launch_config.id
  min_size               = var.frontend_min_size
  max_size               = var.frontend_max_size
  desired_capacity       = var.frontend_desired_capacity
  vpc_zone_identifier    = var.public_subnet_ids
  health_check_type      = "ELB"
  health_check_grace_period = 300
  #service_linked_role_arn = aws_iam_role.asg_role.arn

  tag {
    key                 = "Name"
    value               = "FrontendInstance"
    propagate_at_launch = true
  }

  target_group_arns = [var.frontend_target_group_arn]

  lifecycle {
    create_before_destroy = true
  }
}

data "aws_instances" "frontend_instances" {
  instance_tags = {
    Name = "frontend-instance"
  }
}

resource "aws_lb_target_group_attachment" "frontend_attachment" {
  count            = length(data.aws_instances.frontend_instances.ids)
  target_group_arn = var.frontend_target_group_arn
  target_id        = data.aws_instances.frontend_instances.ids[count.index]
  port             = 80
}

resource "aws_instance" "bastion" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = var.public_subnet_ids[0]
  security_groups = [var.frontend_sg_id, var.bastion_sg_id]

  tags = {
    Name = "BastionHost"
  }

  # Enable detailed monitoring (optional)
  monitoring = true
}