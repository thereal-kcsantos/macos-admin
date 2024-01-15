#!/bin/sh
VPPtest=`mdls /Applications/ApplicationName -name kMDItemAppStoreReceiptIsVPPLicensed | cut -d = -f 2 | xargs`

[[ "$VPPtest" == "1" ]] && echo "<result>VPP Licensed</result>" || echo "<result>Not VPP Licensed</result>"
