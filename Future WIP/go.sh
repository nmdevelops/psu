#!/bin/bash

#! make scripts executable
chmod +x setup-solo.sh
chmod +x setup-pair-initial.sh
chmod +x setup-pair-subsequent.sh

#! Choose script to run
echo ""
read -p "Are you pair coding today? (y/n)  :  " codePair
if [[ $codePair = y ]]; then
  read -p "Do you need to set-up a .pairs file? (y/n)  :  " needPairs
  if [[ $needPairs ]]; then
    ./setup-pair-initial.sh
  elif [[ $needPairs = n ]]; then
    ./setup-pair-subsequent.sh
  fi

elif [[ $codePair = n ]]; then
  ./setup-solo.sh

fi
