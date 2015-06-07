#!/bin/bash
 cd /var/opt/NetBoxPrint
 liste=$(sudo /usr/bin/git pull)
 echo "$liste"
 echo "$liste  VE"
 #sudo /var/opt/NetBoxPrint/venv/bin/python setup.py install
 sudo /usr/sbin/service octoprint restart
 cd ~
