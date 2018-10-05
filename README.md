
# ipa-lab

## Что это?
Это виртуальные машины для практик по интеграции Active Directory и IPA.
Идея была в том, чтобы быстро и автоматически поднять предсказуемую тестовую среду, в которой был бы сразу поднят готовый Active Directory домен и были преднастроены виртуальные машины на GNU/Linux так чтобы можно было тестировать поднятие IPA домена, включение в него машин, поднятие интегрированных с ним сервисов, ну а самое главное, соединить межлесовым доверительным отношением IPA домен с Active Directory. Тестовую среду легко настроить под свои нужды, отредактировать конфиг файл и перезапустив развертывание.

Виртуальные машины на Windows используют предварительно подготовленные образы `dmi3mis/Server2016` и `dmi3mis/Windows_10`  используют ознакомительные версии `Microsoft Windows 10` и `Microsoft Windows Server 2016` Cкрипты для создания образа взяты [отсюда](https://github.com/clong/DetectionLab).

Загрузка и использование ознакомительных версий требует предварительного принятия лицензионного соглашения  [Microsoft Evaluation Centre: Microsoft Windows 10 Enterprise](https://www.microsoft.com/en-us/evalcenter/evaluate-windows-10-enterprise) и [Microsoft Evaluation Centre: Microsoft Windows Server 2016](https://www.microsoft.com/en-us/evalcenter/evaluate-windows-server-2016).

Виртуальные машины на CentOS 7 используют предварительно подготовленные образы `dmi3mis/сentos7` и `dmi3mis/сentos7_desktop`. Скрипты, на основе которых подготовлены образы CentOS 7 взяты [отсюда](https://github.com/boxcutter/centos).

Файлы образов виртуальных машин автоматически загружаются с серверов [Hashicorp Vagrant Cloud](https://app.vagrantup.com).

Описание используемых образов виртуальных машин:

 Операционная Система            |Название образа          |           Версия | Среда виртуализации | Размер
---------------------------------|-------------------------|------------------|---------------------|--------
 Microsoft Windows Server 2016   | dmi3mis/Server_2016     | 180902           | Oracle Virtualbox   | 7.28 GB
 Microsoft Windows 10 Enterprise | dmi3mis/Windows_10      | 180931           | Oracle Virtualbox   | 5.37 GB
 Centos 7.5.1804                 | dmi3mis/centos7         | 1804.20181002    | Oracle Virtualbox   |  488 MB
 Centos 7.5.1804                 | dmi3mis/centos7_desktop | 1804.20181003    | Oracle Virtualbox   | 1.41 GB

Суммарный размер образов: 14.55 GB

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

Как запустить среду?

```bash
git clone https://github.com/dmi3mis/ipa-lab
cd ipa-lab/vagrant
vagrant up --provider=virtualbox
```

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

> Внимание! Инструкции к практическим занятиям находятся в разделе [Instructions](https://github.com/dmi3mis/ipa-lab/blob/master/Instructions/Readme.md)
