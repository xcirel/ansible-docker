#!/bin/bash
echo "Insira o nome do Volume a ser criado:"
read nome;

# Volume a ser criado
nfsvol=/mnt/nfsvol/lv01/$nome
mkdir $nfsvol
# Linode
info="192.168.128.0/21(rw,sync,no_root_squash,no_subtree_check)";
echo $nfsvol $info >> /etc/exports
exportfs -a
systemctl restart nfs-server
echo "Volume Criado"
echo "Criação finalizada"

# du.sh
echo 'echo "---' $nome '--"' >> du.sh
echo "du -sh /mnt/nfsvol/lv01/"$nome >> du.sh
echo "Finalizada a adicao no script du.sh"