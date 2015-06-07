#!/bin/bash
 cd /var/opt/NetBoxPrint
 gitpull=$(sudo /usr/bin/git pull)
 echo "$gitpull"
 ok1="Already up-to-date."
 
 # config.log loeschen falls vorhanden
 #if [ -f /tmp/config.log ]
 # then
 # rm -rf /tmp/config.log
# fi
 # wenn neue version gezogen wurde dann setup.py aufrufen und octoprint server neu starten 
 if [  "$gitpull" != "$ok1" ]
   then
   sudo /var/opt/NetBoxPrint/venv/bin/python setup.py install
   sudo /usr/sbin/service octoprint restart
 fi
 cd ~
exit