variable "vpc_cidr" {
  type        = string
  description = "vpc cidr"
}

variable "public_subnets" {
  type        = list(string)
  description = "public subnet cidr"
}

variable "instance_type" {
  type = string
}

variable "key_name" {
  type = string
}