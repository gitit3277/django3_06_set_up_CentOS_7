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

echo "export LD_LIBRARY_PATH="/usr/local/lib" ">> /home/user1/.bashrc 
echo "export LD_LIBRARY_PATH="/usr/local/lib" ">> /home/user1/.bash_profile 

source /home/user1/.bashrc
source /home/user1/.bash_profile

echo "Installing Python 3.8.0"
cd ..
wget https://www.python.org/ftp/python/3.8.3/Python-3.8.3.tgz
tar zxvf Python-3.8.3.tgz
cd Python-3.8.3/
./configure 
make 
make install 


