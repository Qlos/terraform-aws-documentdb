locals {
  # mail_from_enabled = length(var.mail_from_domain) > 0
}

resource "random_password" "password" {
  length  = 20
  special = false
}

resource "aws_docdb_cluster_instance" "instance" {
  count      = var.instance_number
  identifier = "${aws_docdb_cluster.cluster.cluster_identifier}-${count.index}"
  cluster_identifier = aws_docdb_cluster.cluster.id
  instance_class = var.instance_class
  tags = var.tags
}


resource "aws_docdb_cluster" "cluster" {
  cluster_identifier     = var.cluster_identifier
  availability_zones     = var.availability_zones
  db_subnet_group_name   = var.db_subnet_group_name
  vpc_security_group_ids = var.vpc_security_group_ids
  
  master_username    = var.is_primary_cluster ? var.master_username : null
  master_password    = var.is_primary_cluster && var.master_password != "" ? var.master_password : random_password.password.result
  tags = var.tags
}

