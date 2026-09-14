import 'package:flutter/material.dart';
import '../models/catalog_item.dart';

// Requirement b: Screen 2 (Detail) menggunakan StatelessWidget
class DetailScreen extends StatelessWidget {
  final CatalogItem item;

  const DetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Requirement e: Memiliki AppBar dengan tombol back otomatis
      appBar: AppBar(
        title: const Text('Detail Layanan'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Icon besar dengan latar warna pastel item
            Container(
              height: 160,
              decoration: BoxDecoration(
                color: item.warnaPastel,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Center(
                child: Icon(
                  item.icon,
                  size: 80,
                  color: Colors.blue[800],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Nama layanan
            Text(
              item.nama,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),

            // Harga
            Text(
              item.harga,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.blue[700],
              ),
            ),
            const SizedBox(height: 20),

            const Divider(),
            const SizedBox(height: 12),

            // Label deskripsi
            const Text(
              'Deskripsi Layanan',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 8),

            // Deskripsi lengkap
            Text(
              item.deskripsi,
              style: const TextStyle(
                fontSize: 15,
                height: 1.6,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 32),

            // Tombol kembali
            ElevatedButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Kembali ke Beranda'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
