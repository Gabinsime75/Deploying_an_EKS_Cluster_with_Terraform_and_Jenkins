variable "vpc_cidr" {
  type        = string
  description = "vpc cidr"
}

variable "public_subnets" {
  type        = list(string)
  description = "public subnet cidr"
}

variable "private_subnets" {
  type        = list(string)
  description = "public subnet cidr"
}

variable "instance_types" {
  type = list(string)
}