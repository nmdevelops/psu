#!/bin/bash

#! For solo project set-up
cd ~/desktop
read -p "Name the Project.  :" answer
echo ""
mkdir $answer
echo "Project Named $answer Created"
echo ""
mkdir $answer/css $answer/img $answer/js
echo "Folder Structure Created"
echo ""
touch $answer/index.html $answer/css/styles.css $answer/js/scripts.js
echo "Empty Base Files Created"
echo ""
cp psu/jquery-3.2.1.js $answer/js/jquery-3.2.1.js
cp psu/bootstrap.css $answer/css/bootstrap.css
echo "Bootstrap and JQuery Installed"
echo ""
echo "Project is set-up"
echo ""
cd ~/desktop/$answer
git init
echo ""
read -p "Enter User Name (First Last)    " userName
read -p "Enter User Email (user@domain.com)    " userEmail
echo ""
 git config --global user.name "$userName"
 git config --global user.email $userEmail
