import 'package:flutter/material.dart';
import '../models/catalog_item.dart';
import 'detail_screen.dart';

// Requirement a: Screen 1 (Beranda) Wajib menggunakan StatelessWidget
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Data berisi tepat 3 item katalog
    final List<CatalogItem> catalogList = CatalogItem.items;

    return Scaffold(
      // Requirement e: Memiliki AppBar
      appBar: AppBar(
        title: const Text('Beranda Katalog'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.grey[100],
      // Requirement a: Data ditampilkan menggunakan ListView yang berisi 3 cards
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: catalogList.length, // Berisi 3 cards
        itemBuilder: (context, index) {
          final item = catalogList[index];

          // Fungsi navigasi ke Screen 2 menggunakan teknik Stack Navigation (Navigator.push)
          void navigateToDetail() {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(item: item),
              ),
            );
          }

          return Card(
            margin: const EdgeInsets.only(bottom: 16.0),
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(12.0),
              // Card dapat diklik langsung
              onTap: navigateToDetail,
              // Requirement a: Setiap item menggunakan ListTile atau tombol yang bisa diklik
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: item.warnaPastel,
                    child: Icon(item.icon, color: Colors.blue[800]),
                  ),
                  title: Text(
                    item.nama,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      item.harga,
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  // CTA button yang bisa diklik untuk navigasi via Navigator.push
                  trailing: ElevatedButton(
                    onPressed: navigateToDetail,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Lihat Detail'),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
