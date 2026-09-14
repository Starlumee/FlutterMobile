-- ===================================================
-- Skema Database: db_layanan_it
-- Tugas #4 Mobile Developer Documentation
-- ===================================================

CREATE DATABASE IF NOT EXISTS `db_layanan_it` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `db_layanan_it`;

-- Struktur Tabel `catalog_items`
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
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data Awal (Seeding) untuk 3 Kartu Layanan IT
INSERT INTO `catalog_items` 
  (`id`, `title`, `category`, `price`, `period`, `badge`, `short_description`, `full_description`, `rating`, `estimated_duration`) 
VALUES
  (
    'pkg-01', 
    'Paket Starter Web', 
    'Web Development', 
    'Rp 2.500.000', 
    '/ proyek', 
    'Pilihan Pemula', 
    'Solusi website modern & responsif untuk UMKM dan profil bisnis.', 
    'Paket pembuatan website profesional dengan tampilan responsive di smartphone, tablet, maupun desktop. Sangat cocok bagi pelaku usaha UMKM, personal branding, atau instansi yang membutuhkan kehadiran digital terpercaya dengan optimasi SEO dasar dan waktu pengerjaan efisien.', 
    4.8, 
    '7-14 Hari Kerja'
  ),
  (
    'pkg-02', 
    'Paket Profesional Mobile', 
    'Mobile App Development', 
    'Rp 5.000.000', 
    '/ proyek', 
    'Rekomendasi', 
    'Aplikasi Flutter multiplatform elegan dengan integrasi REST API & Database.', 
    'Pengembangan aplikasi mobile berbasis Flutter (Android & iOS) dengan antarmuka dinamis dan arsitektur kode terstruktur. Dilengkapi dengan integrasi REST API, manajemen state interaktif, penyimpanan lokal, serta panduan deployment ke perangkat pengguna.', 
    4.9, 
    '3-4 Minggu'
  ),
  (
    'pkg-03', 
    'Paket Enterprise Fullstack', 
    'Cloud & System Integration', 
    'Rp 12.000.000', 
    '/ proyek', 
    'Solusi Lengkap', 
    'Ekosistem software skala besar dengan backend cloud, microservice, & database MySQL.', 
    'Solusi digital menyeluruh kelas enterprise yang mencakup perancangan arsitektur database MySQL relasional berkinerja tinggi, backend API aman, integrasi dashboard admin web, dan aplikasi mobile. Dirancang khusus untuk perusahaan yang membutuhkan skalabilitas tinggi dan keamanan data tingkat lanjut.', 
    5.0, 
    '6-8 Minggu'
  );
