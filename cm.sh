#! /bin/bash
printf "clear memory... \nThis might take a while... " >&2
{
# Note, we are using "echo 3", but it is not recommended in production instead use "echo 1"
echo "echo 3 > timeout -k 30s 30s /proc/sys/vm/drop_caches"
echo "echo 3 > timeout -k 30s 60s /proc/sys/vm/drop_caches"
}
