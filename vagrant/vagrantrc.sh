#!/usr/bin/env bash

###########
# vagrant #
###########

# https://www.vagrantup.com/docs/other/environmental-variables
export VAGRANT_CHECKPOINT_DISABLE=yes
export VAGRANT_FORCE_COLOR=yes
# export VAGRANT_LOG=info
export VAGRANT_POWERSHELL_VERSION_DETECTION_TIMEOUT=10
# export VAGRANT_INSTALLER_EMBEDDED_DIR=/c/HashiCorp/Vagrant/embedded


vup() {
    vagrant up $@ --parallel
}

vreload() {
    vagrant reload $@
}

vhalt() {
    vagrant halt $@
}

vdestroy() {
    vagrant destroy -f $@
}

vssh() {
    "${HOME}/dotfiles/vagrant/vm-ssh.sh" $@
}