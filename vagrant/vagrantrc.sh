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
    grep "'name' =>" Vagrantfile | awk -F"'" '{print $6}' | xargs -P6 -I {} vagrant up {}
    if [[ -f ./.vagrant/ssh_config ]];then
        rm ./.vagrant/ssh_config
    fi
    "${HOME}/dotfiles/vagrant/vm-ssh.sh" $@
}

vreload() {
    vagrant reload --parallel $@
}

vhalt() {
   grep "'name' =>" Vagrantfile | awk -F"'" '{print $6}' | xargs -P6 -I {} vagrant halt {}
}

vssh() {
    "${HOME}/dotfiles/vagrant/vm-ssh.sh" $@
}
