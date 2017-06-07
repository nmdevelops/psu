#!/bin/bash


#! Insert read prompt for testing before adding to set-up
cd ~/desktop
echo $(date)
read -p "Name the Project.  :" projectName
#! test prompt above
echo ""
mkdir $projectName
echo "Project Named $projectName Created"
#! test location Created

cd ~/desktop
cp psu/README.md ~/desktop/$projectName/README.md
cd ~/desktop/$projectName
#! Prompts for user data
#read -p "First Pair Name (First Last):   " pairOneName
#read -p "First Pair Email (nm.develops@gmail.com) :   " pairOneEmail
#read -p "Second Pair Name (First Last):   " pairTwoName
#read -p "Second Pair Email (nm.develops@gmail.com) :   " pairTwoEmail
#!NEW prompts to merge into routine
read -p "Brief Application Description  :   " applicationSummary
read -p "Detiled Application Description  :   " detailedDescription
#! Modify copied README.md file to user data
sed -i "s/{Application Name}/$projectName/g" README.md
sed -i "s/{Brief description of application}/$applicationSummary/g" README.md
sed -i "s/{Date of current version}/$(date)/g" README.md
sed -i "s/{List of contributors}/$pairOneName, and $pairTwoName/g" README.md
sed -i "s/{This is a detailed description of your application. Its purpose and usage.  Give as much detail as needed to explain what the application does, and any other information you want users or other developers to have. }/$detailedDescription/g" README.md
sed -i "s/{support}/$pairOneEmail or $pairTwoEmail/g" README.md
sed -i "s/{List of contributors or company name}/$pairOneName, $pairTwoName/g" README.md

read -p "Type of License (MIT or GPL)" licenseType
if [[ $licenseType = MIT ]]; then
  sed -i "s/{Determine the license under which this application can be used.  See below for more details on licensing.}/This software is licensed under the MIT license./g" README.md

elif [[ $licenseType = GPL ]]; then
  sed -i "s/{Determine the license under which this application can be used.  See below for more details on licensing.}/This software is licensed under the GPL license./g" README.md

fi
atom  README.md
echo "The README rough draft is ready for updating"
