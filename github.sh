#!/bin/bash
# github.sh
#
# Script to upload to github
#

DIRECTORY=`pwd`
CONTINUE="y"

echo "Would you like to upload the following directory: $DIRECTORY? \n"
echo "Y/n"

#get input
read CONTINUE

#convert response to lowercase
#grep -i $CONTINUE
echo $CONTINUE | tr [:upper:] [:lower:]

echo $CONTINUE

if [ $CONTINUE != "y" ]
	then exit
fi

echo "Made it!"

#Add any files in the directory to GIT
git add .

#Commit
echo "Please enter a commit message"
read COM_MESSAGE

echo "Starting Commit"
echo "==============="

git commit -m "$COM_MESSAGE" -a -v

echo "==============="

#Push the commits to github
git push

exit
