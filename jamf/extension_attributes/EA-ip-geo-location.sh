#!/bin/sh

##### About #####
#
# This EA will grab the Mac's latest WAN IP and convert it to a location:
# Location Format: City, State - countryCode
#
#### Configuration ####
# 
# Input Type: String
# Data Type: Script
#

myIP=`/usr/bin/curl http://ifconfig.me/ip`
myLocationInfo=`/usr/bin/curl http://ip-api.com/xml/$myIP`

mycountryCode=`echo $myLocationInfo|egrep -o '<countryCode>.*</countryCode>'| sed -e 's/^.*<countryCode/<countryCode/' | cut -f2 -d'>'| cut -f1 -d'<'`
mycity=`echo $myLocationInfo|egrep -o '<city>.*</city>'| sed -e 's/^.*<city/<city/' | cut -f2 -d'>'| cut -f1 -d'<'`
myregionName=`echo $myLocationInfo|egrep -o '<regionName>.*</regionName>'| sed -e 's/^.*<regionName/<regionName/' | cut -f2 -d'>'| cut -f1 -d'<'`

echo "<result>$mycity, $myregionName - $mycountryCode</result>"
