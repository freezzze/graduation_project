## Создаём DNS зону my-private-zone и добавляем А запись
resource "yandex_dns_zone" "zone1" {
  name        = "my-private-zone"
  description = "desc"

  labels = {
    label1 = "sflearn-ru"
  }

  zone             = "sflearn.ru."
  public           = true
  private_networks = [yandex_vpc_network.network_terraform.id]
}

resource "yandex_dns_recordset" "rs1" {
  zone_id = yandex_dns_zone.zone1.id
  name    = "git.sflearn.ru."
  type    = "A"
  ttl     = 200
  data    = ["158.160.97.216"]
}
