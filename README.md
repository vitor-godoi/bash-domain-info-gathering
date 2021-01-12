  Esse script foi criado para facilitar a coleta de
informações de um domínio, verificando o cadastro whois e
coletando informações adicionais, os pré-requisitos estão no
arquivo requirements.txt.


O arquivo analisado deverá conter apenas domínios, sendo um por linha:
  
  
  
Para rodar o script, é necessário dar o comando:
 "# service tor start
 
 



## ###################################################### ####
## Instalar e configurar o proxychains para usar o script ##
## ######################################################## ##


1) Dentro do arquivo /etc/proxychains.conf descomentar a linha 
dinamyc_chain

2) Comentar a linha strict_chain

3) No final do arquivo, adicione a linha: 
 socks5 127.0.0.1 9050

4) Comente a linha socks4
