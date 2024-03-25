#!/bin/bash
#* * * * * untuk mengatur running setiap menit dilanjut dengan directory script
#* * * * * /home/ch0clat/sisoptest/minute_log.sh
set -e

memory_data=$(free -m|awk 'NR==2 {print $2,$3,$4,$5,$6}' |tr ' ' ',' )
swap_data=$(free -m|awk 'NR==3 {print $2,$3,$4}' |tr ' ' ',' )
directory_data=$(du -sh ~/. |awk '{print $2,$1}' |tr ' ' ',')

time_stamp=$(date "+%Y%m%d%H%M%S")
hour_time=$(date "+%M")

echo "mem_total,mem_used,mem_free,mem_shared,mem_buff,mem_available,swap_total,swap_used,swap_free,path,path_size" > ~/log/"metrics_$time_stamp.log"
echo "$memory_data,$swap_data,$directory_data" >> ~/log/"metrics_$time_stamp.log"
chmod 400 ~/log/"metrics_$time_stamp".log 
