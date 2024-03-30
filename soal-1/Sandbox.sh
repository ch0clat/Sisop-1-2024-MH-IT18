# $2: Order Date || $6: Buyer's name  || $7: Customer Segment || $14: Category || $17: Sales || $20: Profit <-- SECTIONS USED

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

echo MENDAPATKAN BUYER DENGAN SALES TERTINGGI - No 1A
awk -F ',' 'NR > 1  {sales[$6] += $17; if (sales[$6] > highest_sales) highest_sales = sales[$6]} END {for (buyer in sales) if (sales[buyer] == highest_sales) print buyer, sales[buyer]}' Sandbox.csv 

# `awk`: Command untuk melakukan script AWK (mencari sebuah string atau a certain pattern yang diinput setelahnya).
# `-F ','`: Field separator. Menyuruh script awk untuk mengseparate hasil2nya.
# `NR > 1`: `NR` stands for "Number of Records". Script ini akan membuat program hanya mencari dibawah Header.
# `{sales[$6] += $17; if (sales[$6] > highest_sales) highest_sales = sales[$6]}`: Kumpulan kode ini melakukan:
   #- Calculates the total sales dari para buyer (`$6`) Dengan menambahkan jumlah sales kepada elemen array `sales`.
   #- Mengecek apakah current sales (sales yang lagi dicek) itu bener2 max atau nggak. Misal B > A, maka yang diprint A.
# `END`: keyword ini memberitahu untuk melanjutkan code setelahnya setelah code sebelumnya selesai semua.
# `{for (buyer in sales) if (sales[buyer] == highest_sales) print buyer, sales[buyer]}`: Kumpulan code ini diexecute setelah code sebelum 'END' selesai. Kumpulan kode ini akan di-repeat hingga selesai yang kemudian dimasukkan ke array 'sales',  lalu mengeprint buyer dengan highest sales. (Menggunakan semacam loop dengan for, if)

echo CUSTOMER SEGMENT DENGAN LOWEST PROFIT - No 1B
awk -F ',' 'NR > 1 && ($20 < lowest_profit || lowest_profit == "") {lowest_profit = $20; segment = $7; profit = $20} END {print segment, profit}' Sandbox.csv

# Kurang lebih mirip command sebelumnya. Yang berbeda:
# Pengunaan && untuk memberi command ke 2 (jadi mengerjakan command A lalu B)
# $20 < lowest_profit || lowest_profit == "") {lowest_profit = $20; segment = $7; profit = $20}: Mengecek profit pada section $20 itu lebih kecil dari current minimum profit (lowest_profit) atau apakah (lowest_profit) itu kosong. Kalau kosong, lowest_profit akan di update dengan current profit, lalu meng-assign segment dari section 7 ke variabel segment, dan kemudian meng-assign profit ke variabel profit.
# END {print segment, profit}': command ini akan mengeprint hasil segment dengan lowest profir setelah melakukan command sebelum bagian 'END'.


echo TOP 3 CATEGORIES WITH HIGHEST PROFIT - No 1C
awk -F ',' 'NR > 1 {profits[$14] += $20} END {PROCINFO["sorted_in"] = "@val_num_desc"; for (category in profits) {if (length(top_categories) < 3 || profits[category] >= profits[top_categories[3]]) {top_categories[category] = profits[category]; if (length(top_categories) > 3) { min_category = top_categories[1]; for (top in top_categories) if (profits[top_categories[top]] < profits[min_category]) min_category = top_categories[top]; delete top_categories[min_category]; }}} for (category in top_categories) print category, profits[category]}' Sandbox.csv

# Agak mirip seperti sebelumnya pada beberapa command, kecuali pada:
# { profits[$14] += $20 }: Calculates profits untuk setiap category ($14) dengan menambahkan nilai profit ($20) ke profit yang sudah ada di array profit.
# `END {PROCINFO["sorted_in"] = "@val_num_desc"; ...}`: Karena dimulai dengan END, maka command ini dilakukan setelah semua command sebelumnya selesai dilakukan. 
# PROCINFO: sebuah array dari awk yang special bult untuk membuat descending order dari "@val_num_desc" (value number descend). Jadi dimulai dari paling besar ke paling kecil.
# for (category in profits) { ... }: Loop ini di run melalui setiap category di array profit.
# if (length(top_categories) < 3 || profits[category] >= profits[top_categories[3]]) { ... }: Memastikan agar jumlah top category tidak melebihi 3
# top_categories[category] = profits[category]: Line ini mengupdate top_categories dengan profitnya current category.
# if (length(top_categories) > 3) { ... }: Kondisi ini mengecek apakah kategori melebihi 3. kalau melebihi, semua yang profitnya lebih rendah akan direplace oleh category yang memiliki profit lebih besar.
# for (top in top_categories) { ... }: Loop ini di run melalui setiap category di top_categories.
# if (profits[top_categories[top]] < profits[min_category]) { ... }: Kondisi ini meng-compare profit dari current category dengan profitnya min_category. Kalo profit current category itu lebih rendah aaripada min_category, maka min_category diupdate ke current category.
# delete top_categories[min_category]: Line ini mengdelete category dengan lowest profit (min_category) dari top_categories.
# for (category in top_categories) { print category, profits[category] }: loop ini dirun melalui setiap category di top_categories dan mengeprint setiap category dengan profitnya.

echo MENCARI ADRIAENS + Date Purchase + Quantity of Items - No 1D
awk '/Adriaens/ {print}' Sandbox.csv

#'/Adriaens/` : Ini yang dicari menggunakan script awk tadi
#`{print}'` : Mengeprint hasil
grep 'Adriaens' Sandbox.csv | awk -F ',' '{print $2, $6, $17}' 

# grep: Mendapat text and strings yang tadi dicari (disini Adriaens), baru mendapat date purchase serta quantity of items.
#'{print $2, $6, $17}' : Print nama, date purchase dan quantity of items dari Adriaens
