#!/bin/bash
################################################################
# Project       : GENERIC                                      #
# Description   : Script to Monitor Disk I/O Utilization       #
#                                                              #
# Originated by : VAISHNAV PP  [https://github.com/Y2kz]       #
# Date          : 11-07-2025                                   #
################################################################
source /etc/profile

# Thresholds
OK_THRESHOLD=10
MINOR_THRESHOLD=30
CRITICAL_THRESHOLD=70

# Get total %util excluding dm- devices
UTIL=$(iostat -x | awk '/^[a-z]/ && $1 !~ /^dm-/ { sum += $(NF) } END { printf "%.2f\n", sum }')

# Check thresholds using bc and grep in-place
if echo "$UTIL >= $CRITICAL_THRESHOLD" | bc -l | grep -q 1; then
    echo "CRITICAL - Disk I/O Utilization at ${UTIL}%"
    exit 2
elif echo "$UTIL >= $MINOR_THRESHOLD" | bc -l | grep -q 1; then
    echo "WARNING - Disk I/O Utilization at ${UTIL}%"
    exit 1
elif echo "$UTIL >= $OK_THRESHOLD" | bc -l | grep -q 1; then
    echo "OK - Disk I/O Utilization at ${UTIL}%"
    exit 0
else
    echo "OK - Very Low Disk I/O Utilization at ${UTIL}%"
    exit 0
fi
