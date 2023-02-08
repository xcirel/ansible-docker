#!/bin/bash
echo "Insira o nome do volume"
read nome;

# Volume que será criado
nfsvol=/mnt/nfsvol/lv01/$nome
mkdir $nfsvol
rede="172.0.0.0/16(rw,sync,no_root_squash,no_subtree_check)";
echo $nfsvol $rede >> /etc/exports
exportfs -a 
systemctl restart nfs-kernel-server
echo "Volume criado"
echo "Criação do volume finalizada"

# du.sh
echo 'echo "---"' >> du.sh
echo 'echo "---' $nome '--"' >> du.sh
echo "du -sh /mnt/nfsvol/lv01/"$nome $rede >> du.sh
echo 'echo "---' $nome '--"' >> du.sh
echo "Finalizada a adição no script du.sh"