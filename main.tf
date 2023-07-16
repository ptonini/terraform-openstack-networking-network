resource "openstack_networking_network_v2" "this" {
  name           = var.name
  admin_state_up = var.network_admin_state_up
}

resource "openstack_networking_router_v2" "this" {
  count               = var.external_network_id == null ? 0 : 1
  name                = openstack_networking_network_v2.this.name
  external_network_id = var.external_network_id
  admin_state_up      = var.router_admin_state_up
}

resource "openstack_networking_subnet_v2" "this" {
  count           = var.subnets
  name            = "subnet${format("%04.0f", count.index + 1)}"
  network_id      = openstack_networking_network_v2.this.id
  cidr            = cidrsubnet(var.ipv4_cidr, var.subnet_newbits, count.index)
  ip_version      = var.ip_version
  dns_nameservers = var.dns_nameservers
}

resource "openstack_networking_router_interface_v2" "this" {
  count     = var.external_network_id == null ? 0 : var.subnets
  router_id = openstack_networking_router_v2.this[0].id
  subnet_id = openstack_networking_subnet_v2.this[count.index].id
}