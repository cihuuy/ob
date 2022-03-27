#! /bin/bash
printf "clear memory... \nThis might take a while... " >&2
{
# Note, we are using "echo 3", but it is not recommended in production instead use "echo 1"
free && sync && echo 3 > /proc/sys/vm/drop_caches && free
}
