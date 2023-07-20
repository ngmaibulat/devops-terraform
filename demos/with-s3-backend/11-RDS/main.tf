
resource "aws_db_instance" "default" {
  allocated_storage    = 10
  storage_type         = "gp2"
  engine               = "postgres"
  engine_version       = "15"
  instance_class       = "db.t4g.micro"
  username             = "dbuser"
  password             = var.db_pass
  parameter_group_name = "default.postgres15"
  skip_final_snapshot  = true
  publicly_accessible  = true
  # vpc_security_group_ids = ["sg-xxxxxxxxxxxxxxxxx"]
}
