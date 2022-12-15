Script para Ansible com o intuito de inslatar o Docker (Linux Ubuntu)

# Estrutura/processos
- Atualizar o apt 
- Instalar pacotes para permitir que o apt use um repositório por HTTPS
- Adicionar o Docker GPG oficial 
- Adicionar o repositório Docker no APT sources
- Certificar de instalar os pacotes a partir do repositório do Docker em vez do repositório padrão do Ubuntu
- Finalmente, vamos instalar o Docker


# Vamos iniciar

1. Vamos atualizar a lista de pacotes:
```sh
sudo apt update
```

2. Em seguida, instalar alguns pacotes de pré-requisito que permitem que o apt use pacotes por HTTPS:
```sh
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common 
```

 3. Agora, vamos adicionar a chave GPG do repositório oficial do Docker ao seu sistema:
```sh
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
 ```

4. Adicionar o repositório Docker no APT sources:
```sh
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
```

5. Vamor garantir que a instalação ocorra a partir do repositório do Docker:
```sh
apt-cache policy docker-ce docker-ce-cli containerd.io docker-compose-plugin
```
Você verá uma saída como esta, embora o número da versão do Docker possa ser diferente:

```sh
docker-ce:
  Installed: (none)
  Candidate: 5:20.10.21~3-0~ubuntu-focal
  Version table:
     5:20.10.21~3-0~ubuntu-focal 500
        500 https://download.docker.com/linux/ubuntu focal/stable amd64 Packages
```

6. Finalmente, vamos instalar o Docker:
```sh
docker-ce docker-ce-cli containerd.io docker-compose-plugin
```