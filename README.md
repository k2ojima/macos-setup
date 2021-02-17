# MacOS Setup
A tool to setup MacOS smoothly.

## How to setup

```bash
$ git clone https://github.com/xentok/macos-setup.git
$ cd macos-setup
```


```bash
$ easy_install pip
```

```bash
$ pip install ansible
$ pip install ansible --upgrade
```

```bash
$ cd ./ansible
$ ansible-playbook -i inventories/default --ask-become-pass playbook.yml
```
