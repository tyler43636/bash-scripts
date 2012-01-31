#!/bin/bash
#
#Script to upload to github
#

DIRECTORY=`pwd`

echo "Would you like to upload the following directory: $DIRECTORY? \n"
echo "Y/n"

#get input
read CONTINUE

if [ $CONTINUE != "Y" ]
	then exit
fi

#Add any files in the directory to GIT
git add .
echo "==============="

#Commit
echo "Please enter a commit message"
read COM_MESSAGE

echo "Starting Commit"
echo "==============="

git commit -m "$COM_MESSAGE" -a -v

echo "==============="

#Push the commits to github
git push

echo "==============="

#Show the git logs
git log

exit
