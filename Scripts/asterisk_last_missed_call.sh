#!/bin/bash

# Get last missed call from queue

# Path to the queue log
log="/var/log/asterisk/queue_log"

# Number of the the queue. Need to change it
queue=1192

cmd=$(cat $log | grep $queue )
if [ $? == 0 ]; then
	id=$(echo "${cmd}" | grep ABANDON | tail -n1 | sed 's\|\ \g' | awk '{print $2}' | sed 's/\./ /g' | awk '{print $2}' )
	number=$(echo "${cmd}" | grep $id | grep ENTERQUEUE | sed 's\|\ \g' | awk '{print $6}')
	echo $number
else
	echo ERROR
fi
