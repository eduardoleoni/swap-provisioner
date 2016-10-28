#!/bin/sh
if [$1 == ""]; then
   size="1G"
else
   location=$2
fi

if [$2 == ""]; then
   location="/swapfile"
else
   location=$2
fi

fallocate -l $size $location
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
cp /etc/fstab /etc/fstab.bak
echo '/swapfile none swap sw 0 0' | tee -a /etc/fstab
