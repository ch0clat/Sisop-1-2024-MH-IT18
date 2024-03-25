# Sisop-1-2024-MH-IT18

<!-- Contoh per soal -->
## Soal 1

   ```sh
   # $2: Order Date || $6: Buyer's name || $14: Category || $17: Sales || $20: Profit <-- SECTIONS USED

  echo DOWNLOAD FILE MENGGUNAKAN COMMAND WGET 
  wget --no-check-certificate 'https://drive.google.com/uc?export=download&id=1cC6MYBI3wRwDgqlFQE1OQUN83JAreId0' -O Sandbox.cs
   ```
Disini maksud dari komen $2, $6 dan seterusnya adalah untuk memudahkan reader dalam membaca kode yang akan muncul.
 wget: mengdownload
 --no-check-certificate: Dipakai agar tidak ribet dalam mengecek file :v (takes less time to download, but high in potential risks)
 -O: Mengontrol nama file dari link yang di download

  ```sh
   echo CEK KEBERADAAN FILE DENGAN LS
   ls 
   ```
Dibawah command ls akan terlihat ada file apa saja. File Sandbox.csv akan terlihat ada diantara kerumunan tersebut.

 ```sh
   echo MELIHAT ISI FILE CSV DENGAN CAT
   cat Sandbox.csv 
   ```
cat digunakan untuk mengeprint isi csv

 ```sh
echo MENDAPATKAN BUYER DENGAN SALES TERTINGGI 
awk -F ',' 'NR > 1  {sales[$6] += $17; if (sales[$6] > highest_sales) highest_sales = sales[$6]} END {for (buyer in sales) if (sales[buyer] == highest_sales) print buyer, sales[buyer]}' Sandbox.csv 
 ```
`awk`: Command untuk melakukan script AWK (mencari sebuah string atau a certain pattern yang diinput setelahnya)
`-F ','`: Field separator. Menyuruh script awk untuk mengseparate hasil2nya
`NR > 1`: `NR` stands for "Number of Records". Script ini akan membuat program hanya mencari dibawah Header
`{sales[$6] += $17; if (sales[$6] > highest_sales) highest_sales = sales[$6]}`: Kumpulan kode ini melakukan:
   - Calculates the total sales dari para buyer (`$6`) Dengan menambahkan jumlah sales kepada elemen array `sales`.
   - Mengecek apakah current sales (sales yang lagi dicek) itu bener2 max atau nggak. Misal B > A, maka yang diprint A.
`END`: keyword ini memberitahu untuk melanjutkan code setelahnya setelah code sebelumnya selesai semua.
`{for (buyer in sales) if (sales[buyer] == highest_sales) print buyer, sales[buyer]}`: Kumpulan code ini diexecute setelah code sebelum 'END' selesai. Kumpulan kode ini akan di-repeat hingga selesai yang kemudian dimasukkan ke array 'sales',  lalu mengeprint buyer dengan highest sales. (Menggunakan semacam loop dengan for, if)

```sh
echo BUYER DENGAN LOWEST PROFIT 
awk -F ',' 'NR > 1 {profits[$6] += $20; if (profits[$6] < lowest_profit || lowest_profit == "") lowest_profit = profits[$6]} END {for (buyer in profits) if (profits[buyer] == lowest_profit) print buyer, profits[buyer]}' Sandbox.csv 
```
Kurang lebih mirip command sebelumnya. Bedanya menggunakan lowest_profit == "" untuk memastikan bahwa angkanya positif, dan bukan minus. Serta menggunakan blank karena kita tidak mengetahui lowest profit.

 ```sh
echo TOP 3 CATEGORIES WITH HIGHEST PROFIT
awk -F ',' 'NR > 1 {profits[$14] += $20} END {PROCINFO["sorted_in"] = "@val_num_desc"; for (category in profits) {if (length(top_categories) < 3 || profits[category] >= profits[top_categories[3]]) {top_categories[category] = profits[category]; delete top_categories[min_category]}} for (category in top_categories) print category, profits[category]}' Sandbox.csv
 ```
Agak mirip pada beberapa command, kecuali pada:
`END {PROCINFO["sorted_in"] = "@val_num_desc"; ...}`: Karena dimulai dengan END, maka command ini dilakukan setelah semua command sebelumnya selesai dilakukan. 
PROCINFO: sebuah array dari awk yang special bult untuk membuat descending order dari "@val_num_desc" (value number descend). Jadi dimulai dari paling besar ke paling kecil.
`for (category in profits) {if (length(top_categories) < 3 || profits[category] >= profits[top_categories[3]]) {top_categories[category] = profits[category]; delete top_categories[min_category]}}`: 
 - Loop ini berjalan untuk semua text pada array category. Ini akan mendapat top 3 category yang paling banyak profitnya.
 - Kalau panjang dari top_categories kurang dari tiga, atau bahkan lebih, makan akan diupdate posisi ke 3 nya. 
 - Misal ada yang lebih besar dari yang sebelumnya, maka akan diisi oleh yang lebih besar tersebut.

  ```sh
  echo NYARI ADRIAENS + Date Purchase + Quantity of Items
  echo Data Adriaens secara full
  awk '/Adriaens/ {print}' Sandbox.csv
  ```
'/Adriaens/ : Ini yang dicari menggunakan script awk tadi
{print}' : Mengeprint hasil

```sh
echo Date Purchase + Quantity of Items dari Adriaens
grep 'Adriaens' Sandbox.csv | awk -F ',' '{print $2, $6, $17}' 
```
grep: 
'{print $2, $6, $17}' 





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
