#!/bin/bash
cd ..
mkdir project
echo "Project Created"
mkdir project/css project/img project/js
echo "Folder Structure Created"
touch project/index.html project/css/styles.css project/js/scripts.js
echo "Empty Base Files Created"
cp psu/jquery-3.2.1.js project/js/jquery-3.2.1.js
cp psu/bootstrap.css project/css/bootstrap.css
echo "Bootstrap and JQuery Installed"
echo "Project is set-up"
cp psu/.pairs ~/.pairs
cd ~
atom .pairs
cd desktop
echo "1 - Edit pair info"
echo "2 - Rename Project"
echo "3 - cd project_name"
echo "Enjoy :-)"
