# $2: Order Date || $6: Buyer's name || $14: Category || $17: Sales || $20: Profit <-- SECTIONS USED

echo DOWNLOAD FILE MENGGUNAKAN COMMAND WGET 

wget --no-check-certificate 'https://drive.google.com/uc?export=download&id=1cC6MYBI3wRwDgqlFQE1OQUN83JAreId0' -O Sandbox.csv 

# wget: mengdownload
# --no-check-certificate: Dipakai agar tidak ribet dalam mengecek file :v (takes less time to download, but high in potential risks)
# -O: Mengontrol nama file dari link yang di download

echo CEK KEBERADAAN FILE DENGAN LS

ls 

#Dibawah command ls akan terlihat ada file apa saja. File Sandbox.csv akan terlihat ada diantara kerumunan tersebut.

echo MELIHAT ISI FILE CSV DENGAN CAT

cat Sandbox.csv 
#cat digunakan untuk mengeprint isi csv

echo MENDAPATKAN BUYER DENGAN SALES TERTINGGI 
awk -F ',' 'NR > 1  {sales[$6] += $17; if (sales[$6] > highest_sales) highest_sales = sales[$6]} END {for (buyer in sales) if (sales[buyer] == highest_sales) print buyer, sales[buyer]}' Sandbox.csv 

# `awk`: Command untuk melakukan script AWK (mencari sebuah string atau a certain pattern yang diinput setelahnya)
# `-F ','`: Field separator. Menyuruh script awk untuk mengseparate hasil2nya
# `NR > 1`: `NR` stands for "Number of Records". Script ini akan membuat program hanya mencari dibawah Header
# `{sales[$6] += $17; if (sales[$6] > highest_sales) highest_sales = sales[$6]}`: Kumpulan kode ini melakukan:
   #- Calculates the total sales dari para buyer (`$6`) Dengan menambahkan jumlah sales kepada elemen array `sales`.
   #- Mengecek apakah current sales (sales yang lagi dicek) itu bener2 max atau nggak. Misal B > A, maka yang diprint A.
# `END`: keyword ini memberitahu untuk melanjutkan code setelahnya setelah code sebelumnya selesai semua.
# `{for (buyer in sales) if (sales[buyer] == highest_sales) print buyer, sales[buyer]}`: Kumpulan code ini diexecute setelah code sebelum 'END' selesai. Kumpulan kode ini akan di-repeat hingga selesai yang kemudian dimasukkan ke array 'sales',  lalu mengeprint buyer dengan highest sales. (Menggunakan semacam loop dengan for, if)

echo BUYER DENGAN LOWEST PROFIT 
awk -F ',' 'NR > 1 {profits[$6] += $20; if (profits[$6] < lowest_profit || lowest_profit == "") lowest_profit = profits[$6]} END {for (buyer in profits) if (profits[buyer] == lowest_profit) print buyer, profits[buyer]}' Sandbox.csv 

# Kurang lebih mirip command sebelumnya. Bedanya menggunakan lowest_profit == "" untuk memastikan bahwa angkanya positif, dan bukan minus. Serta menggunakan blank karena kita tidak mengetahui lowest profit.

echo TOP 3 CATEGORIES WITH HIGHEST PROFIT
awk -F ',' 'NR > 1 {profits[$14] += $20} END {PROCINFO["sorted_in"] = "@val_num_desc"; for (category in profits) {if (length(top_categories) < 3 || profits[category] >= profits[top_categories[3]]) {top_categories[category] = profits[category]; delete top_categories[min_category]}} for (category in top_categories) print category, profits[category]}' Sandbox.csv 

# Agak mirip pada beberapa command, kecuali pada:
# `END {PROCINFO["sorted_in"] = "@val_num_desc"; ...}`: Karena dimulai dengan END, maka command ini dilakukan setelah semua command sebelumnya selesai dilakukan. 
# PROCINFO: sebuah array dari awk yang special bult untuk membuat descending order dari "@val_num_desc" (value number descend). Jadi dimulai dari paling besar ke paling kecil.
# `for (category in profits) {if (length(top_categories) < 3 || profits[category] >= profits[top_categories[3]]) {top_categories[category] = profits[category]; delete top_categories[min_category]}}`: 
 # -Loop ini berjalan untuk semua text pada array category. Ini akan mendapat top 3 category yang paling banyak profitnya.
 # - Kalau panjang dari top_categories kurang dari tiga, atau bahkan lebih, makan akan diupdate posisi ke 3 nya. 
 # - Misal ada yang lebih besar dari yang sebelumnya, maka akan diisi oleh yang lebih besar tersebut.

echo NYARI ADRIAENS + Date Purchase + Quantity of Items
echo Data Adriaens secara full
awk '/Adriaens/ {print}' Sandbox.csv

# '/Adriaens/ : Ini yang dicari menggunakan script awk tadi
# {print}' : Mengeprint hasil

echo Date Purchase + Quantity of Items dari Adriaens
grep 'Adriaens' Sandbox.csv | awk -F ',' '{print $2, $6, $17}' 

# grep: 
#'{print $2, $6, $17}' 
