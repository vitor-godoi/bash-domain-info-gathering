#e necessário dar start no serviço tor
#service tor start


# |====================================================================|
# |======|Pegar telefone analisando o site|============================|
# |====================================================================|

echo Qual a lista de domínios?
read domains
for x in $(cat $domains)
do


contatos=`curl --silent -L -k $x |html2text| grep "(*)"|grep -E [11-99]{1}|grep -E [0-9]{4}|cut -d '(' -f2` 

if [ -z "$contatos" ];then

contatos2=`curl -L -k --silent $x |html2text|grep -E "[0-9]{4} [0-9]{4}"`


if [ -z "$contatos2" ];then

contatos3=`curl -L -k --silent $x/contato |html2text|grep -E "[0-9]{4} [0-9]{4}"`

fi
fi
#  |==========================================================|
#  |===|Buscar CNPJ ou CPF do Responsavel do Dominio |========|
#  |==========================================================|

wis=`whois $x| grep ownerid:| cut -d":" -f2|sed 's/ //g'`
regex="[0-9]{3}.[0-9]{3}.[0-9]{3}-[0-9]{2}$"

if [[ ${wis} =~ ${regex} ]]; then
id="CPF: $wis"

#  |==============================================================|
#  |=======|Se for CNPJ...kaboom!|================================|
#  |==============================================================|
else
id="CNPJ: $wis"
proxychains curl -L --silent -k cadastroempresa.com.br/cnpj/$wis/ |html2text|head -n 60|tail -n 30


fi


#   |=========================================================|
#   |===|Buscar onde está hospedado e dados da tabela|========|
#   |=========================================================|

fuleco=`nslookup -q=mx $x|grep exchanger|tail -n1|cut -d" " -f5`
echo $x "||" $contatos $contatos2 $contatos3"||" $fuleco  "||" $id 


echo "*************************************************************************************"
echo "*************************************************************************************"
echo "*************************************************************************************"
echo "*************************************************************************************"

done
