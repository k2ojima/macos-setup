# MacOS Setup
A tool to setup MacOS smoothly.

## How to setup
Some of the software and components you’ll want to install will rely on Xcode’s Command Line Tools package. 

First exec the following command to install Xcode components.

```bash
$ xcode-select --install
```

After that, install Homebrew.

```bash
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Clone this repository.

```bash
$ git clone https://github.com/xentok/macos-setup.git
$ cd macos-setup
```

Install pip to install ansible.

```bash
$ easy_install pip
```

Install ansible through pip.

```bash
$ pip install ansible --upgrade

# Install community.general collection
$ ansible-galaxy collection install community.general
```

Setup with running playbook.

```bash
$ cd ./ansible
$ ansible-playbook -i inventories/[default or for_jobs] --ask-become-pass playbook.yml
```
