# Tugas #4 Mobile Developer
**Aplikasi Katalog Layanan IT & Navigasi Antar Screen**

Proyek ini dibangun menggunakan **Flutter** untuk memenuhi kriteria penilaian **Tugas #4 Mobile Developer Documentation**, yang mendemonstrasikan implementasi antarmuka pengguna, navigasi tumpukan (*Stack Navigation*), pemisahan peran *StatelessWidget* dan *StatefulWidget*, serta penanganan *state* interaktif.

##  Panduan Setup Project

### Prasyarat
- **Flutter SDK**: Versi 3.x ke atas ([Panduan Instalasi Flutter](https://docs.flutter.dev/get-started/install)).
- **Dart SDK**: Terintegrasi bersama Flutter SDK.
- **Editor**: VS Code, Android Studio, atau IntelliJ IDEA (dengan ekstensi Flutter & Dart terpasang).
- **Git**: Terpasang di sistem operasi.

### Langkah-langkah Setup
1. **Clone Repository GitHub**:
   ```bash
   git clone <URL_REPOSITORY_GITHUB_ANDA>
   cd tugas_pertama
   ```

2. **Periksa Kesehatan Lingkungan Flutter**:
   ```bash
   flutter doctor
   ```
   Pastikan tidak ada issue kritis pada SDK Flutter.

3. **Unduh Dependensi Project**:
   ```bash
   flutter pub get
   ```

4. **Jalankan Uji Otomatis & Analisis Kode**:
   ```bash
   flutter analyze
   flutter test
   ```

---

##  Perintah untuk Menjalankan Aplikasi & Server Lokal

### 1. Menjalankan Aplikasi Flutter (Mode Standar)
Untuk mendeteksi perangkat target yang tersedia (emulator Android/iOS, Windows desktop, atau browser Chrome):
```bash
flutter devices
```

Jalankan aplikasi ke target tertentu:
- **Windows Desktop**:
  ```bash
  flutter run -d windows
  ```
- **Browser Google Chrome**:
  ```bash
  flutter run -d chrome
  ```
- **Emulator / Device Android**:
  ```bash
  flutter run -d android
  ```

### 2. Menjalankan sebagai Web Server Lokal
Jika Anda ingin menjalankan aplikasi web pada port server lokal tertentu:
```bash
flutter run -d web-server --web-port=8080 --web-hostname=localhost
```
Setelah server aktif, buka browser dan akses URL:
```
http://localhost:8080
```

---

##  Panduan Cara Import Database MySQL

Sesuai dengan ketentuan dokumentasi pengumpulan tugas, berikut adalah panduan langkah demi langkah untuk mengimpor skema database MySQL (misalnya jika aplikasi dihubungkan dengan backend REST API lokal):

### Metode 1: Menggunakan phpMyAdmin (Antarmuka GUI / XAMPP)

1. **Jalankan Apache & MySQL**:
   - Buka control panel **XAMPP** atau **Laragon**.
   - Klik tombol **Start** pada modul **Apache** dan **MySQL**.
2. **Akses phpMyAdmin**:
   - Buka browser web dan kunjungi alamat:
     ```
     http://localhost/phpmyadmin
     ```
3. **Buat Database Baru**:
   - Klik menu **New** pada sidebar sebelah kiri.
   - Masukkan nama database, contoh: `db_layanan_it`.
   - Pilih Collation `utf8mb4_general_ci`, kemudian klik tombol **Create**.
4. **Import File SQL**:
   - Pilih database `db_layanan_it` yang baru dibuat.
   - Klik tab **Import** pada bagian atas layar.
   - Pada bagian *File to import*, klik tombol **Choose File** / **Browse** lalu pilih file `.sql` Anda (misalnya `database.sql`).
   - Gulir ke bawah dan klik tombol **Import** (atau **Go**).
   - Tunggu hingga muncul pesan notifikasi berwarna hijau: *"Import has been successfully finished"*.

---

### Metode 2: Menggunakan Command Line / Terminal (MySQL CLI)

Jika Anda menggunakan antarmuka terminal/command prompt:

1. **Buka Terminal / Command Prompt**.
2. **Masuk ke MySQL Console**:
   ```bash
   mysql -u root -p
   ```
   *(Tekan Enter jika akun root lokal Anda tidak menggunakan password).*

3. **Buat Database Baru**:
   ```sql
   CREATE DATABASE IF NOT EXISTS db_layanan_it;
   EXIT;
   ```

4. **Eksekusi Perintah Import File SQL**:
   ```bash
   mysql -u root -p db_layanan_it < path/ke/file_database.sql
   ```
   *Contoh untuk Windows:*
   ```cmd
   mysql -u root -p db_layanan_it < C:\Users\binta\Documents\tugas_pertama\database.sql
   ```
