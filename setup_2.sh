#!/bin/bash


# need to cd to the correct folder 


echo "Installing Python 3.8.0, remember reboot is required prior to running script_2"
cd ..
wget https://www.python.org/ftp/python/3.8.3/Python-3.8.3.tgz
tar zxvf Python-3.8.3.tgz
cd Python-3.8.3/
./configure 
make 
make install 

# need to find way to remove soft link if it exists 
# rm /usr/bin/python3
