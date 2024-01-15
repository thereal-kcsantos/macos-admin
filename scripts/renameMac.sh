#!/bin/bash

# To reduce PII, this script will rename the Mac to the following format:
# Model-serialNumber. ie: [$standardIdentifier]-MBP-[serialNumber]

### To Do: ###
# In the "computerName" variable (line 27), change the "standardIdentifier" field to something you prefer to use.

model_identifier=$(system_profiler SPHardwareDataType | awk -F": " '/Model Name/ {print $2}')
serialNumber=$(system_profiler SPHardwareDataType | awk '/Serial/ {print $4}')

#  Need to define the non MacBooks options
if [[ "$model_identifier" = "MacBook Air" ]]; then
    setModel='MBA'
    echo "Device is a MacBook Air"
  elif [[ "$model_identifier" = "MacBook Pro" ]]; then
    setModel='MBP'
    echo "Device is a MacBook Pro"
  elif [[ "$model_identifier" = "MacBook" ]]; then
    setModel='MB'
    echo "Device is a MacBook"
else
    setModel='DS'
    echo "Device model unknown"
fi

computerName="standardIdentifier-$setModel-$serialNumber"

# Set the ComputerName, HostName and LocalHostName
/usr/sbin/scutil --set ComputerName "$computerName"
sleep 2

/usr/sbin/scutil --set HostName "$computerName"
sleep 2

/usr/sbin/scutil --set LocalHostName "$computerName"
sleep 2


echo "Computer has been renamed: $computerName"
sleep 1

echo "Updating inventory record in Jamf Pro"
/usr/local/bin/jamf recon


echo "Jamf inventory record updated"

echo "$computerName"

exit 0

