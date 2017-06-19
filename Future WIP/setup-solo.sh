#!/bin/bash

#! For solo project set-up
cd ~/desktop
echo ""
read -p "Name the Project.  :  " projectName
echo ""
read -p "Enter User Name (First Last)  :  " userName
echo ""
read -p "Enter User Email (user@domain.com)  :  " userEmail
echo ""
mkdir $projectName
echo "Project Named $projectName Created"
echo ""
mkdir $projectName/css $projectName/img $projectName/js
echo "Folder Structure Created"
echo ""
touch $projectName/index.html $projectName/css/styles.css $projectName/js/scripts.js
echo "Empty Base Files Created"
echo ""
cp psu/jquery-3.2.1.js $projectName/js/jquery-3.2.1.js
cp psu/bootstrap.css $projectName/css/bootstrap.css
echo "Bootstrap and JQuery Installed"
echo ""
#! Begin README routine
cp psu/README.md ~/desktop/$projectName/README.md
cd ~/desktop/$projectName
#! Prompts for user data
read -p "Brief Application Description  :   " applicationSummary
echo ""
read -p "Detailed Application Description  :   " detailedDescription
#! Modify copied README.md file to user data
sed -i "s/{Application Name}/$projectName/g" README.md
sed -i "s/{Brief description of application}/$applicationSummary/g" README.md
sed -i "s/{Date of current version}/$(date)/g" README.md
sed -i "s/{List of contributors}/$userName/g" README.md
sed -i "s/{This is a detailed description of your application. Its purpose and usage.  Give as much detail as needed to explain what the application does, and any other information you want users or other developers to have. }/$detailedDescription/g" README.md
sed -i "s/{support}/$userEmail/g" README.md
sed -i "s/{List of contributors or company name}/$userName/g" README.md
echo ""
#! Conditional to modify licensing statement in README
read -p "Type of License (MIT or GPL)  :  " licenseType
if [[ $licenseType = MIT ]]; then
  sed -i "s/{Determine the license under which this application can be used.  See below for more details on licensing.}/This software is licensed under the MIT license./g" README.md

elif [[ $licenseType = GPL ]]; then
  sed -i "s/{Determine the license under which this application can be used.  See below for more details on licensing.}/This software is licensed under the GPL license./g" README.md

fi

echo ""
echo "The README rough draft is ready for updating"
echo ""
echo "Project is set-up"
echo ""
#!cd ~/desktop/$projectName
git init
 git config --global user.name "$userName"
 git config --global user.email $userEmail
echo ""
echo "GIT is set-up"
echo ""
echo "User :  "
git config user.name
echo ""
echo "User Email :  "
git config user.email
#! Launch in atom?
echo ""
read -p "Do you want to launch the project in Atom? (y/n)  :  " atomLaunch
if [[ $atomLaunch = y ]]; then
  atom .

fi
