#!/bin/bash
#command crontab
#0 * * * * /home/kali/sisoptest/aggregate_minute_to_hourly.sh

cd ~/log

time_hour=$(date -d '1 hour ago' "+%Y%m%d%H")

ls metrics_"$time_hour"*.log | while read logfile; do awk 'NR==2' "$logfile"; done > temp.log

max1=$(awk -F ','  '{print $1}' temp.log | sort -n | tail -n 1)
max2=$(awk -F ','  '{print $2}' temp.log | sort -n | tail -n 1)
max3=$(awk -F ','  '{print $3}' temp.log | sort -n | tail -n 1)
max4=$(awk -F ','  '{print $4}' temp.log | sort -n | tail -n 1)
max5=$(awk -F ','  '{print $5}' temp.log | sort -n | tail -n 1)
max6=$(awk -F ','  '{print $6}' temp.log | sort -n | tail -n 1)
max7=$(awk -F ','  '{print $7}' temp.log | sort -n | tail -n 1)
max8=$(awk -F ','  '{print $8}' temp.log | sort -n | tail -n 1)
max10=$(awk -F ','  '{print $10}' temp.log | sort -n | tail -n 1)
maximum=$(echo "maximum,$max1,$max2,$max3,$max4,$max5,$max6,$max7,$max8,$max10")

min1=$(awk -F ','  '{print $1}' temp.log | sort -n | head -n 1)
min2=$(awk -F ','  '{print $2}' temp.log | sort -n | head -n 1)
min3=$(awk -F ','  '{print $3}' temp.log | sort -n | head -n 1)
min4=$(awk -F ','  '{print $4}' temp.log | sort -n | head -n 1)
min5=$(awk -F ','  '{print $5}' temp.log | sort -n | head -n 1)
min6=$(awk -F ','  '{print $6}' temp.log | sort -n | head -n 1)
min7=$(awk -F ','  '{print $7}' temp.log | sort -n | head -n 1)
min8=$(awk -F ','  '{print $8}' temp.log | sort -n | head -n 1)
min10=$(awk -F ','  '{print $10}' temp.log | sort -n | head -n 1)
minimum=$(echo "minimum,$min1,$min2,$min3,$min4,$min5,$min6,$min7,$min8,$min10")

avg1=$(awk -F ',' '{sum += $1; count++} END {print sum/count}' temp.log)
avg2=$(awk -F ',' '{sum += $2; count++} END {print sum/count}' temp.log)
avg3=$(awk -F ',' '{sum += $3; count++} END {print sum/count}' temp.log)
avg4=$(awk -F ',' '{sum += $4; count++} END {print sum/count}' temp.log)
avg5=$(awk -F ',' '{sum += $5; count++} END {print sum/count}' temp.log)
avg6=$(awk -F ',' '{sum += $6; count++} END {print sum/count}' temp.log)
avg7=$(awk -F ',' '{sum += $7; count++} END {print sum/count}' temp.log)
avg8=$(awk -F ',' '{sum += $8; count++} END {print sum/count}' temp.log)
avg10=$(awk -F ',' '{sum += $10; count++} END {print sum/count}' temp.log)
average=$(echo "average,$avg1,$avg2,$avg3,$avg5,$avg6,$avg7,$avg8,$avg10")

echo "type,mem_total,mem_used,mem_free,mem_shared,mem_buff,mem_available,swap_total,swap_used,swap_free,path,path_size" > metrics_agg_"$time_hour".log
echo "$minimum" >> metrics_agg_"$time_hour".log
echo "$maximum" >> metrics_agg_"$time_hour".log
echo "$average" >> metrics_agg_"$time_hour".log

rm temp.log

chmod 400 metrics_agg_"$time_hour".log
