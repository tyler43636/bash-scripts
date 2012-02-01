#!/bin/bash
#
#Home directory backup script
#

#Variables
HOME=/home
BACKUP=/backup
DATE=`date +%Y-%m-%d`

#Make sure variables work
echo $HOME
echo $DATE

tar -czf $BACKUP/$DATE.tar.gz $HOME

echo "Backup Completed"

exit

