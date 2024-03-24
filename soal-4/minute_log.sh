#!/bin/bash
#* * * * * untuk mengatur running setiap menit dilanjut dengan directory script
#* * * * * /home/ch0clat/sisoptest/minute_log.sh
set -e

memory_data=$(free -m|awk 'NR==2 {print $2,$3,$4,$5,$6}' |tr ' ' ',' )
swap_data=$(free -m|awk 'NR==3 {print $2,$3,$4}' |tr ' ' ',' )
directory_data=$(du -sh ~/. |awk '{print $2,$1}' |tr ' ' ',')

time_stamp=$(date "+%Y%m%d%H%M%S")

echo "$memory_data,$swap_data,$directory_data" > ~/log/"$time_stamp.log"
