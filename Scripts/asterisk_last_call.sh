#!/bin/bash

# Get last caller number from queue

# Path to the queue log
log="/var/log/asterisk/queue_log"

# Number of the queue. Change it!
queue=1192

sleep 1
cmd=$(cat $log | grep $queue)
if [ $? == 0 ]; then
	number=$(echo "${cmd}" | grep "ENTERQUEUE" | tail -n1 | sed 's\|\ \g' | awk '{print $6}')
	echo $number
else
	echo ERROR
fi
