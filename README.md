# Tugas #4 Mobile Developer - Dokumentasi Teknis
**Aplikasi Katalog Layanan IT & Navigasi Antar Screen**

Proyek ini dibangun menggunakan **Flutter** untuk memenuhi kriteria penilaian **Tugas #4 Mobile Developer Documentation**, yang mendemonstrasikan implementasi antarmuka pengguna, navigasi tumpukan (*Stack Navigation*), pemisahan peran *StatelessWidget* dan *StatefulWidget*, serta penanganan *state* interaktif.

---

## 📋 Ringkasan Fitur & Scope of Work

Sesuai dengan spesifikasi dokumen teknis tugas:

### 1. Screen 1 (Beranda / Katalog)
- **Komponen**: Wajib menggunakan `StatelessWidget`.
- **Tata Letak**: Menggunakan widget `ListView` yang menampilkan **3 kartu katalog layanan IT**:
  1. **Paket Starter Web** (Web Development) - Rp 2.500.000 / proyek.
  2. **Paket Profesional Mobile** (Mobile App Development) - Rp 5.000.000 / proyek.
  3. **Paket Enterprise Fullstack** (Cloud & System Integration) - Rp 12.000.000 / proyek.
- **Elemen Item**: Setiap item dalam list dibungkus dengan `Card` dan `ListTile`, dilengkapi dengan ikon representatif, badge, informasi harga, durasi, rating, serta tombol *Call-to-Action* (CTA) **"Lihat Detail"**.

### 2. Mekanisme Navigasi (Stack Navigation)
- Menggunakan prinsip *Stack Navigation* (Tumpukan).
- Perpindahan dari Screen 1 ke Screen 2 menggunakan perintah `Navigator.push(context, MaterialPageRoute(...))`.
- Kembali ke Screen sebelumnya melalui tombol *back* otomatis pada `AppBar` atau ikon kembali khusus menggunakan `Navigator.pop(context)`.

### 3. Screen 2 (Detail Katalog & Perubahan State)
- **Komponen**: Diimplementasikan sebagai `StatefulWidget` untuk menyelesaikan tantangan perubahan state interaktif.
- **Tata Letak**: Menggunakan tata letak vertikal berbasis `Column` (dilapisi `SingleChildScrollView` untuk kenyamanan visual di berbagai ukuran layar).
- **Elemen Visual**:
  - **AppBar & Icon Back**: Memiliki ikon kembali (`arrow_back`) yang memanggil `Navigator.pop(context)`.
  - **Header Informasi**: Menampilkan nama katalog, harga, durasi pengerjaan, dan rating layanan.
  - **Container Warna Pastel**: Kontainer berlatar warna pastel lembut (`pastelColor`) dengan `padding` khusus sebagai wadah deskripsi lengkap layanan.
  - **Daftar Fitur**: Menampilkan rincian fitur dan cakupan proyek dengan ikon centang.
  - **State Interaktif pada Tombol**:
    - **Tombol Bookmark / Favorit**: Mengubah state `_isFavorite` seketika (`setState`) disertai pembaruan ikon, warna, dan notifikasi `SnackBar`.
    - **Counter Kebutuhan Proyek**: Penambahan dan pengurangan jumlah unit kebutuhan proyek (`_orderUnits`) secara dinamis.
    - **Tombol Pesan Sekarang**: Mengubah state pemesanan `_isOrdered` menjadi status terkonfirmasi (*Order Confirmation Badge*) dan mengubah teks serta warna tombol aksi secara responsif.

---

## 🚀 Panduan Setup Project

Ikuti langkah-langkah berikut untuk mengunduh dan menyiapkan proyek di lingkungan lokal Anda:

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

## 💻 Perintah untuk Menjalankan Aplikasi & Server Lokal

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

## 🗄️ Panduan Cara Import Database MySQL

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

---

### Referensi Skema SQL (DDL & Seed Data)

Berikut contoh skrip SQL representatif yang dapat disimpan sebagai file `database.sql` untuk tabel katalog layanan:

```sql
CREATE DATABASE IF NOT EXISTS db_layanan_it;
USE db_layanan_it;

DROP TABLE IF EXISTS `catalog_items`;
CREATE TABLE `catalog_items` (
  `id` VARCHAR(50) NOT NULL,
  `title` VARCHAR(150) NOT NULL,
  `category` VARCHAR(100) NOT NULL,
  `price` VARCHAR(50) NOT NULL,
  `period` VARCHAR(50) NOT NULL,
  `badge` VARCHAR(50) NOT NULL,
  `short_description` TEXT NOT NULL,
  `full_description` TEXT NOT NULL,
  `rating` DECIMAL(2,1) NOT NULL DEFAULT 5.0,
  `estimated_duration` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `catalog_items` (`id`, `title`, `category`, `price`, `period`, `badge`, `short_description`, `full_description`, `rating`, `estimated_duration`) VALUES
('pkg-01', 'Paket Starter Web', 'Web Development', 'Rp 2.500.000', '/ proyek', 'Pilihan Pemula', 'Solusi website modern & responsif untuk UMKM dan profil bisnis.', 'Paket pembuatan website profesional dengan tampilan responsive di smartphone, tablet, maupun desktop.', 4.8, '7-14 Hari Kerja'),
('pkg-02', 'Paket Profesional Mobile', 'Mobile App Development', 'Rp 5.000.000', '/ proyek', 'Rekomendasi', 'Aplikasi Flutter multiplatform elegan dengan integrasi REST API & Database.', 'Pengembangan aplikasi mobile berbasis Flutter (Android & iOS) dengan antarmuka dinamis dan arsitektur kode terstruktur.', 4.9, '3-4 Minggu'),
('pkg-03', 'Paket Enterprise Fullstack', 'Cloud & System Integration', 'Rp 12.000.000', '/ proyek', 'Solusi Lengkap', 'Ekosistem software skala besar dengan backend cloud, microservice, & database MySQL.', 'Solusi digital menyeluruh kelas enterprise yang mencakup perancangan arsitektur database MySQL relasional berkinerja tinggi.', 5.0, '6-8 Minggu');
```

---

## 📂 Struktur Direktori Proyek

```
tugas_pertama/
├── android/                 # Konfigurasi platform Android
├── ios/                     # Konfigurasi platform iOS
├── windows/                 # Konfigurasi platform Windows Desktop
├── web/                     # Konfigurasi platform Web
├── lib/
│   ├── main.dart            # Entry point aplikasi (MaterialApp & Theme)
│   ├── models/
│   │   └── catalog_item.dart# Model data katalog & 3 item layanan IT
│   ├── screens/
│   │   ├── home_screen.dart # Screen 1: Beranda (StatelessWidget + ListView 3 cards)
│   │   └── detail_screen.dart # Screen 2: Detail Katalog (StatefulWidget + Column + State)
│   ├── pricing_card.dart    # Komponen kartu harga tugas sebelumnya
│   └── user_model.dart      # Model pengguna dengan Null Safety
├── test/
│   └── widget_test.dart     # Unit & Widget test navigasi dan interaksi state
├── pubspec.yaml             # Metadata dan dependensi Flutter
└── README.md                # Panduan teknis & dokumentasi proyek
```

---

## 🏆 Kepatuhan Terhadap Rubrik Penilaian

| Butir Persyaratan | Status | Implementasi |
| :--- | :---: | :--- |
| **Screen 1 (Beranda)** | ✅ Selesai | Menggunakan `StatelessWidget`, menampilkan `ListView` berisi tepat **3 cards** dengan `ListTile` dan tombol CTA. |
| **Navigasi Tumpukan** | ✅ Selesai | Menggunakan `Navigator.push(context, MaterialPageRoute(...))` dan `Navigator.pop(context)` pada `AppBar`. |
| **Screen 2 (Detail)** | ✅ Selesai | Menggunakan `StatefulWidget` dengan layout vertikal `Column` dan `SingleChildScrollView`. |
| **Elemen Visual Screen 2** | ✅ Selesai | Ikon back, teks nama/harga/katalog, dan `Container` berlatar **warna pastel** dengan padding untuk deskripsi. |
| **State Interaktif** | ✅ Selesai | Tombol Bookmark/Favorit dan tombol Pemesanan mengubah tampilan seketika via `setState()`. |
| **Dokumentasi (README.md)**| ✅ Selesai | Memuat panduan setup, perintah server lokal, dan cara import database MySQL. |
