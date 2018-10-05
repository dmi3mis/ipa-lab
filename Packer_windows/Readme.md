
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
