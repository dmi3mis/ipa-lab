> Внимание! Инструкции к практическим занятиям находятся [вот тут рядом в папке Instructions](https://github.com/dmi3mis/ipa-lab/blob/master/Instructions/Readme.md)

# ipa-lab

## Зачем?
Это виртуальные машины для практик по интеграции Active Directory и IPA.
Идея была в том, чтобы быстро и автоматически поднять предсказуемую тестовую среду, в которой был бы сразу поднят готовый Active Directory домен и были преднастроены виртуальные машины на GNU/Linux так чтобы можно было тестировать поднятие IPA домена, включение в него машин, поднятие интегрированных с ним сервисов, ну а самое главное, соединить межлесовым доверительным отношением IPA домен с Active Directory. Тестовую среду легко настроить под свои нужды, отредактировать конфиг файл и перезапустив развертывание.

Виртуальные машины используют предварительно подготовленные образы `Windows Server 2016` и `Windows 10` триальные версии [скрипты для создания образа взяты отсюда](https://github.com/clong/DetectionLab)
Образы можно загрузить уже готовыми или собрать самому из iso файлов дистрибутивов.
Оффициальный образ CentOS 7 взят [отсюда](https://app.vagrantup.com/centos/boxes/7). Оффициальные рекомендации по использованию этого образа можно найти в [посте блога разработчиков](https://blog.centos.org/2018/05/updated-centos-vagrant-images-available-v1804-02/).
К сожалению в оффициальном образе `centos/7` совсем нет мануалов.
По желанию можете использовать образ CentOS 7 для разработчика `generic/centos7` отсюда

## Аппаратные требования

* 55GB+ свободного места на жестком диске
* 16GB+ Оперативной памяти
* Packer >= v1.0.0
* Vagrant >= 1.9.2
* Virtualbox or VMWare Fusion/Workstation

## Как запустить тестовую среду

Сначала выберите платформу виртуализации
Поддерживаются Oracle Virtualbox и VMware Workstation

> Note: Oracle Virtualbox бесплатен, но [VMWare Desktop vagrant plugin](https://www.vagrantup.com/vmware/#buy-now) стоит $80.


Если вы хотите сами создать образы Windows:

```bash
$ cd ipa-lab/Packer
$ packer build --only=[vmware|virtualbox]-iso windows_10.json
$ packer build --only=[vmware|virtualbox]-iso windows_2016.json
```

Теперь импортируйте созданные образы

```bash
vagrant box add --name dmi3mis/windows_10 windows_10_virtualbox.box
vagrant box add --name dmi3mis/windows_2016 windows_2016_virtualbox.box
```

Как запустить среду?

1. git clone https://github.com/dmi3mis/ipa-lab
2. Перейдите в каталог с файлом `Vagrantfile` `cd ipa-lab/vagrant`
3. Запустите создание среды командой `vagrant up`.


## Basic Vagrant Usage
Vagrant commands must be run from the "Vagrant" folder.

* Bring up all Detection Lab hosts: `vagrant up` (optional `--provider=[virtualbox|vmware_desktop]`)
* Bring up a specific host: `vagrant up <hostname>`
* Restart a specific host: `vagrant reload <hostname>`
* Restart a specific host and re-run the provision process: `vagrant reload <hostname> --provision`
* Destroy a specific host `vagrant destroy <hostname>`
* Destroy the entire Detection Lab environment: `vagrant destroy` (Adding `-f` forces it without a prompt)
* SSH into a host (only works with Logger): `vagrant ssh logger`
* Check the status of each host: `vagrant status`
* Suspend the lab environment: `vagrant suspend`
* Resume the lab environment: `vagrant resume`

---
