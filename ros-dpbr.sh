#!/bin/sh
mkdir -p ./pbr
cd ./pbr

# AS4809 BGP
wget --no-check-certificate -c -O CN.txt https://github.com/Hackl0us/GeoIP2-CN/blob/release/CN-ip-cidr.txt

{
echo "/ip firewall address-list"

for net in $(cat CN.txt) ; do
  echo "add list=CN address=$net comment=AS4809"
done

} > ../CN.rsc

cd ..
rm -rf ./pbr
