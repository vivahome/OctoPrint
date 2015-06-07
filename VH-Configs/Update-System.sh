#!/bin/bash
 cd /var/opt/NetBoxPrint
 gitpull=$(sudo /usr/bin/git pull)
 echo "$gitpull"
 ok1="Already up-to-date."
 if [  "$gitpull" != "$ok1" ]
   then
   sudo /var/opt/NetBoxPrint/venv/bin/python setup.py install
   sudo /usr/sbin/service octoprint restart
 fi
 cd ~
exit