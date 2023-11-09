output "this" {
  value = openstack_networking_network_v2.this
}

output "subnets" {
  value = openstack_networking_subnet_v2.this
}

output "router" {
  value = var.external_network_id == null ? null : openstack_networking_router_v2.this[0]
}