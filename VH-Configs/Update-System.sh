#!/bin/bash
 cd /var/opt/NetBoxPrint
 liste=$(sudo /usr/bin/git pull)
 echo "$liste"
 echo "$liste  VE"
 ok1="Already up-to-date."
 if ["$liste$ = "$ok1" ]
   then
   echo "not eq"
  # sudo /var/opt/NetBoxPrint/venv/bin/python setup.py install
 fi
 sudo /usr/sbin/service octoprint restart
 cd ~
