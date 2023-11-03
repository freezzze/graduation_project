## VM's block

data "yandex_compute_image" "ubuntu_image" {
  family = "ubuntu-2204-lts"
}

resource "yandex_compute_instance" "master1" {
  name                      = "master1"
  allow_stopping_for_update = true
  hostname                  = "master1"

  resources {
    core_fraction = 20  #указываем гарантированную долю CPU в %
    cores         = 2
    memory        = 2
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu_image.id
      size     = "20"
    }
  }


  network_interface {
    subnet_id = yandex_vpc_subnet.subnet1.id
    nat       = true
  }

  metadata = {
    # user-data = "${file("./meta.txt")}"
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }

  scheduling_policy {             #указываем, что машина прерываемая
    preemptible = true
  }

}

resource "yandex_compute_instance" "master2" {
  name                      = "master2"
  allow_stopping_for_update = true
  hostname                  = "master2"

  resources {
    core_fraction = 20  #указываем гарантированную долю CPU в %
    cores         = 2
    memory        = 2
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu_image.id
      size     = "20"
    }
  }


  network_interface {
    subnet_id = yandex_vpc_subnet.subnet1.id
    nat       = true
  }

  metadata = {
    # user-data = "${file("./meta.txt")}"
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }

  scheduling_policy {             #указываем, что машина прерываемая
    preemptible = true
  }

}

resource "yandex_compute_instance" "master3" {
  name                      = "master3"
  allow_stopping_for_update = true
  hostname                  = "master3"

  resources {
    core_fraction = 20  #указываем гарантированную долю CPU в %
    cores         = 2
    memory        = 2
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu_image.id
      size     = "20"
    }
  }


  network_interface {
    subnet_id = yandex_vpc_subnet.subnet1.id
    nat       = true
  }

  metadata = {
    # user-data = "${file("./meta.txt")}"
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }

  scheduling_policy {             #указываем, что машина прерываемая
    preemptible = true
  }

}
resource "yandex_compute_instance" "app1" {
  name                      = "app1"
  allow_stopping_for_update = true
  hostname                  = "app1"

  resources {
    core_fraction = 20
    cores         = 2
    memory        = 2
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu_image.id
      size     = "20"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet1.id
    nat       = true
  }

  metadata = {
    # user-data = "${file("./meta.txt")}"
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }

  scheduling_policy {
    preemptible = true
  }

}

resource "yandex_compute_instance" "app2" {
  name                      = "app2"
  allow_stopping_for_update = true
  hostname                  = "app2"

  resources {
    core_fraction = 20
    cores         = 2
    memory        = 2
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu_image.id
      size     = "20"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet1.id
    nat       = true
  }

  metadata = {
    # user-data = "${file("./meta.txt")}"
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }

  scheduling_policy {
    preemptible = true
  }

}
resource "yandex_compute_instance" "srv" {
  name                      = "srv"
  allow_stopping_for_update = true
  hostname                  = "srv"

  resources {
    core_fraction = 20
    cores         = 2
    memory        = 2
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu_image.id
      size     = "20"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet1.id
    nat       = true
  }

  metadata = {
    # user-data = "${file("./meta.txt")}"
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }

  scheduling_policy {
    preemptible = true
  }

}

resource "yandex_compute_instance" "ci" {
  name                      = "ci"
  allow_stopping_for_update = true
  hostname                  = "ci"

  resources {
    core_fraction = 20
    cores         = 2
    memory        = 2
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu_image.id
      size     = "20"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet1.id
    nat       = true
  }

  metadata = {
    # user-data = "${file("./meta.txt")}"
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }

  scheduling_policy {
    preemptible = true
  }

}