# Tugas Flutter - Katalog Layanan

Aplikasi Flutter yang menampilkan katalog layanan IT dengan navigasi antar halaman, state management, dan event handling.

---

## Setup Project

### Yang dibutuhkan
- Flutter SDK versi 3.x ke atas → [Download di sini](https://docs.flutter.dev/get-started/install)
- Dart SDK (sudah termasuk dalam Flutter)
- VS Code atau Android Studio dengan ekstensi Flutter & Dart
- Git

### Langkah setup
1. Clone repository ini:
   ```bash
   git clone https://github.com/Starlumee/FlutterMobile.git
   cd FlutterMobile
   ```

2. Install dependensi:
   ```bash
   flutter pub get
   ```

3. Cek apakah Flutter sudah siap:
   ```bash
   flutter doctor
   ```

---

## Menjalankan Aplikasi

Lihat daftar perangkat yang tersedia:
```bash
flutter devices
```

Jalankan ke perangkat yang diinginkan:
```bash
# Android emulator / device
flutter run -d android

# Windows desktop
flutter run -d windows

# Browser Chrome
flutter run -d chrome
```

### Sebagai web server lokal
```bash
flutter run -d web-server --web-port=8080 --web-hostname=localhost
```
Buka browser dan akses `http://localhost:8080`

---

## Import Database MySQL

### Menggunakan phpMyAdmin (XAMPP)

1. Buka XAMPP, jalankan **Apache** dan **MySQL**
2. Buka browser, akses `http://localhost/phpmyadmin`
3. Klik **New** di sidebar, buat database baru (contoh: `db_katalog`)
4. Pilih database tersebut, klik tab **Import**
5. Pilih file `.sql` dari komputer, klik **Import**
6. Tunggu sampai muncul pesan sukses berwarna hijau

### Menggunakan Terminal

```bash
# Login ke MySQL
mysql -u root -p

# Buat database
CREATE DATABASE db_katalog;
EXIT;

# Import file SQL
mysql -u root -p db_katalog < path/ke/database.sql
```

Contoh di Windows:
```cmd
mysql -u root -p db_katalog < C:\Users\binta\Documents\tugas_pertama\database.sql
```

---

## Struktur Folder

```
lib/
├── main.dart
├── models/
│   └── catalog_item.dart
└── screens/
    ├── home_screen.dart
    └── detail_screen.dart
```
