<!--- Вообще, если по шагам, а не тупой формулировки в скиллфэктори, то Задание выглядет так:
#### 1.  Выбираем облачный провайдер и инфраструктуру

- В качестве облака выберем Yandex.Cloud
- Нам потребуются три сервера:
   - Два сервера в кластере Kubernetes: 1 master и 1 app node
   - Сервер srv для инструментов мониторинга, логгирования и сборки контейнеров

#### 2. Описываем инфраструктуру в Terraform
- Создадим группу проектов devops в Git репозитории для конфигураций  
- Опишем инфраструктуру в Terraform конфигурациях
- В README.md описать инструкцию по развертыванию инфраструктуры в облаке

#### 3. Автоматизируем настройку сервера 'srv'
- Используем Ansible для автоматизации настройки серверов
- Установка нужных пакетов (docker-compose, gitlab-runner, kubectl, helm)
- Настройка kubectl/helm для взаимодействия с удаленным кластером
- Добавление публичных ключей для доступа по SSH

#### 4. Сборка и деплой приложения в кластер Kubernetes
- Клонируем репозиторий с исходными кодами простого приложения на Django и Dockerfile
- Настроим пайплайн сборки образа и отправки его в Docker Registry (можно использовать GitLab, Jenkins или GitHub Actions)
- Описываем приложение в Helm-чарте, включая контейнеры с базой данных и самим приложением
- Настраиваем деплой стадию пайплайна, применяем Helm-чарт в кластер Kubernetes
- Убедимся, что приложение развернуто и доступно по бесплатному домену или IP-адресу с выбранным портом

#### 5. Настройка мониторинга и сборки логов приложения
- Настройка сбора логов работы пода приложения с помощью выбранного инструмента (можно хранить логи в самом кластере Kubernetes или на сервере srv)
- Выбор метрик для мониторинга, например, время отклика, статус код и место на сервере srv
- Настройка дашборда для наблюдения за метриками в разрезе времени с использованием инструментов, таких как Grafana или Zabbix
- Добавление уведомлений в выбранный мессенджер для алертинга о проблемах и инцидентах

#### 6. Завершение проекта
- Положить все конфигурации в Git-репозиторий
- Проверить отправку уведомлений и время от инцидента до получения уведомления
- Поздравить с завершением проекта и успешной настройкой мониторинга и логирования

--->

# Некоторые заметки по работе

1. Используются:
 - Yandex Cloud (YC)
 - Ubuntu Server
 - GitLab
 - Docker Hub

2. При работе с Terraform правим файл variables.tf с указанием данных для подключения к облаку. В моей конфигурации для хранения файла состояния используется S3 хранилище.
Инициализация бэкэнда происходит так:

```sh
terraform init -backend-config="access_key=$ACCESS_KEY" -backend-config="secret_key=$SECRET_KEY" -reconfigure
```

- Так как пользователь 'ubuntu' уже существует (используются подготовленые для деплоя образа YC), то вместо создания нового пользователя используется существующий (строку "user-data = "${file("./meta.txt")}" закомментировал, файл 'meta.txt' тоже не используется").

3. Далее развёртываем k8s кластер с помощью kubespray: 
- редактируем ansible/mycluster/inventory 
- если необходимо меняем сетевой плагин (я использую calico)
- среду для запуска контейнеров (у меня containerd)
- указываем ставится ли сразу helm 
- редактируем ansible/ansible.cfg (я указывал путь к inventory и правил privilege_escalation блок)

4. При регистрации gitlab-runner выбираем executor 'docker', образ python:latest. В гитлаб создаём токен с правами registry_read/write. 
<!--  Написать такой плейбук: для хоста 'srv' ssh-keygen затем забираем полученный .pub на локальную машину и передаём содержимое в authorized_key хоста 'master1'. На хосте 'master1' выполняем: 
To start using your cluster, you need to run the following as a regular user:

  mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config 
И получившейся config копируем на 'srv' $HOME/.kube/ и затем ставим kubectl, docker-compose и gitlab-runner
И настраиваем запуск docker без sudo:
sudo usermod -aG docker $USER&&newgrp docker
-->

4. После развертывания инфраструктуры с помощью Ansible, регистрируем Runner на Gitlab:

```sh
gitlab-runner register
```

На вопрос "Enter an executor" отвечаем "docker".

5. В настройках CI/CD Gitlab добавляем две переменные - DOCKER_USERNAME и DOCKER_PASSWORD. Соответственно, логин и пароль для прохождения валидации в репозитории Docker Hub.

6. Для корректной работы kubectl на srv берем содержимое файла /etc/kubernetes/admin.conf с мастера kubernetes и копируем его в такой же файл на srv.
