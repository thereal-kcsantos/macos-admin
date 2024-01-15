#!/bin/zsh

##### About ######
#
# EA to loop around all user accounts and show first logged in iCloud user
#
#### Configuration ####
# 
# Data Type: String
# Input Type: Script
#

accounts=false

while read useraccount;
do
	file="/Users/$useraccount/Library/Preferences/MobileMeAccounts.plist"

	[ -f "$file" ] && appleid=$( /usr/libexec/PlistBuddy -c "print :Accounts:0:AccountID" "$file" 2>/dev/null )

	[ ! -z "$appleid" ] && { echo "<result>$appleid</result>"; accounts=true; break; }

done < <( /usr/bin/dscl . list /Users UniqueID | awk '$2 > 500 {print $1}' )

[ "$accounts" = "false" ] && echo "<result>Not Configured</result>"

exit
