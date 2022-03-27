#! /bin/bash
printf "clear memory... \nThis might take a while... " >&2
{
# Note, we are using "echo 3", but it is not recommended in production instead use "echo 1"
timeout -k 240s 10s swapoff -a && swapon -a 
timeout -k 240s 10s swapoff -a && swapon -a
}
