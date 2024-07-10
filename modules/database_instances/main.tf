resource "aws_instance" "database" {
  count         = var.instance_count
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = element(var.private_db_subnet_ids, count.index % length(var.private_db_subnet_ids))
  security_groups = [var.security_group_id]
  user_data = <<-EOF
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y mysql-server
    sudo systemctl start mysql
    sudo systemctl enable mysql
  EOF

  tags = {
    Name = "DatabaseInstance${count.index + 1}"
  }
}