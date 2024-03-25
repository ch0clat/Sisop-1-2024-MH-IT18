# Sisop-1-2024-MH-IT18

<!-- Contoh per soal -->
## Soal 1

   ```sh
   git clone https://github.com/your_username_/Project-Name.git
   ```
Jelasin bla" balaaa

<!-- Contoh per soal -->
## Soal 2

   ```sh
   git clone https://github.com/your_username_/Project-Name.git
   ```
Jelasin bla" balaaa

## Soal 3

### Awal.sh
   ```sh
   #!/bin/bash
   set -e
   wget 'https://drive.google.com/uc?export=download&id=1oGHdTf4_76_RacfmQIV4i7os4sGwa9vN' -O genshin.zip
   unzip genshin.zip
   unzip genshin_character.zip
   cd genshin_character
   ```
Disini kita menggunakan set -e sebagai precaution terhadap kemungkinan error. script di awali dengan mendownload file genshin.zip dengan menggunakan wget lalu mengunzip genshin.zip dan genshin_character.zip. sesudah itu berpindah directory menuju genshin_character untuk melakukan loop dekripsi dan pegantian format nama setiap file jpg.
   ```sh
   ls | while read -r filename ; do
	decrypted=$(echo "$filename" | xxd -r -p)
	cd ..
	attribute=$(grep "$decrypted" list_character.csv | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
	cd genshin_character
	attribute=$(echo "$attribute" | cut -d ',' -f 2-)
	elemen_s=$(echo "$attribute" | cut -d ',' -f 2-| tr ',' '_')
	region=$(echo "$attribute" | cut -d ',' -f 1)
	decrypted=$(echo "$decrypted" | tr ' ' '-')
	new_filename="${region}_${decrypted}_${elemen_s}"
	mv "$filename" "$new_filename.jpg"
	directory="/home/ch0clat/sisoptest/genshin_character/$region/"
	mkdir -p "$region"
	mv "$new_filename.jpg" "$region/"
   done
   ```
Di atas kita melakukan ls dilanjutkan dengan while loop yang akan berjalan sampai semua file di dalam directory genshin_character terbaca. setelah itu di lanjutkan dengan dekripsi hex menggunakan command xxd. setelah nama file terdekripsi command cd memindahkan directory ke parent directory dan membaca list_character.csv tanpa menyimpan white spaces yang ada di dalam setiap line ke dalam variable attribute. selanjutnya balik ke directory genshin_character dan menggatur format nama file yang baru. cut digunakan untuk menghapus character yang di temukan setelah ','. tr digunakan untuk mengubah ',' menjadi '_' dan mengubah nama character yang memiliki space diganti menjadi '-'. selanjutnya menyimpan format nama baru ke dalam vairabel new_filename dan mengubah nama file. selanjutnya membuat directory baru sesuai nama region dengan mkdir -p. -p digunakan agar jika folder sudah terbuat tidak akan mengeluarkan error mesage. sesudah itu mv digunakan untuk memindahkan file ke dalam foler.

   ```sh
   cd ..

   echo "JUMLAH SETIAP JENIS SENJATA"

   tail -n +2 list_character.csv | awk -F ',' '{print $4}' | sed 's/^[[:space:]]*//;s/[[:space:]]*$//' |  sort | uniq -c | while read -r count word; do
      echo "$word : $count"
   done

   rm genshin_character.zip
   rm list_character.csv
   rm genshin.zip
   ```
Command cd merubah directory kembali ke parent directory. setalah itu membaca list_character.csv mulai dari line 2 dan menghitung tiap nama weapon. echo akan memberikan output nama senajata dan jumlah senjata.

   ```sh
   #!/bin/bash

   find genshin_character/ -maxdepth 2 -type f| while read -r file; do
   steghide extract -sf "$file" -p "" -xf temp.txt 2>&1
   decrypted_txt=$(base64 -d temp.txt)
   ```
   Command find akan mencari semua file yang ada di dalam genshin_character dan folder di dalamnya. Selanjutkan akan melakukan while loop dan mengextract hidden files di dalam jpg dan mengextractnya ke dalam file temp.txt. lalu dekripsi menggunakan base64 disimpan di dalam variable decrypted_txt.

   ```sh
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
   ```
Di dalam case pertama akan cek apakah text yang terdekripsi mengandung "https" dan jika mengandung "https" akan mendownload file dengan gdown, menyimpan hasil dekripsi ke dalam decrypted_url.txt, mengoutput [date] [found] [directory] ke dalam image.log dan menghentikan loop. jika tidak ada akan [date] [not found] [directory] dan remove temp.txt dan berhenti untuk 1 detik.

<!-- Contoh per soal -->
## Soal 4

   ```sh
   git clone https://github.com/your_username_/Project-Name.git
   ```
Jelasin bla" balaaa
