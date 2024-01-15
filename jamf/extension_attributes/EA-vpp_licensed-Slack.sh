#!/bin/sh

## About ##
# 
# A macOS script that can be used as a Jamf Extension Attribute to determine if the the installed Slack app on 
# a Mac is VPP Licensed (downloaded/installed from the Mac App Store)
# 
# Data Type: String
#
# Input Type: Script 
#
VPPtest=`mdls /Applications/ApplicationName -name kMDItemAppStoreReceiptIsVPPLicensed | cut -d = -f 2 | xargs`

[[ "$VPPtest" == "1" ]] && echo "<result>VPP Licensed</result>" || echo "<result>Not VPP Licensed</result>"
