#!/bin/bash
 cd /var/opt/NetBoxPrint
 sudo /usr/bin/git pull
 sudo /var/opt/NetBoxPrint/venv/bin/python setup.py install
 sudo /usr/sbin/service octoprint restart
 cd ~
 
