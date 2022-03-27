#! /bin/bash
printf "clear memory... \nThis might take a while... " >&2
{
# Note, we are using "echo 3", but it is not recommended in production instead use "echo 1"
timeout -k 120s 10s swapoff -a && swapon -a && printf "clear memory 1... \nThis might take a while... " >&2
timeout -k 120s 60s swapoff -a && swapon -a && printf "clear memory 2... \nThis might take a while... " >&2
}
