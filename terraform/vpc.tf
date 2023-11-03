## Virtual private cloud block


resource "yandex_vpc_network" "network_terraform" {
  name = "network_terraform"
}

resource "yandex_vpc_subnet" "subnet1" {
  name           = "subnet1"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.network_terraform.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}

resource "yandex_vpc_address" "addr" {  # резервируем внешний IP-адрес
  name = "158.160.97.216"
    external_ipv4_address {
    zone_id = "ru-central1-a"
  }
}