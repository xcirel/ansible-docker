Script para Ansible de como inslatar o Docker no Linux Ubuntu

# Estrutura/processos
- Atualizar o APT 
- Instalar pacotes para permitir que o APT use um repositório por HTTPS
- Adicionar o Docker GPG oficial 
- Adicionar o repositório Docker no APT sources
- Certificar de instalar os pacotes a partir do repositório do Docker em vez do repositório padrão do Ubuntu
- Finalmente, vamos instalar o Docker


# Se fosse fazer manualmente, teria que executar esse passo a passo listado abaixo em cada máquina

1. Atualizar a lista de pacotes:
```sh
sudo apt-get update
```

2. Em seguida, instalar alguns pacotes de pré-requisito que permitem que o apt-get use pacotes por HTTPS:
```sh
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common 
```

 3. Agora, teria que adicionar a chave GPG do repositório oficial do Docker ao seu sistema:
```sh
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
 ```

4. Depois adicionar o repositório Docker no APT sources:
```sh
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
```

5. E ainda, garantir que a instalação ocorra a partir do repositório do Docker:
```sh
apt-cache policy docker-ce docker-ce-cli containerd.io docker-compose-plugin
```
Você veria uma saída como essa, embora o número da versão do Docker poderia ser diferente:

```sh
docker-ce:
  Installed: (none)
  Candidate: 5:20.10.21~3-0~ubuntu-focal
  Version table:
     5:20.10.21~3-0~ubuntu-focal 500
        500 https://download.docker.com/linux/ubuntu focal/stable amd64 Packages
```

6. Finalmente, iria nessa etapa fazer a inatalção do Docker:
```sh
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
```

# Mas graças ao Ansible, uma vez que você tem a sua máquina funcionando e acesso a ela através do serviço SSH:

Após inserir os IP's dos seus hosts no arquivos hosts, basta executar o comando abaixo:
```sh
ansible-playbook -i hosts playbook.yaml
```