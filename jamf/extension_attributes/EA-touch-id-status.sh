#!/bin/bash

##### About #####
#
# Check to see if TouchID is enabled. If enabled, grabs the UID of the user and the
# number of Fingerprints enrolled.
#
#### Configuration ####
#
# Data Type: Sting
# Input Type: Script
#

touchIDstatus=$( sudo bioutil -s -c | sed 's/Operation performed successfully.//g' )

if [ "$touchIDstatus" != "There are no fingerprints in the system." ]; then
	echo "<result>$touchIDstatus</result>"
else
	echo "<result>Not configured</result>"
fi
