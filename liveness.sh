#!/bin/bash

counter_file="/mnt/restart_counter.txt"
file_to_check="/temp/healthy.txt"

# initialize counter to 0 if the counter file does not exist
liveness_probe() {
    if [ ! -f $counter_file ]; then
        echo 0 > $counter_file
    fi

    # check if file exists
    if [ ! -f $file_to_check ]; then
        # increment counter and update counter file
        counter=$(cat $counter_file)
        counter=$((counter+1))
        echo $counter > $counter_file
        return 1
    else
        return 0
    fi

}

liveness_probe