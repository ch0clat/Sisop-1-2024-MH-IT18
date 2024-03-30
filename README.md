# Sisop-1-2024-MH-IT18
## Anggota kelompok
   ### Callista Meyra Azizah 5027231060
   ### Abhirama Triadyatma Hermawan 5027231061
   ### Adi Satria Pangestu 5027231043


## Soal
### Soal 1
Cipung dan abe ingin mendirikan sebuah toko bernama “SandBox”, sedangkan kamu adalah manajer penjualan yang ditunjuk oleh Cipung dan Abe untuk melakukan pelaporan penjualan dan strategi penjualan kedepannya yang akan dilakukan.

Setiap tahun Cipung dan Abe akan mengadakan rapat dengan kamu untuk mengetahui laporan dan strategi penjualan dari “SandBox”. Buatlah beberapa kesimpulan dari data penjualan “Sandbox.csv” untuk diberikan ke cipung dan abe 

Karena Cipung dan Abe baik hati, mereka ingin memberikan hadiah kepada customer yang telah belanja banyak. Tampilkan nama pembeli dengan total sales paling tinggi
Karena karena Cipung dan Abe ingin mengefisienkan penjualannya, mereka ingin merencanakan strategi penjualan untuk customer segment yang memiliki profit paling kecil. Tampilkan customer segment yang memiliki profit paling kecil
Cipung dan Abe hanya akan membeli stok barang yang menghasilkan profit paling tinggi agar efisien. Tampilkan 3 category yang memiliki total profit paling tinggi 
Karena ada seseorang yang lapor kepada Cipung dan Abe bahwa pesanannya tidak kunjung sampai, maka mereka ingin mengecek apakah pesanan itu ada. Cari purchase date dan amount (quantity) dari nama adriaens

### Soal 2
Oppie merupakan seorang peneliti bom atom, ia ingin merekrut banyak peneliti lain untuk mengerjakan proyek bom atom nya, Oppie memiliki racikan bom atom rahasia yang hanya bisa diakses penelitinya yang akan diidentifikasi sebagai user, Oppie juga memiliki admin yang bertugas untuk memanajemen peneliti,  bantulah oppie untuk membuat program yang akan memudahkan tugasnya 
Buatlah 2 program yaitu login.sh dan register.sh
Setiap admin maupun user harus melakukan register terlebih dahulu menggunakan email, username, pertanyaan keamanan dan jawaban, dan password
Username yang dibuat bebas, namun email bersifat unique. setiap email yang mengandung kata admin akan dikategorikan menjadi admin 
Karena resep bom atom ini sangat rahasia Oppie ingin password nya memuat keamanan tingkat tinggi
Password tersebut harus di encrypt menggunakan base64
Password yang dibuat harus lebih dari 8 karakter
Harus terdapat paling sedikit 1 huruf kapital dan 1 huruf kecil
Harus terdapat paling sedikit 1 angka 
Karena Oppie akan memiliki banyak peneliti dan admin ia berniat untuk menyimpan seluruh data register yang ia lakukan ke dalam folder users file users.txt. Di dalam file 
tersebut, terdapat catatan seluruh email, username, pertanyaan keamanan dan jawaban, dan password hash yang telah ia buat.
Setelah melakukan register, program harus bisa melakukan login. Login hanya perlu dilakukan menggunakan email dan password.
Karena peneliti yang di rekrut oleh Oppie banyak yang sudah tua dan pelupa maka Oppie ingin ketika login akan ada pilihan lupa password dan akan keluar pertanyaan keamanan dan ketika dijawab dengan benar bisa memunculkan password
Setelah user melakukan login akan keluar pesan sukses, namun setelah seorang admin melakukan login Oppie ingin agar admin bisa menambah, mengedit (username, pertanyaan keamanan dan jawaban, dan password), dan menghapus user untuk memudahkan kerjanya sebagai admin. 
Ketika admin ingin melakukan edit atau hapus user, maka akan keluar input email untuk identifikasi user yang akan di hapus atau di edit
Oppie ingin programnya tercatat dengan baik, maka buatlah agar program bisa mencatat seluruh log ke dalam folder users file auth.log, baik login ataupun register.
Format: [date] [type] [message]
Type: REGISTER SUCCESS, REGISTER FAILED, LOGIN SUCCESS, LOGIN FAILED
Ex:
[23/09/17 13:18:02] [REGISTER SUCCESS] user [username] registered successfully
[23/09/17 13:22:41] [LOGIN FAILED] ERROR Failed login attempt on user with email [email]

## Soal 3

Alyss adalah seorang gamer yang sangat menyukai bermain game Genshin Impact. Karena hobinya, dia ingin mengoleksi foto-foto karakter Genshin Impact. Suatu saat Yanuar memberikannya sebuah Link yang berisi koleksi kumpulan foto karakter dan sebuah clue yang mengarah ke penemuan gambar rahasia. Ternyata setiap nama file telah dienkripsi dengan menggunakan hexadecimal. Karena penasaran dengan apa yang dikatakan Yanuar, Alyss tidak menyerah dan mencoba untuk mengembalikan nama file tersebut kembali seperti semula.
Alyss membuat script bernama awal.sh, untuk download file yang diberikan oleh Yanuar dan unzip terhadap file yang telah diunduh dan decode setiap nama file yang terenkripsi dengan hex . Karena pada file list_character.csv terdapat data lengkap karakter, Alyss ingin merename setiap file berdasarkan file tersebut. Agar semakin rapi, Alyss mengumpulkan setiap file ke dalam folder berdasarkan region tiap karakter
Format: Region - Nama - Elemen - Senjata.jpg
Karena tidak mengetahui jumlah pengguna dari tiap senjata yang ada di folder "genshin_character".Alyss berniat untuk menghitung serta menampilkan jumlah pengguna untuk setiap senjata yang ada
Format: [Nama Senjata] : [jumlah]
	 Untuk menghemat penyimpanan. Alyss menghapus file - file yang tidak ia gunakan, yaitu genshin_character.zip, list_character.csv, dan genshin.zip
Namun sampai titik ini Alyss masih belum menemukan clue dari the secret picture yang disinggung oleh Yanuar. Dia berpikir keras untuk menemukan pesan tersembunyi tersebut. Alyss membuat script baru bernama search.sh untuk melakukan pengecekan terhadap setiap file tiap 1 detik. Pengecekan dilakukan dengan cara meng-ekstrak sebuah value dari setiap gambar dengan menggunakan command steghide. Dalam setiap gambar tersebut, terdapat sebuah file txt yang berisi string. Alyss kemudian mulai melakukan dekripsi dengan hex pada tiap file txt dan mendapatkan sebuah url. Setelah mendapatkan url yang ia cari, Alyss akan langsung menghentikan program search.sh serta mendownload file berdasarkan url yang didapatkan.
Dalam prosesnya, setiap kali Alyss melakukan ekstraksi dan ternyata hasil ekstraksi bukan yang ia inginkan, maka ia akan langsung menghapus file txt tersebut. Namun, jika itu merupakan file txt yang dicari, maka ia akan menyimpan hasil dekripsi-nya bukan hasil ekstraksi. Selain itu juga, Alyss melakukan pencatatan log pada file image.log untuk setiap pengecekan gambar
Format: [date] [type] [image_path]
Ex: 
[24/03/20 17:18:19] [NOT FOUND] [image_path]
[24/03/20 17:18:20] [FOUND] [image_path]
Hasil akhir:
genshin_character
search.sh
awal.sh
image.log
[filename].txt
[image].jpg

## Soal 4

Stitch sangat senang dengan PC di rumahnya. Suatu hari, PC nya secara tiba-tiba nge-freeze 🤯 Tentu saja, Stitch adalah seorang streamer yang harus setiap hari harus bermain game dan streaming.  Akhirnya, dia membawa PC nya ke tukang servis untuk diperbaiki. Setelah selesai diperbaiki, ternyata biaya perbaikan sangat mahal sehingga dia harus menggunakan uang hasil tabungan nya untuk membayarnya. Menurut tukang servis, masalahnya adalah pada CPU dan GPU yang overload karena gaming dan streaming sehingga mengakibatkan freeze pada PC nya. Agar masalah ini tidak terulang kembali, Stitch meminta kamu untuk membuat sebuah program monitoring resource yang tersedia pada komputer.
Buatlah program monitoring resource pada PC kalian. Cukup monitoring ram dan monitoring size suatu directory. Untuk ram gunakan command `free -m`. Untuk disk gunakan command `du -sh <target_path>`. Catat semua metrics yang didapatkan dari hasil `free -m`. Untuk hasil `du -sh <target_path>` catat size dari path directory tersebut. Untuk target_path yang akan dimonitor adalah /home/{user}/. 
Masukkan semua metrics ke dalam suatu file log bernama metrics_{YmdHms}.log. {YmdHms} adalah waktu disaat file script bash kalian dijalankan. Misal dijalankan pada 2024-03-20 15:00:00, maka file log yang akan tergenerate adalah metrics_20240320150000.log. 
Script untuk mencatat metrics diatas diharapkan dapat berjalan otomatis pada setiap menit. 
Kemudian, buat satu script untuk membuat agregasi file log ke satuan jam. Script agregasi akan memiliki info dari file-file yang tergenerate tiap menit. Dalam hasil file agregasi tersebut, terdapat nilai minimum, maximum, dan rata-rata dari tiap-tiap metrics. File agregasi akan ditrigger untuk dijalankan setiap jam secara otomatis. Berikut contoh nama file hasil agregasi metrics_agg_2024032015.log dengan format metrics_agg_{YmdH}.log 
Karena file log bersifat sensitif pastikan semua file log hanya dapat dibaca oleh user pemilik file. 
Note:
Nama file untuk script per menit adalah minute_log.sh
ama file untuk script agregasi per jam adalah aggregate_minutes_to_hourly_log.shN
Semua file log terletak di /home/{user}/log
Semua konfigurasi cron dapat ditaruh di file skrip .sh nya masing-masing dalam bentuk comment
Berikut adalah contoh isi dari file metrics yang dijalankan tiap menit:
mem_total,mem_used,mem_free,mem_shared,mem_buff,mem_available,swap_total,swap_used,swap_free,path,path_size 15949,10067,308,588,5573,4974,2047,43,2004,/home/user/coba/,74M

Berikut adalah contoh isi dari file aggregasi yang dijalankan tiap jam:
type,mem_total,mem_used,mem_free,mem_shared,mem_buff,mem_available,swap_total,swap_used,swap_free,path,path_size minimum,15949,10067,223,588,5339,4626,2047,43,1995,/home/user/coba/,50M maximum,15949,10387,308,622,5573,4974,2047,52,2004,/home/user/coba/,74M average,15949,10227,265.5,605,5456,4800,2047,47.5,1999.5,/home/user/coba/,62M


# Penyelesaian

## Soal 1

   ```sh
   # $2: Order Date || $6: Buyer's name || $7: Customer Segment || $14: Category || $17: Sales || $20: Profit <-- SECTIONS USED

  echo DOWNLOAD FILE MENGGUNAKAN COMMAND WGET 
  wget --no-check-certificate 'https://drive.google.com/uc?export=download&id=1cC6MYBI3wRwDgqlFQE1OQUN83JAreId0' -O Sandbox.cs
   ```
Disini maksud dari komen `$2, $6 dan seterusnya` adalah untuk memudahkan reader dalam membaca kode yang akan muncul. Penjelasan command:
- `wget`: mengdownload.
- `--no-check-certificate`: Dipakai agar tidak ribet dalam mengecek file :v (takes less time to download, but high in potential risks).
- `-O`: Mengontrol nama file dari link yang di download.

  ```sh
   echo CEK KEBERADAAN FILE DENGAN LS
   ls 
   ```
Dibawah command `ls` akan terlihat ada file apa saja. File Sandbox.csv akan terlihat ada diantara kerumunan tersebut.

 ```sh
   echo MELIHAT ISI FILE CSV DENGAN CAT
   cat Sandbox.csv 
   ```
`cat` digunakan untuk mengeprint isi csv.

 ```sh
echo MENDAPATKAN BUYER DENGAN SALES TERTINGGI 
awk -F ',' 'NR > 1  {sales[$6] += $17; if (sales[$6] > highest_sales) highest_sales = sales[$6]} END {for (buyer in sales) if (sales[buyer] == highest_sales) print buyer, sales[buyer]}' Sandbox.csv 
 ```
- `awk`: Command untuk melakukan script AWK (mencari sebuah string atau a certain pattern yang diinput setelahnya)
- `-F ','`: Field separator. Menyuruh script awk untuk mengseparate hasil2nya
- `NR > 1`: NR stands for "Number of Records". Script ini akan membuat program hanya mencari dibawah Header
- `{sales[$6] += $17; if (sales[$6] > highest_sales) highest_sales = sales[$6]}`: Kumpulan kode ini melakukan:
- Calculates the total sales dari para buyer (`$6`) Dengan menambahkan jumlah sales kepada elemen array 'sales'.
- Mengecek apakah current sales (sales yang lagi dicek) itu bener2 max atau nggak. Misal B > A, maka yang diprint A.
- `END`: keyword ini memberitahu untuk melanjutkan code setelahnya setelah code sebelumnya selesai semua.
- `{for (buyer in sales) if (sales[buyer] == highest_sales) print buyer, sales[buyer]}`: Kumpulan code ini diexecute setelah code sebelum 'END' selesai. Kumpulan kode ini akan di-repeat hingga selesai yang kemudian dimasukkan ke array 'sales',  lalu mengeprint buyer dengan highest sales. (Menggunakan semacam loop dengan for, if)


```sh
echo BUYER DENGAN LOWEST PROFIT 
awk -F ',' 'NR > 1 {profits[$6] += $20; if (profits[$6] < lowest_profit || lowest_profit == "") lowest_profit = profits[$6]} END {for (buyer in profits) if (profits[buyer] == lowest_profit) print buyer, profits[buyer]}' Sandbox.csv 
```
Kurang lebih mirip command sebelumnya. Bedanya menggunakan l`owest_profit == ""` untuk memastikan bahwa angkanya positif, dan bukan minus. Serta menggunakan blank karena kita tidak mengetahui lowest profit.

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
  awk '/Adriaens/ {print}' Sandbox.csv
  ```
`'/Adriaens/` : Ini yang dicari menggunakan script awk tadi
`{print}'` : Mengeprint hasil

```sh
echo Date Purchase + Quantity of Items dari Adriaens
grep 'Adriaens' Sandbox.csv | awk -F ',' '{print $2, $6, $17}' 
```
`grep`: untuk search sebuah pattern dalam file teks yang telah dibuat.
`'{print $2, $6, $17}'`: Mengeprint nama, date of purchase, serta quantity dari Adriaens. 

### Kendala serta Revisi untuk Soal 1
```sh
awk -F ',' 'NR > 1 && ($20 < lowest_profit || lowest_profit == "") {lowest_profit = $20; segment = $7; profit = $20} END {print segment, profit}' Sandbox.csv
```
Pada Soal 1B yang diminta dari soal adalah customer segment dengan profit terkecil, maka seharusnya code yang digunakan untuk mendapatkannya adalah code diatas,dimana:
- `$20 < lowest_profit || lowest_profit == "") {lowest_profit = $20; segment = $7; profit = $20}`: Mengecek profit pada section $20 itu lebih kecil dari current minimum profit (lowest_profit) atau apakah (lowest_profit) itu kosong. Kalau kosong, lowest_profit akan di update dengan current profit, lalu meng-assign segment dari section 7 ke variabel segment, dan kemudian meng-assign profit ke variabel profit.
- `END {print segment, profit}'`: command ini akan mengeprint hasil segment dengan lowest profir setelah melakukan command sebelum bagian 'END'.

Serta pada 1C, dikarenakan sebelumnya terjadi segmentation fault serta syntax error. Dengan itu, code dimodifikasi menjadi:
```sh
awk -F ',' 'NR > 1 {profits[$14] += $20} END {PROCINFO["sorted_in"] = "@val_num_desc"; for (category in profits) {if (length(top_categories) < 3 || profits[category] >= profits[top_categories[3]]) {top_categories[category] = profits[category]; if (length(top_categories) > 3) { min_category = top_categories[1]; for (top in top_categories) if (profits[top_categories[top]] < profits[min_category]) min_category = top_categories[top]; delete top_categories[min_category]; }}} for (category in top_categories) print category, profits[category]}' Sandbox.csv
 ```
Dengan penjelasan:
- `{ profits[$14] += $20 }`: Calculates the profits untuk setiap category ($14) dengan menambahkan nilai profit ($20) ke profit yang sudah ada di array profit.
- `END {PROCINFO["sorted_in"] = "@val_num_desc"; ...}`: Karena dimulai dengan END, maka command ini dilakukan setelah semua command sebelumnya selesai dilakukan. 
- `PROCINFO`: sebuah array dari awk yang special bult untuk membuat descending order dari "@val_num_desc" (value number descend). Jadi dimulai dari paling besar ke paling kecil.
- `for (category in profits) { ... }`: Loop ini di run melalui setiap category di array profit.
- `if (length(top_categories) < 3 || profits[category] >= profits[top_categories[3]]) { ... }`: Memastikan agar jumlah top category tidak melebihi 3
- `top_categories[category] = profits[category]`: Line ini mengupdate top_categories dengan profitnya current category.
- `if (length(top_categories) > 3) { ... }`: Kondisi ini mengecek apakah kategori melebihi 3. kalau melebihi, semua yang profitnya lebih rendah akan direplace oleh category yang memiliki profit lebih besar.
- `for (top in top_categories) { ... }`: Loop ini di run melalui setiap category di top_categories.
- `if (profits[top_categories[top]] < profits[min_category]) { ... }`: Kondisi ini meng-compare profit dari current category dengan profitnya min_category. Kalo profit current category itu lebih rendah aaripada min_category, maka min_category diupdate ke current category.
- `delete top_categories[min_category]`: Line ini mengdelete category dengan lowest profit (min_category) dari top_categories.
- `for (category in top_categories) { print category, profits[category] }`: loop ini dirun melalui setiap category di top_categories dan mengeprint setiap category dengan profitnya.

Hasil Soal 1 :

![image](https://github.com/Karisuta7/Sisop-1-2024-MH-IT18/assets/151893499/77befbdd-9f73-4e81-9187-525bc1f4b4df)

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
Disini kita menggunakan `set -e` sebagai precaution terhadap kemungkinan error. script di awali dengan mendownload file genshin.zip dengan menggunakan wget lalu mengunzip genshin.zip dan genshin_character.zip. sesudah itu berpindah directory menuju genshin_character untuk melakukan loop dekripsi dan pegantian format nama setiap file `.jpg`.
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
Di atas kita melakukan ls dilanjutkan dengan while loop yang akan berjalan sampai semua file di dalam directory `genshin_character` terbaca. setelah itu di lanjutkan dengan dekripsi hex menggunakan command `xxd`. setelah nama file terdekripsi command cd memindahkan directory ke parent directory dan membaca list_character.csv tanpa menyimpan `white spaces` yang ada di dalam setiap line ke dalam variable attribute. selanjutnya balik ke directory genshin_character dan menggatur format nama file yang baru. `cut` digunakan untuk menghapus character yang di temukan setelah ','. `tr` digunakan untuk mengubah ',' menjadi '_' dan mengubah nama character yang memiliki space diganti menjadi '-'. selanjutnya menyimpan format nama baru ke dalam vairabel new_filename dan mengubah nama file. selanjutnya membuat directory baru sesuai nama region dengan `mkdir -p`. `-p` digunakan agar jika folder sudah terbuat tidak akan mengeluarkan error mesage. sesudah itu `mv` digunakan untuk memindahkan file ke dalam foler.

Hasil awal.sh :

![alt text](image-1.png)
![alt text](image-2.png)

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
Command `cd` merubah directory kembali ke parent directory. setalah itu membaca `list_character.csv` mulai dari line 2 dan menghitung tiap nama weapon. echo akan memberikan output nama senajata dan jumlah senjata.

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
Di dalam case pertama akan cek apakah text yang terdekripsi mengandung "https" dan jika mengandung "https" akan mendownload file dengan gdown, menyimpan hasil dekripsi ke dalam `decrypted_url.txt`, mengoutput [date] [found] [directory] ke dalam image.log dan menghentikan loop. jika tidak ada akan [date] [not found] [directory] dan remove `temp.txt` dan berhenti untuk 1 detik.

Hasil search.sh :

![alt text](image-4.png)

Isi dari Image.log dan hasil dekripsi yang berisi URL:

![alt text](image-7.png)

## Soal 4
### minute_log.sh

```sh
#!/bin/bash
#* * * * * untuk mengatur running setiap menit dilanjut dengan directory script
#* * * * * /home/ch0clat/sisoptest/minute_log.sh
set -e

memory_data=$(free -m|awk 'NR==2 {print $2,$3,$4,$5,$6}' |tr ' ' ',' )
```
Di sini saya menggunakan variable memory_data untuk menyimpan semua output dari command `free -m` yang berada pada column 2 lalu saya menggunakan `tr` untuk mengganti spaces menjadi ','.

```sh
swap_data=$(free -m|awk 'NR==3 {print $2,$3,$4}' |tr ' ' ',' )
```
Di sini saya menggunakan variable swap_data untuk menyimpan semua output dari command `free -m` yang berada pada column 3 lalu saya menggunakan `tr` untuk mengganti spaces menjadi ','.

```sh
directory_data=$(du -sh ~/. |awk '{print $2,$1}' |tr ' ' ',')
```
lalu saya menyimpan data dari command `du -sh ~/.` pada variable directory_data dan menggunakan `tr` untuk mengubah format output.

```sh
time_stamp=$(date "+%Y%m%d%H%M%S")
```
saya menggunakan command date untuk menyimpan tanggal dan waktu saat script di jalankan ke dalam variable time_stamp.

```sh
echo "mem_total,mem_used,mem_free,mem_shared,mem_buff,mem_available,swap_total,swap_used,swap_free,path,path_size" > ~/log/"metrics_$time_stamp.log"
echo "$memory_data,$swap_data,$directory_data" >> ~/log/"metrics_$time_stamp.log"
chmod 400 ~/log/"metrics_$time_stamp".log 
```
lalu disini adalah output dari semua variable yang telah dibuat dan juga menggunakan `time_stamp` sebagai nama file log yang akan di simpan di directory `~/log`. pada akhir penjalanan script command `chmod` akan mengubah permision file menjadi kode 400 yang akan mengubah akses permision file log hanya bisa di akses oleh owner.

Hasil minute_log.sh yang di simpan pada file log di directory `~/log/` :

![alt text](image-8.png)

soal 4 hanya dapat kami kerjakan sampai minute_log.sh karena kendala dalam penghitungan max, min dan avg dari setiap variable yang tersimpan pada file log yang sudah teroutput pada jam tersebut.
