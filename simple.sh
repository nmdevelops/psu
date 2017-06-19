#!/bin/bash
#! For solo project set-up
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
cp psu/source/jquery-3.2.1.js $projectName/js/jquery-3.2.1.js
cp psu/source/bootstrap.css $projectName/css/bootstrap.css
cp psu/source/README.md $projectName/README.md
cp psu/source/index.html $projectName/index.html

echo "Bootstrap and JQuery Installed"
echo ""
echo "Boilerplate files addedm README and index"
echo ""
echo "Script complete."
