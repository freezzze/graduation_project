## Providers block


terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = ">= 0.74"
    }
  }


backend "s3" {
    endpoint                    = "storage.yandexcloud.net"
    bucket                      = "tbucket-yc"
    region                      = "ru-central1-a"
    key                         = "sfler/lemp.tfstate"
    skip_region_validation      = true
    skip_credentials_validation = true
  }
}

provider "yandex" {
  token     = var.yandex_token
  cloud_id  = var.yandex_cloud_id
  folder_id = var.yandex_folder_id
  zone      = var.yandex_zone
}