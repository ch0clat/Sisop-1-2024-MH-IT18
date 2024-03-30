#!/bin/bash

validate_password() {
    local password="$1"
    if [ "${#password}" -lt 9 ]; then
        echo "Password harus lebih dari 8 karakter"
        return 1
    fi

    if ! [[ "$password" =~ [A-Z] && "$password" =~ [a-z] && "$password" =~ [0-9] ]]; then
        echo "Password harus mengandung setidaknya satu huruf besar, satu huruf kecil, dan satu angka"
        return 1
    fi

    return 0
}

USERS_DIR="users"
mkdir -p "$USERS_DIR"

read -p "Masukkan email: " email
read -p "Masukkan username: " username
read -p "Masukkan pertanyaan keamanan: " question
read -p "Masukkan jawaban: " answer
read -s -p "Masukkan password: " password
echo

if ! validate_password "$password"; then
    echo "Registrasi gagal: Password tidak valid"
    echo "[$(date +'%d/%m/%y %H:%M:%S')] [REGISTER FAILED] Registration failed for user with email $email" >> "$USERS_DIR/auth.log"
    exit 1
fi

password_hashed=$(echo -n "$password" | base64)

is_admin="false"
if [[ "$email" == *"admin"* ]]; then
    is_admin="true"
fi

echo "Email: $email" >> "$USERS_DIR/users.txt"
echo "Username: $username" >> "$USERS_DIR/users.txt"
echo "Pertanyaan Keamanan: $question" >> "$USERS_DIR/users.txt"
echo "Jawaban: $answer" >> "$USERS_DIR/users.txt"
echo "Password: $password_hashed" >> "$USERS_DIR/users.txt"
echo "IsAdmin: $is_admin" >> "$USERS_DIR/users.txt"
echo "" >> "$USERS_DIR/users.txt"

echo "Registrasi berhasil!"
echo "[$(date +'%d/%m/%y %H:%M:%S')] [REGISTER SUCCESS] User [$username] registered successfully" >> "$USERS_DIR/auth.log"
