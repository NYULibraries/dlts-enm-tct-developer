# Dev Setup for ENM TCT Backend

These are the vagrant settings and provisioning scripts used for local development of the [Enhanced Networked Monographs -- Topic Curation Toolkit Backend](https://github.com/NYULibraries/dlts-enm-tct-backend).

## Dependencies

Our development environment requires the following software:

- [Vagrant](https://www.vagrantup.com/): 1.8.6 or greater
- [Virtualbox](https://www.virtualbox.org/wiki/VirtualBox): 5.0.6 or greater

This setup should in theory be configurable on most Operating Systems, but thus far has only been tested in Max OSX >= 10.10.  It is also possible to use Vagrant with other Virtual Machine providers such as VMWare or Parallels, but our setup is currently configured for Virtualbox.

## Setup

Once vagrant is installed, download the appropriate virutal machine image by running:

```
vagrant box add "bento/ubuntu-16.04"
```

To then both boot the virtual machine and run the attached `setup.sh` provisioning script, run:

```
vagrant up
```

To access the running machine once virtual machine is running and the provisioning script is done, run:

```
vagrant ssh
```

## Shortcuts

SSH'ing to the new machine will log you in as use "vagrant".  The folder containing the Vagrantfile on your host machine will have been mounted into the vagrant box as a synched folder in the folder /vagrant.  For ease of development, we usually put our application code in that folder for easy file sharing between the host machine and the VM.

The following aliases will be have been added to your `~/.bash_aliases` for convincenice purposes:

```bash
alias runs='django-admin runserver_plus [::]:8001'
alias shell='django-admin shell_plus'
alias mm='django-admin makemigrations'
alias migrate='django-admin migrate'
alias rs='django-admin runscript'
alias da='django-admin'
```

These shortcuts are dependend on the following environment variables, set in the `~/.profile`:

```bash
export PYTHONPATH=/vagrant
export DJANGO_SETTINGS_MODULE=nyu.vagrant_settings
```

This setup assumes that your application code is in the same folder as your Vagrantfile (which will be mounted in Vagrant as the shared /vagrant folder). If your code structure is different or located elsewhere, be sure to adust the `PYTHONPATH` environment variable to point to the root of your project folder.
