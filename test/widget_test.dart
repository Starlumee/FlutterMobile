import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tugas_pertama/main.dart';
import 'package:tugas_pertama/screens/home_screen.dart';
import 'package:tugas_pertama/screens/detail_screen.dart';

void main() {
  testWidgets('Screen 1 Beranda menampilkan 3 kartu katalog', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    // Memverifikasi AppBar dan Judul
    expect(find.text('Katalog Layanan IT'), findsOneWidget);

    // Memverifikasi HomeScreen menggunakan ListView
    expect(find.byType(ListView), findsOneWidget);

    // Memverifikasi 3 item katalog tampil
    expect(find.text('Paket Starter Web'), findsOneWidget);
    expect(find.text('Paket Profesional Mobile'), findsOneWidget);
    expect(find.text('Paket Enterprise Fullstack'), findsOneWidget);

    // Memverifikasi 3 tombol CTA 'Lihat Detail'
    expect(find.text('Lihat Detail'), findsNWidgets(3));
  });

  testWidgets(
    'Navigasi Stack Navigation dari Screen 1 ke Screen 2 dan interaksi state',
    (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      // Klik tombol 'Lihat Detail' pada item pertama
      final firstDetailBtn = find.text('Lihat Detail').first;
      await tester.tap(firstDetailBtn);
      await tester.pumpAndSettle(); // Tunggu animasi transisi Navigator.push

      // Memverifikasi telah berpindah ke DetailScreen (Screen 2)
      expect(find.byType(DetailScreen), findsOneWidget);
      expect(find.text('Deskripsi Lengkap Layanan'), findsOneWidget);
      expect(find.text('Fitur & Cakupan Proyek'), findsOneWidget);

      // Verifikasi tombol interaktif bookmark di AppBar (setState)
      final bookmarkBtn = find.byTooltip('Simpan Bookmark');
      expect(bookmarkBtn, findsOneWidget);
      await tester.tap(bookmarkBtn);
      await tester.pumpAndSettle();
      expect(find.byTooltip('Hapus Bookmark'), findsOneWidget); // State di AppBar berubah!
      expect(find.text('Disukai'), findsOneWidget); // Sinkron ke tombol di body!

      // Scroll ke tombol Pesan Sekarang
      final pesanBtn = find.text('Pesan Sekarang');
      await tester.ensureVisible(pesanBtn);
      await tester.pumpAndSettle();

      // Verifikasi tombol interaktif Pesan Sekarang (setState)
      await tester.tap(pesanBtn);
      await tester.pumpAndSettle();
      expect(find.text('Batalkan Pesanan'), findsOneWidget); // State berubah!
      expect(find.textContaining('Status: Paket ini telah Anda pesan'), findsOneWidget);

      // Verifikasi navigasi kembali (Navigator.pop) menggunakan tombol Back
      final backButton = find.byTooltip('Kembali ke Katalog');
      expect(backButton, findsOneWidget);
      await tester.tap(backButton);
      await tester.pumpAndSettle(); // Tunggu transisi pop

      // Memverifikasi telah kembali ke HomeScreen (Screen 1)
      expect(find.byType(HomeScreen), findsOneWidget);
      expect(find.byType(DetailScreen), findsNothing);
    },
  );
}
