#!/bin/bash

##### About #####
#
# Get boottime in epoch time, convert to Jamf Pro formatted time and make an extension attribute
#
### Configuration ###
#
# Data Type: Date (YYYY-MM-DD hh:mm:ss)
# Input Type: Script
#

bootTime=$(sysctl kern.boottime | awk '{print $5}' | tr -d ,)
formattedTime=$(date -jf %s $bootTime "+%F %T")
echo "<result>${formattedTime}</result>"

exit 0
