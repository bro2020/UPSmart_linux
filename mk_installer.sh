#!/bin/bash
set -e
pth=$(realpath $(dirname $0))
last=$(grep -n 'exit 0' ${pth}/script.tmp | cut -d':' -f1)
last_tail=$(($last+1))
current=$(grep 'tail -n +' ${pth}/script.tmp | cut -d'+' -f2 | cut -d'$' -f1)
tar -czf ${pth}/UPSmart.tar.gz -C ${pth}/app .
sed -i "s|tail -n +$current|tail -n +$last_tail |g" ${pth}/script.tmp
cat ${pth}/script.tmp ${pth}/UPSmart.tar.gz > ${pth}/Installer_UPSmart_linux_x86_64
chmod +x ${pth}/Installer_UPSmart_linux_x86_64
rm ${pth}/UPSmart.tar.gz
