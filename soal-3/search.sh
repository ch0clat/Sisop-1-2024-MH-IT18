#!/bin/bash

find genshin_character/ -maxdepth 2 -type f| while read -r file; do
steghide extract -sf "$file" -p "" -xf temp.txt 2>&1
decrypted_txt=$(base64 -d temp.txt)


	if [[ $decrypted_txt = *'https'* ]]; then
		wget "$decrypted_txt" -O hidden_image.jpg
		echo "$decrypted_txt" > decrypted_url.txt
		echo "[$(date "+%d/%m/%y %H:%M:%S")] [FOUND] [$file]" >> image.log
		rm temp.txt
		break
	else
		echo "[$(date "+%d/%m/%y %H:%M:%S")] [NOT FOUND] [$file]" >> image.log
		rm temp.txt
		sleep 1
	fi
	done

