#!/usr/bin/env bash
DIR=`pwd`


if [[ -d "${DIR}/.vagrant" ]]; then
    VAGRANT_DIR=${DIR}/.vagrant
    
    mtime1=$(date -r "${DIR}/Vagrantfile" "+%s")
    mtime2=$(test -f "${VAGRANT_DIR}/ssh_config" && date -r "${VAGRANT_DIR}/ssh_config" "+%s")
    if [[ "$mtime1" != "$mtime2" ]]; then
        echo "save configuration vagrant (ssh vagrant ssh-config > ${VAGRANT_DIR}/ssh_config)"
        echo "wait ...."
        vagrant ssh-config > "${VAGRANT_DIR}/ssh_config"
        touch -r "${DIR}/Vagrantfile" "${VAGRANT_DIR}/ssh_config"
    fi
    VM_DIR="${VAGRANT_DIR}/machines"
    if [[ "$#" -eq 1 && -d "$VM_DIR/$1"  ]]; then
        echo ssh -F "${DIR}/.vagrant/ssh_config" "$@" 
        ssh -F "${DIR}/.vagrant/ssh_config" "$@"
    else
        nbl="`ls ${VM_DIR} | wc -l`"
        if [ "${nbl}" == "1" ]; then
            # ssh to unique machine
            VM=`ls ${VM_DIR}`
            echo ssh -F "${DIR}/.vagrant/ssh_config" "${VM}"
            ssh -F "${DIR}/.vagrant/ssh_config" "${VM}"
        else
            echo "VM name must be specified"
            echo -e "VMS lists :\n`ls $VM_DIR`"
        fi
    fi
else
   echo " No .vagrant in ${DIR}"
fi
