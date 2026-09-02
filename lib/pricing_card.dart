import 'package:flutter/material.dart';

class TieredPricingCard extends StatelessWidget {
  const TieredPricingCard({super.key});

  @override
  Widget build(BuildContext context) {
    // Instruksi: Badge Melayang (Penggunaan Stack)
    return Stack(
      children: [
        // Instruksi: Layer Dasar (Pembungkus Utama)
        Container(
          width: 300, // lebar statis
          margin: const EdgeInsets.all(16.0),
          padding: const EdgeInsets.all(24.0),
          decoration: BoxDecoration(
            color: Colors.white, // latar belakang putih
            borderRadius: BorderRadius.circular(
              16.0,
            ), // border-radius melengkung
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4), // efek bayangan (box shadow)
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Instruksi: Header Paket (Penggunaan Column)
              Center(
                child: Column(
                  children: const [
                    Icon(
                      Icons.laptop_mac,
                      size: 56,
                      color: Colors.blue,
                    ), // Icon besar
                    SizedBox(height: 16),
                    Text(
                      "Paket Profesional",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold, // Text tebal
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Solusi IT komprehensif untuk bisnis.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300, // Text tipis
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24), // Jarak kosong
              // Instruksi: Harga & Durasi (Penggunaan Row)
              Row(
                crossAxisAlignment:
                    CrossAxisAlignment.baseline, // Alignment vertikal baseline
                textBaseline: TextBaseline.alphabetic,
                children: const [
                  Text(
                    "Rp 5.000.000",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    " / proyek",
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                ],
              ),
              const SizedBox(height: 24), // Jarak kosong menggunakan SizedBox
              // Instruksi: Daftar Fitur Layanan (Kombinasi Column & Row)
              Column(
                children: [
                  _buildFeatureItem("Desain UI/UX Khusus"),
                  _buildFeatureItem("Setup Database"),
                  _buildFeatureItem("Dukungan Teknis 1 Bulan"),
                ],
              ),
              const SizedBox(height: 32),

              // Instruksi: Tombol Call-to-Action (Fleksibilitas)
              SizedBox(
                width: double
                    .infinity, // Membungkus tombol agar memenuhi lebar kartu
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "Pilih Paket", // Tombol berlabel "Pilih Paket"
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        // Instruksi: Badge Melayang menggunakan widget Positioned
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.amber, // Latar kuning mencolok
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              "Rekomendasi",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Fungsi bantuan untuk membuat setiap baris fitur (Row dengan Icon centang dan Text)
  Widget _buildFeatureItem(String featureText) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          const Icon(
            Icons.check,
            color: Colors.green,
            size: 20,
          ), // Ikon centang kecil
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              featureText, // Text fitur layanan
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
