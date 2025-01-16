variable "cluster_identifier" {
  description = "Name of cluster and instances"
  type        = string
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags map for resources"
}

variable "instance_number" {
  description = "Number of instances in cluster"
  type        = number
  default     = 1
}

variable "instance_class" {
  description = "Instance type"
  type        = string
  default     = "db.t3.medium"
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = []
}

variable "master_username" {
  description = "Master username"
  type        = string
  default     = "root"
}

variable "master_password" {
  description = "Master password, avoid explicitly state in code"
  type        = string
  default     = ""
}

variable "is_primary_cluster" {
  description = "Determines whether cluster is primary cluster with writer instance (set to `false` for global cluster and replica clusters)"
  type        = bool
  default     = true
}

variable "db_subnet_group_name" {
  description = "Master password, avoid explicitly state in code"
  type        = string
  default     = ""
}

variable "vpc_security_group_ids" {
  type        = list(string)
  default     = null
  description = "A list of security group IDs to associate with."
}
