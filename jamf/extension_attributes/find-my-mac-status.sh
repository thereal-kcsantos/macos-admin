!/bin/bash

##### About #####
#
# This EA will check if "Find My Mac" is enabled. 
# If Find My Mac is enabled, it will return "Enabled". If not, "Disabled"
#
## EA Configuration ##
#
# Data Type: String
# Input Type: Script
#

fmmToken=$(/usr/sbin/nvram -x -p | /usr/bin/grep fmm-mobileme-token-FMM)

if [ -z "$fmmToken" ];
then echo "<result>Disabled</result>"
else echo "<result>Enabled</result>"
fi
