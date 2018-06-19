#!/bin/bash

# Get a number of waiting clients from the queue

# Number of the queue. Need to change
queue=1192

cmd=$(asterisk -rx "queue show $queue" | grep -A 10 Callers: | wc -l);
if [ "$cmd" -ge 3 ]; then
        let queue=$cmd-2
        echo $queue
else
        echo $cmd
fi


