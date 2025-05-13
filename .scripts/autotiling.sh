#!/bin/bash

instance_count=$(pgrep autotiling | wc -l)

if [ $instance_count -ge 1 ]; then
    exit;
fi

autotiling &
