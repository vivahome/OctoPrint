#!/bin/bash
 cd /var/opt/NetBoxPrint
 liste=$(sudo /usr/bin/git pull)
 echo "$liste"
 echo "$liste  VE"
 if ["$liste$ -ne "Already up-to-date." ]
   then
   echo "not eq"
  # sudo /var/opt/NetBoxPrint/venv/bin/python setup.py install
 fi
 sudo /usr/sbin/service octoprint restart
 cd ~
