#!/bin/bash

# Get a number of busy operators from the queue.

# Number of the queue. Need to change
queue=1192

using=$(asterisk -rx "queue show $queue" | grep "In use" | wc -l)
if [ $? == 0 ]; then
	echo $using
else
        echo 0
fi
