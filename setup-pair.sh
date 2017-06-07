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
cd ~/desktop
cp psu/.pairs ~/.pairs
cd ~
#! Prompts for user data
read -p "First Pair Initials (lower case) :   " pairOne
read -p "First Pair Name (First Last):   " pairOneName
read -p "First Pair Email (nm.develops@gmail.com) :   " pairOneEmail
read -p "Second Pair Initials (lower case) :   " pairTwo
read -p "Second Pair Name (First Last):   " pairTwoName
read -p "Second Pair Email (nm.develops@gmail.com) :   " pairTwoEmail
#! Modify copied .pairs file to user data
sed -i "s/pairOne:/$pairOne:/g" .pairs
sed -i "s/pairOneName/$pairOneName:/g" .pairs
sed -i "s/pairOneEmail/$pairOneEmail:/g" .pairs
sed -i "s/pairTwo:/$pairTwo:/g" .pairs
sed -i "s/pairTwoName/$pairTwoName:/g" .pairs
sed -i "s/pairTwoEmail/$pairTwoEmail:/g" .pairs
#! verify .pairs
#!atom .pairs
cd desktop/$answer
git pair $pairOne $pairTwo
echo ""
echo "Set-up Complete."
