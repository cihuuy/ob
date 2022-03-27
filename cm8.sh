#! /bin/bash
printf "cek file... \nThis might take a while... " >&2
{
sync; echo 3 > /proc/sys/vm/drop_caches && free
}
