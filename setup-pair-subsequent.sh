#!/bin/bash

#! For pair project set-up
echo "In the future this will read values from the .pairs file to minimize data re-entry, currently it only disables .pairs file creation."
cd ~/desktop
echo ""
read -p "Name the Project.  :  " projectName
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
echo "Project is set-up"
echo ""
cd ~/desktop/$projectName
git init
echo ""
cd ~/desktop
#! Begin README routine
cp psu/README.md ~/desktop/$projectName/README.md
cd ~/desktop/$projectName
#! Prompts for user data
read -p "First Pair Initials (lower case) :   " pairOne
echo ""
read -p "First Pair Name (First Last):   " pairOneName
echo ""
read -p "First Pair Email (nm.develops@gmail.com) :   " pairOneEmail
echo ""
read -p "Second Pair Initials (lower case) :   " pairTwo
echo ""
read -p "Second Pair Name (First Last):   " pairTwoName
echo ""
read -p "Second Pair Email (nm.develops@gmail.com) :   " pairTwoEmail
echo ""
#!NEW prompts to merge into routine
read -p "Brief Application Description  :   " applicationSummary
echo ""
read -p "Detailed Application Description  :   " detailedDescription
echo ""
#! Modify copied README.md file to user data
sed -i "s/{Application Name}/$projectName/g" README.md
sed -i "s/{Brief description of application}/$applicationSummary/g" README.md
sed -i "s/{Date of current version}/$(date)/g" README.md
sed -i "s/{List of contributors}/$pairOneName, and $pairTwoName/g" README.md
sed -i "s/{This is a detailed description of your application. Its purpose and usage.  Give as much detail as needed to explain what the application does, and any other information you want users or other developers to have. }/$detailedDescription/g" README.md
sed -i "s/{support}/$pairOneEmail or $pairTwoEmail/g" README.md
sed -i "s/{List of contributors or company name}/$pairOneName, $pairTwoName/g" README.md
read -p "Type of License (MIT or GPL)  :  " licenseType
if [[ $licenseType = MIT ]]; then
  sed -i "s/{Determine the license under which this application can be used.  See below for more details on licensing.}/This software is licensed under the MIT license./g" README.md

elif [[ $licenseType = GPL ]]; then
  sed -i "s/{Determine the license under which this application can be used.  See below for more details on licensing.}/This software is licensed under the GPL license./g" README.md

fi
#! Begin .pairs routine
cd ~/desktop
#cp psu/.pairs ~/.pairs
cd ~
#! Modify copied .pairs file to user data
#sed -i "s/pairOne:/$pairOne:/g" .pairs
#sed -i "s/pairOneName/$pairOneName:/g" .pairs
#sed -i "s/pairOneEmail/$pairOneEmail:/g" .pairs
#sed -i "s/pairTwo:/$pairTwo:/g" .pairs
#sed -i "s/pairTwoName/$pairTwoName:/g" .pairs
#sed -i "s/pairTwoEmail/$pairTwoEmail:/g" .pairs
#!verify .pairs
#atom .pairs
cd desktop/$projectName
git pair $pairOne $pairTwo
echo ""
echo "Set-up Complete."
echo ""
read -p "Do you want to launch the project in Atom? (y/n)  :  " atomLaunch
if [[ $atomLaunch = y ]]; then
  atom .

fi
