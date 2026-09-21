import 'package:flutter/material.dart';

import '../models/catalog_item.dart';

// Requirement b: Screen 2 (Detail) WAJIB StatefulWidget untuk implementasi event & state
class DetailScreen extends StatefulWidget {
  final CatalogItem item;

  const DetailScreen({super.key, required this.item});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  // ── STATE VARIABLES ──────────────────────────────────────────────────
  // State 1: status favorit (diubah via event tap ikon hati di AppBar)
  bool _isFavorite = false;

  // State 2: jumlah item yang dipilih (diubah via event tombol + / -)
  int _quantity = 1;

  // ── EVENT HANDLERS ───────────────────────────────────────────────────
  // Event: toggle favorit → memperbarui state _isFavorite
  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }

  // Event: tambah kuantitas → memperbarui state _quantity
  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  // Event: kurangi kuantitas (minimal 1) → memperbarui state _quantity
  void _decrementQuantity() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Requirement e: AppBar agar tombol "Kembali" bawaan perangkat/screen tersedia otomatis
      appBar: AppBar(
        // Requirement c: Icon back yang difungsikan sebagai kembali ke Screen 1
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Kembali ke Beranda',
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Detail Katalog'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        // Tombol favorit di AppBar — event mengubah state _isFavorite
        actions: [
          IconButton(
            icon: Icon(
              _isFavorite ? Icons.favorite : Icons.favorite_border,
              color: _isFavorite ? Colors.red[300] : Colors.white,
            ),
            tooltip: _isFavorite ? 'Hapus dari Favorit' : 'Tambah ke Favorit',
            onPressed: _toggleFavorite,
          ),
        ],
      ),
      backgroundColor: Colors.grey[100],

      // Requirement b: Tata letak vertikal dengan Column
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ── IKON BESAR DENGAN LATAR PASTEL ──────────────────────
            Container(
              height: 160,
              decoration: BoxDecoration(
                color: widget.item.warnaPastel,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Center(
                child: Icon(
                  widget.item.icon,
                  size: 80,
                  color: Colors.blue[800],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // ── NAMA KATALOG ─────────────────────────────────────────
            // Requirement c: Text untuk menampilkan nama katalog
            Text(
              widget.item.nama,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),

            // ── HARGA ────────────────────────────────────────────────
            // Requirement c: Text untuk menampilkan harga
            Text(
              widget.item.harga,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.blue[700],
              ),
            ),
            const SizedBox(height: 20),

            const Divider(),
            const SizedBox(height: 12),

            // ── CONTAINER DESKRIPSI (PASTEL + PADDING) ───────────────
            // Requirement c: Container dengan latar belakang warna pastel dan padding
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: widget.item.warnaPastel,
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  color: Colors.blue.withOpacity(0.2),
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Deskripsi Layanan',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.item.deskripsi,
                    style: const TextStyle(
                      fontSize: 15,
                      height: 1.6,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // ── PILIH JUMLAH — IMPLEMENTASI EVENT & STATE ─────────────
            // Event: tap tombol +/- → setState memperbarui _quantity → UI re-build
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12.0,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Jumlah',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  Row(
                    children: [
                      // Event: kurangi jumlah
                      IconButton(
                        onPressed: _decrementQuantity,
                        icon: const Icon(Icons.remove_circle_outline),
                        color: Colors.blue,
                        iconSize: 28,
                      ),
                      // State: tampilkan nilai _quantity terkini
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text(
                          '$_quantity',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // Event: tambah jumlah
                      IconButton(
                        onPressed: _incrementQuantity,
                        icon: const Icon(Icons.add_circle_outline),
                        color: Colors.blue,
                        iconSize: 28,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // ── STATUS FAVORIT — REAKTIF TERHADAP STATE ──────────────
            // AnimatedContainer bereaksi terhadap perubahan state _isFavorite
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12.0,
              ),
              decoration: BoxDecoration(
                color: _isFavorite ? Colors.red[50] : Colors.grey[100],
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  color: _isFavorite
                      ? Colors.red.withOpacity(0.3)
                      : Colors.grey.withOpacity(0.2),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    _isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: _isFavorite ? Colors.red[400] : Colors.grey,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    _isFavorite
                        ? 'Ditambahkan ke Favorit ❤️'
                        : 'Belum ditambahkan ke Favorit',
                    style: TextStyle(
                      color: _isFavorite ? Colors.red[700] : Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // ── TOMBOL KEMBALI ────────────────────────────────────────
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
