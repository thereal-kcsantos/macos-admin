#!/bin/bash

#Installs Rosetta 2, if needed.

#Finds what cpu chip the computer has installed.
CPU=$(sysctl -n machdep.cpu.brand_string)

#This variable is the exit status of the executed command ($?). The value 0 = success.
Result=""

#This is a Rosetta file that has a haiku. No idea why it is installed, but cool.
RosettaFile=/Library/Apple/usr/share/rosetta/rosetta

#If CPU is Intel, does NOT install Rosetta.
##If CPU is Apple, DOES install Rosetta.
if [[ "$CPU" =~ ^.*"Intel".*$ ]]
  then echo "Intel processor - No need to install Rosetta."
  Result=$?
elif [[ ! -f "$RosettaFile" && "$CPU" =~ ^.*"Apple".*$ ]]
  then softwareupdate --install-rosetta --agree-to-license
  Result=$?
elif [[ -f "$RosettaFile" && "$CPU" =~ ^.*"Apple".*$ ]]
  then echo "Rosetta already installed."
  cat "$RosettaFile"
  Result=$?
fi

#Did it work?
if [[ "$Result" -ne 0 ]]
  then echo "Rosetta installation failed!"
  Result=1
fi

exit $Result
