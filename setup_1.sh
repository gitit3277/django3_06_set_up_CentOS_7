#!/bin/bash

echo "-->Updating CentOS 7 System"
yum -y update 

echo "-->Installing wget" 
yum -y install wget 

echo "Installing development tools  "
yum -y install openssl-devel bzip2-devel libffi-devel

echo "Downloading sqlite3"
wget https://www.sqlite.org/2020/sqlite-autoconf-3320100.tar.gz

echo "unzip sqlite3"
tar zxvf sqlite-autoconf-3320100.tar.gz
cd sqlite-autoconf-3320100
./configure

echo "archive old binary of sqlite3 if it exist"  
if [ -f /usr/bin/sqlite3 ]; then 
	echo "Archiving old version of sqlite3"
	mv /usr/bin/sqlite3 /usr/bin/sqlite3.bak
fi

make
make install  

sudo echo "export LD_LIBRARY_PATH="/usr/local/lib" ">> ~/.bashrc 
sudo echo "export LD_LIBRARY_PATH="/usr/local/lib" ">> ~/.bash_profile 



