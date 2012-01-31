#!/bin/bash
#
#Home directory backup script
#

#Variables
HOME=/home
DATE=`date +%Y-%m-%d`

#Make sure variables work
echo $HOME
echo $DATE

tar -czf /backup/$DATE.tar.gz $HOME

exit
