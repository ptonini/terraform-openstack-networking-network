variable "name" {}

variable "subnets" {
  default = 1
}

variable "external_network_id" {
  default = null
}

variable "network_admin_state_up" {
  default = true
}

variable "router_admin_state_up" {
  default = true
}

variable "ipv4_cidr" {}

variable "subnet_newbits" {
  default = 8
}

variable "ip_version" {
  default = 4
}

variable "dns_nameservers" {
  default = []
}
