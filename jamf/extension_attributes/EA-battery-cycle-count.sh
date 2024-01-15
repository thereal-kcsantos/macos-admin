#!/bin/sh
# 
# Data Type: Integer
# Input Type: Script

cycleCount=$( ioreg -l | grep "CycleCount" | grep -v Battery | grep -v Design | sed 's/.*=//' | awk -F ' ' '{print $1}')

echo "<result>${cycleCount}</result>"
