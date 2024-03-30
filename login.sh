#!/bin/bash

USERS_DIR="users"

reset_password() {
    read -p "Masukkan email: " email

    user_entry=$(awk -v email="$email" '$1 == "Email:" && $2 == email { print; exit }' "$USERS_DIR/users.txt")
    if [ -z "$user_entry" ]; then
        echo "Email tidak ditemukan!"
        return 1
    fi

    question=$(echo "$user_entry" | awk -F'Pertanyaan Keamanan: ' '{print $2}')
    stored_answer=$(echo "$user_entry" | awk -F'Jawaban: ' '{print $2}')

    read -p "Pertanyaan Keamanan: $question " answer
    if [ "$answer" != "$stored_answer" ]; then
       echo "Jawaban salah!"
        return 1
    fi

    password=$(echo "$user_entry" | awk -F'Password: ' '{print $2}' | base64 --decode)
    echo "Password Anda: $password"
}

login() {
    read -p "Masukkan email: " email
    read -s -p "Masukkan password: " password
    echo

    user_entry=$(awk -v email="$email" '$1 == "Email:" && $2 == email { print; exit }' "$USERS_DIR/users.txt")
    if [ -z "$user_entry" ]; then
        echo "Email tidak ditemukan!"
        echo "[$(date +'%d/%m/%y %H:%M:%S')] [LOGIN FAILED] ERROR Failed login attempt on user with email [$email]" >> "$USERS_DIR/auth.log"
        return 1
    fi

    stored_password=$(echo "$user_entry" | awk -F'Password: ' '{print $2}'|tr -d '[:space:]')
    if [ "$(echo -n "$password" | base64)" != "$stored_password" ]; then
        echo "Password salah!"
        echo "[$(date +'%d/%m/%y %H:%M:%S')] [LOGIN FAILED] ERROR Failed login attempt on user with email [$email]" >> "$USERS_DIR/auth.log"
        return 1
    fi

    is_admin=$(echo "$user_entry" | awk -F'IsAdmin: ' '{print $2}')
    username=$(echo "$user_entry" | awk -F'Username: ' '{print $2}')
    echo "Login berhasil!"
    echo "[$(date +'%d/%m/%y %H:%M:%S')] [LOGIN SUCCESS] User [$username] logged in successfully" >> "$USERS_DIR/auth.log"

    if [ "$is_admin" == "true" ]; then
        manage_users
    fi
}

manage_users() {
    while true; do
        echo "Pilih opsi:"
        echo "1. Tambah pengguna"
        echo "2. Edit pengguna"
        echo "3. Hapus pengguna"
        echo "4. Keluar"
        read -p "Masukkan nomor opsi: " option

        case $option in
            1)
                bash "$USERS_DIR/../register.sh"
                ;;
            2)
                read -p "Masukkan email pengguna yang akan diedit: " email
                edit_user "$email"
                ;;
            3)
                read -p "Masukkan email pengguna yang akan dihapus: " email
                delete_user "$email"
                ;;
            4)
                break
                ;;
            *)
                echo "Opsi tidak valid"
                ;;
        esac
    done
}

edit_user() {
    local email="$1"

    user_entry=$(awk -v email="$email" '$1 == "Email:" && $2 == email { print; exit }' "$USERS_DIR/users.txt")
    if [ -z "$user_entry" ]; then
        echo "Email tidak ditemukan!"
        return 1
    fi

    read -p "Masukkan username baru (kosongkan jika tidak ingin diubah): " new_username
    read -p "Masukkan pertanyaan keamanan baru (kosongkan jika tidak ingin diubah): " new_question
    read -p "Masukkan jawaban baru (kosongkan jika tidak ingin diubah): " new_answer
    read -s -p "Masukkan password baru (kosongkan jika tidak ingin diubah): " new_password
    echo

    if [ -n "$new_password" ]; then
        if ! validate_password "$new_password"; then
            echo "Password baru tidak valid"
            return 1
        fi
        new_password_hashed=$(echo -n "$new_password" | base64)
    fi

    new_user_entry=""
    while IFS= read -r line; do
        case "$line" in
            "Email:"*) new_user_entry+="Email: $email"$'\n' ;;
            "Username:"*) new_user_entry+="Username: ${new_username:-$(echo "$line" | awk -F'Username: ' '{print $2}')}"$'\n' ;;
            "Pertanyaan Keamanan:"*) new_user_entry+="Pertanyaan Keamanan: ${new_question:-$(echo "$line" | awk -F'Pertanyaan Keamanan: ' '{print $2}')}"$'\n' ;;
            "Jawaban:"*) new_user_entry+="Jawaban: ${new_answer:-$(echo "$line" | awk -F'Jawaban: ' '{print $2}')}"$'\n' ;;
            "Password:"*) new_user_entry+="Password: ${new_password_hashed:-$(echo "$line" | awk -F'Password: ' '{print $2}')}"$'\n' ;;
            "IsAdmin:"*) new_user_entry+="$line"$'\n' ;;
            *) new_user_entry+="$line"$'\n' ;;
        esac
    done < <(echo "$user_entry")

    awk -v email="$email" -v new_user_entry="$new_user_entry" '
        $1 == "Email:" && $2 == email {
            print new_user_entry
            found = 1
            next
        }
        {
            print
        }
        END {
            if (!found) {
                print new_user_entry
            }
        }
    ' "$USERS_DIR/users.txt" > "$USERS_DIR/temp.txt" && mv "$USERS_DIR/temp.txt" "$USERS_DIR/users.txt"

    echo "Pengguna berhasil diedit"
}

delete_user() {
    local email="$1"

    awk -v email="$email" '
        $1 == "Email:" && $2 == email {
            found = 1
            next
        }
        !found
    ' "$USERS_DIR/users.txt" > "$USERS_DIR/temp.txt" && mv "$USERS_DIR/temp.txt" "$USERS_DIR/users.txt"

    if [ $? -eq 0 ]; then
        echo "Pengguna berhasil dihapus"
    else
        echo "Email tidak ditemukan!"
    fi
}

while true; do
    echo "Pilih opsi:"
    echo "1. Login"
    echo "2. Lupa Password"
    echo "3. Keluar"
    read -p "Masukkan nomor opsi: " option

    case $option in
        1)
            login
            ;;
        2)
            reset_password
            ;;
        3)
            break
            ;;
        *)
            echo "Opsi tidak valid"
            ;;
    esac
done
