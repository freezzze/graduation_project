output "internal_ip_address_master1" {
  value = yandex_compute_instance.master1.network_interface.0.ip_address
}

output "internal_ip_address_master2" {
  value = yandex_compute_instance.master2.network_interface.0.ip_address
}

output "internal_ip_address_master3" {
  value = yandex_compute_instance.master3.network_interface.0.ip_address
}

output "internal_ip_address_app1" {
  value = yandex_compute_instance.app1.network_interface.0.ip_address
}

output "internal_ip_address_app2" {
  value = yandex_compute_instance.app2.network_interface.0.ip_address
}

output "internal_ip_address_srv" {
  value = yandex_compute_instance.srv.network_interface.0.ip_address
}

output "internal_ip_address_ci" {
  value = yandex_compute_instance.srv.network_interface.0.ip_address
}
output "external_ip_address_master1" {
  value = yandex_compute_instance.master1.network_interface.0.nat_ip_address
}

output "external_ip_address_master2" {
  value = yandex_compute_instance.master2.network_interface.0.nat_ip_address
}

output "external_ip_address_master3" {
  value = yandex_compute_instance.master3.network_interface.0.nat_ip_address
}

output "external_ip_address_app1" {
  value = yandex_compute_instance.app1.network_interface.0.nat_ip_address
}

output "external_ip_address_app2" {
  value = yandex_compute_instance.app2.network_interface.0.nat_ip_address
}

output "external_ip_address_srv" {
  value = yandex_compute_instance.srv.network_interface.0.nat_ip_address
}

output "external_ip_address_ci" {
  value = yandex_compute_instance.srv.network_interface.0.nat_ip_address
}
output "subnet-1" {
  value = yandex_vpc_subnet.subnet1.id
}