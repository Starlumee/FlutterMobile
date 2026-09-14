import 'package:flutter/material.dart';

class CatalogItem {
  final String nama;
  final String harga;
  final String deskripsi;
  final Color warnaPastel;
  final IconData icon;

  const CatalogItem({
    required this.nama,
    required this.harga,
    required this.deskripsi,
    required this.warnaPastel,
    required this.icon,
  });

  // Data 3 card katalog sesuai requirement
  static const List<CatalogItem> items = [
    CatalogItem(
      nama: 'Paket Starter',
      harga: 'Rp 500.000',
      deskripsi:
          'Paket pemula yang mencakup fitur dasar untuk kebutuhan skala kecil dengan dukungan teknis standar.',
      warnaPastel: Color(0xFFE3F2FD), // Latar warna pastel biru
      icon: Icons.inventory_2_outlined,
    ),
    CatalogItem(
      nama: 'Paket Bisnis',
      harga: 'Rp 1.500.000',
      deskripsi:
          'Paket menengah untuk bisnis berkembang dengan fasilitas performa tinggi dan integrasi lengkap.',
      warnaPastel: Color(0xFFFFF3E0), // Latar warna pastel peach
      icon: Icons.business_center_outlined,
    ),
    CatalogItem(
      nama: 'Paket Enterprise',
      harga: 'Rp 3.000.000',
      deskripsi:
          'Solusi menyeluruh skala korporat dengan prioritas dukungan teknis 24/7 dan skalabilitas tinggi.',
      warnaPastel: Color(0xFFE8F5E9), // Latar warna pastel hijau
      icon: Icons.verified_outlined,
    ),
  ];
}
