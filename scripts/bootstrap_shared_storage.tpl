#!/bin/bash

sudo mkdir -p /export/icpshared

if [ ${icp_num_masters} -gt 1 ]; then
    sudo mkdir -p /export/icpshared/var/lib/registry
    sudo mkdir -p /export/icpshared/var/lib/icp/audit
    sudo mkdir -p /export/icpshared/var/log/audit
    cat <<EOF | tee -a /etc/exports
/export/icpshared/var/lib/registry *(rw,sync,insecure,no_root_squash,no_subtree_check,nohide)
/export/icpshared/var/lib/icp/audit *(rw,sync,insecure,no_root_squash,no_subtree_check,nohide)
/export/icpshared/var/log/audit *(rw,sync,insecure,no_root_squash,no_subtree_check,nohide)
EOF
    sudo /usr/sbin/exportfs -a
fi

