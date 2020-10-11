#/bin/bash

echo "Updating IP addr for rt-ms.ddns.net"

noip_request="https://gle8098%40yandex.ru:Eg4%23gj%25MmW%26PkN@dynupdate.no-ip.com/nic/update?hostname=rt-ms.ddns.net&myip="

my_ip=$(ip route get 8.8.8.8 | awk -F"src " 'NR==1{split($2,a," ");print a[1]}')

curl "${noip_request}${my_ip}"

echo ""
echo "Calling git pull"

git pull
