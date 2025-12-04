import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sidata_app/widgets/appbar.dart';

// ==========================================
// MODEL DATA
// ==========================================
class ItemData {
  final String title;
  final String subtitle;
  final IconData icon;

  ItemData({required this.title, required this.subtitle, required this.icon});
}

// ==========================================
// PAGE UTAMA PANDUAN
// ==========================================
class PanduanPage extends StatelessWidget {
  final List<ItemData> umumItems = [
    ItemData(
      title: 'Unggah Profile',
      subtitle: 'Panduan untuk mengunggah profile pengguna',
      icon: FontAwesomeIcons.user,
    ),
    ItemData(
      title: 'Ganti Password',
      subtitle: 'Panduan untuk mengganti password pengguna',
      icon: FontAwesomeIcons.lock,
    ),
  ];

  final List<ItemData> untukSiswaItems = [
    ItemData(
      title: 'Mengisi Jurnal',
      subtitle: 'Panduan untuk mengisi kegiatan sehari - hari',
      icon: FontAwesomeIcons.penToSquare,
    ),
    ItemData(
      title: 'Kelengkapan Profile',
      subtitle: 'Panduan untuk melengkapi profile',
      icon: FontAwesomeIcons.idCard,
    ),
    ItemData(
      title: 'Mengelola Portfolio',
      subtitle: 'Panduan untuk menambah, edit, dan hapus portfolio',
      icon: FontAwesomeIcons.images,
    ),
    ItemData(
      title: 'Mengelola Sertifikat',
      subtitle: 'Panduan untuk menambah, edit, dan hapus sertifikat',
      icon: FontAwesomeIcons.award,
    ),
    ItemData(
      title: 'Catatan Sikap Saya',
      subtitle: 'Panduan untuk melihat dan memahami catatan sikap',
      icon: FontAwesomeIcons.circleInfo,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F9),
      appBar: const AppbarProp(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.bookOpen,
                  color: Color(0xFF1B3B8B),
                  size: 26,
                ),
                SizedBox(width: 6),
                Text(
                  "Panduan Penggunaan",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1B3B8B),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Text(
              "Selamat datang di panduan penggunaan aplikasi Jurnalku. Panduan ini akan membantu Anda memahami cara menggunakan fitur-fitur yang tersedia dengan optimal.",
              style: GoogleFonts.poppins(
                fontSize: 14,
                height: 1.55,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 24),
            Text(
              "Umum",
              style: GoogleFonts.poppins(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 14),
            Column(
              children: umumItems.map((e) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: GuideItem(
                    item: e,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailPanduanPage(title: e.title),
                        ),
                      );
                    },
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 28),
            Text(
              "Untuk Siswa",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 14),
            Column(
              children: untukSiswaItems.map((e) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: GuideItem(
                    item: e,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailPanduanPage(title: e.title),
                        ),
                      );
                    },
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// ITEM CARD (SUDAH ADA onTap)
// ==========================================
class GuideItem extends StatelessWidget {
  final ItemData item;
  final VoidCallback? onTap;

  GuideItem({required this.item, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFFE8F0FE),
                borderRadius: BorderRadius.circular(10),
              ),
              child: FaIcon(
                item.icon,
                color: const Color(0xFF3168F6),
                size: 24,
              ),
            ),
            SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      fontSize: 15.5,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    item.subtitle,
                    style: GoogleFonts.poppins(
                      color: Colors.grey[600],
                      fontSize: 13.5,
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// DETAIL PAGE
// ==========================================
class DetailPanduanPage extends StatelessWidget {
  final String title;

  const DetailPanduanPage({super.key, required this.title});

  Widget buildStepList(List<String> steps) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(steps.length, (index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${index + 1}. ",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 14.5,
                ),
              ),
              Expanded(
                child: Text(
                  steps[index],
                  style: GoogleFonts.poppins(fontSize: 14.5, height: 1.6),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget buildBulletList(List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((text) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "• ",
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Expanded(
                child: Text(
                  text,
                  style: GoogleFonts.poppins(fontSize: 14.5, height: 1.6),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget getContentWidget(String title) {
    if (title == "Mengisi Jurnal") {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Panduan ini memberikan langkah-langkah rinci bagi siswa untuk mengisi jurnal harian, mengelola pekerjaan, mempelajari materi, dan mengelola poin yang diperoleh berdasarkan aktivitas yang dilakukan.",
            style: GoogleFonts.poppins(fontSize: 14.5, height: 1.6),
          ),
          const SizedBox(height: 20),
          Text(
            "A. Mengisi Jurnal Harian",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Colors.blue[900],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Jurnal adalah catatan harian yang berisi kegiatan yang dilakukan oleh siswa. Jurnal ini dapat diisi oleh siswa setiap hari. Berikut langkah-langkah mengisi jurnal:",
            style: GoogleFonts.poppins(fontSize: 14.5, height: 1.6),
          ),
          const SizedBox(height: 10),
          buildStepList([
            "Pilih menu Jurnal Pembiasaan pada sidebar.",
            "Bagian (A) adalah tabel untuk mengisi jurnal. Sesuaikan tanggal kegiatan, kemudian isi kegiatan yang dilakukan pada hari tersebut. Kemudian klik tombol Simpan yang akan muncul ketika selesai mengisi kegiatan untuk menyimpan jurnal yang telah diisi.",
          ]),
          Text(
            "*Jurnal yang sudah berlalu tidak dapat diedit.",
            style: GoogleFonts.poppins(
              color: Colors.red[700],
              fontStyle: FontStyle.italic,
              fontSize: 14.5,
            ),
          ),
          const SizedBox(height: 22),
          Text(
            "B. Pekerjaan yang dilakukan",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Colors.blue[900],
            ),
          ),
          Text(
            "Berikut adalah langkah-langkah untuk mengelola pekerjaan yang dilakukan:",
            style: GoogleFonts.poppins(fontSize: 14.5, height: 1.6),
          ),
          const SizedBox(height: 8),
          buildStepList([
            "Temukan Bagian ini pada halaman Jurnal Pembiasaan atau Klik di sini.",
            "Klik tombol + Tambah Pekerjaan untuk menambahkan pekerjaan baru.",
            "Isi form yang muncul dengan detail pekerjaan, tanggal, dan saksi.",
            "Klik tombol Simpan untuk menyimpan pekerjaan.",
            "Untuk mengedit atau menghapus pekerjaan, klik tombol Edit atau Delete pada pekerjaan yang diinginkan.",
          ]),
          const SizedBox(height: 22),
          Text(
            "C. Materi yang dipelajari",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Colors.blue[900],
            ),
          ),
          Text(
            "Berikut adalah langkah-langkah untuk mengelola materi yang dipelajari:",
            style: GoogleFonts.poppins(fontSize: 14.5, height: 1.6),
          ),
          const SizedBox(height: 8),
          buildStepList([
            "Temukan Bagian ini pada halaman Jurnal Pembiasaan atau Klik di sini.",
            "Klik tombol + Tambah Materi untuk menambahkan materi baru.",
            "Isi form yang muncul dengan detail materi, status, tanggal, dan catatan yang ingin disampaikan ke guru.",
            "Klik tombol Simpan untuk menyimpan materi.",
          ]),
          const SizedBox(height: 22),
          Text(
            "D. Poin",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Colors.blue[900],
            ),
          ),
          Text(
            "Berikut adalah langkah-langkah untuk mengelola poin:",
            style: GoogleFonts.poppins(fontSize: 14.5, height: 1.6),
          ),
          const SizedBox(height: 8),
          buildStepList([
            "Temukan Bagian ini pada halaman Jurnal Pembiasaan atau Klik di sini.",
            "Lihat kategori poin dan jumlah poin yang telah diperoleh.",
            "Poin ceklist pembiasaan akan ditampilkan secara otomatis berdasarkan aktivitas yang telah dilakukan.",
            "Jumlah keseluruhan poin akan ditampilkan di bagian bawah tabel poin.",
          ]),
        ],
      );
    }
    if (title == "Kelengkapan Profile") {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Panduan lengkap untuk melengkapi profil siswa dengan mengunggah dokumen penting dan menambahkan informasi media sosial.",
            style: GoogleFonts.poppins(fontSize: 14.5, height: 1.6),
          ),
          const SizedBox(height: 10),
          Text(
            "Untuk melengkapi profil Anda, klik nama/foto profil Anda di bagian atas halaman untuk membuka halaman profil.",
            style: GoogleFonts.poppins(fontSize: 14.5, height: 1.6),
          ),
          const SizedBox(height: 20),

          // ===== A. Mengunggah Dokumen =====
          Text(
            "A. Mengunggah Dokumen",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Colors.blue[900],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Di halaman profil Anda, scroll ke bawah hingga menemukan bagian "Dokumen".',
            style: GoogleFonts.poppins(fontSize: 14.5, height: 1.6),
          ),
          const SizedBox(height: 12),
          Text(
            "1. Upload CV (Curriculum Vitae)",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 14.5,
            ),
          ),
          const SizedBox(height: 6),
          buildBulletList([
            'Klik tombol "Upload CV" pada bagian Curriculum Vitae',
            'Pilih file CV Anda (format: PDF, DOC, DOCX, maksimal 4MB)',
            'File akan otomatis terupload setelah dipilih',
          ]),
          const SizedBox(height: 12),
          Text(
            "2. Upload Kartu Pelajar",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 14.5,
            ),
          ),
          const SizedBox(height: 6),
          buildBulletList([
            'Klik tombol "Upload Kartu Pelajar" pada bagian Kartu Pelajar',
            'Pilih foto/scan kartu pelajar Anda (format: PDF, JPG, PNG, maksimal 2MB)',
            'File akan otomatis terupload setelah dipilih',
            '*Kartu pelajar hanya dapat dilihat oleh Anda dan guru',
          ]),
          const SizedBox(height: 22),

          // ===== B. Mengelola Media Sosial =====
          Text(
            "B. Mengelola Media Sosial",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Colors.blue[900],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Di bagian "Media Sosial" pada halaman profil Anda:',
            style: GoogleFonts.poppins(fontSize: 14.5, height: 1.6),
          ),
          const SizedBox(height: 10),

          // Step 1–2
          buildStepList([
            'Klik tombol "Edit" di pojok kanan atas bagian Media Sosial.',
            'Modal "Edit Media Sosial" akan terbuka.',
          ]),

          // Step 3 dengan sub-bullet
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "3. ",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 14.5,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Isi informasi media sosial:",
                      style: GoogleFonts.poppins(fontSize: 14.5, height: 1.6),
                    ),
                    const SizedBox(height: 6),
                    buildBulletList([
                      'Nama Platform: Masukkan nama platform (Instagram, LinkedIn, GitHub, dll.)',
                      'URL: Masukkan link lengkap profil media sosial Anda.',
                    ]),
                  ],
                ),
              ),
            ],
          ),

          // Step 4–5
          buildStepList([
            'Untuk menambah platform lain, klik "Tambah Media Sosial".',
            'Klik "Simpan Perubahan" untuk menyimpan.',
          ]),
          const SizedBox(height: 22),

          // ===== C. Tips Penting =====
          Text(
            "C. Tips Penting",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Colors.blue[900],
            ),
          ),
          const SizedBox(height: 8),
          buildBulletList([
            'Pastikan file yang diupload tidak melebihi batas ukuran maksimal',
            'Gunakan URL lengkap untuk media sosial (dimulai dengan https://)',
            'Profil yang lengkap akan membantu guru dan teman-teman mengenal Anda lebih baik',
            'Periksa kembali informasi yang dimasukkan sebelum menyimpan',
          ]),
        ],
      );
    }

    if (title == "Mengelola Portfolio") {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Panduan ini memberikan langkah-langkah untuk menambah, mengedit, dan menghapus portfolio siswa.",
            style: GoogleFonts.poppins(fontSize: 14.5, height: 1.6),
          ),
          const SizedBox(height: 20),

          // ===== A. Menambah Portfolio Baru =====
          Text(
            "A. Menambah Portfolio Baru",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Colors.blue[900],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Berikut adalah langkah-langkah untuk menambahkan portfolio baru:",
            style: GoogleFonts.poppins(fontSize: 14.5, height: 1.6),
          ),
          const SizedBox(height: 10),
          buildStepList([
            'Buka profil Anda (klik foto profil atau nama Anda), kemudian klik tab Portfolio.',
            'Klik tombol + Tambah Portfolio.',
            'Isi form yang muncul dengan detail berikut:',
          ]),
          buildBulletList([
            'Judul Portfolio: Nama project/portfolio (wajib, maks 255 karakter)',
            'Deskripsi: Penjelasan detail tentang project (wajib)',
            'Durasi Pengerjaan: Waktu pengerjaan, contoh: "3 bulan", "2 minggu" (wajib, maks 255 karakter)',
            'Link Portfolio: URL project jika ada (opsional, harus URL valid)',
            'Gambar Portfolio: Screenshot atau foto project (opsional, maks 2MB)',
          ]),
          buildStepList(['Klik tombol Simpan untuk menyimpan portfolio.']),
          const SizedBox(height: 22),

          // ===== B. Mengedit Portfolio =====
          Text(
            "B. Mengedit Portfolio",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Colors.blue[900],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Berikut adalah langkah-langkah untuk mengedit portfolio:",
            style: GoogleFonts.poppins(fontSize: 14.5, height: 1.6),
          ),
          const SizedBox(height: 10),
          buildStepList([
            'Temukan portfolio yang ingin diedit pada halaman Portfolio.',
            'Klik ikon pensil (🖊️) pada card portfolio yang ingin diedit.',
            'Modal edit akan terbuka dengan data yang sudah terisi.',
            'Ubah data yang diperlukan sesuai kebutuhan.',
            'Klik tombol Update untuk menyimpan perubahan.',
          ]),
          const SizedBox(height: 22),

          // ===== C. Menghapus Portfolio =====
          Text(
            "C. Menghapus Portfolio",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Colors.blue[900],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Berikut adalah langkah-langkah untuk menghapus portfolio:",
            style: GoogleFonts.poppins(fontSize: 14.5, height: 1.6),
          ),
          const SizedBox(height: 10),
          buildStepList([
            'Temukan portfolio yang ingin dihapus pada halaman Portfolio.',
            'Klik ikon tempat sampah (🗑️) pada card portfolio.',
            'Konfirmasi penghapusan akan muncul.',
            'Klik tombol Ya, Hapus untuk menghapus portfolio.',
          ]),
          const SizedBox(height: 6),
          Text(
            "⚠️ Catatan Penting: Penghapusan portfolio bersifat permanen dan tidak dapat dibatalkan.",
            style: GoogleFonts.poppins(
              color: Colors.red[700],
              fontStyle: FontStyle.italic,
              fontSize: 14.5,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 22),

          // ===== D. Melihat Detail Portfolio =====
          Text(
            "D. Melihat Detail Portfolio",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Colors.blue[900],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Untuk melihat detail lengkap portfolio:",
            style: GoogleFonts.poppins(fontSize: 14.5, height: 1.6),
          ),
          const SizedBox(height: 10),
          buildStepList([
            'Klik tombol Lihat Detail pada card portfolio.',
            'Halaman detail akan menampilkan informasi lengkap termasuk:',
          ]),
          buildBulletList([
            'Gambar portfolio (dapat diklik untuk preview ukuran penuh)',
            'Judul dan deskripsi lengkap',
            'Durasi pengerjaan',
            'Link portfolio (jika tersedia)',
            'Tanggal dibuat',
            'Portfolio lainnya dari pemilik yang sama',
          ]),
          buildStepList([
            'Anda dapat mengedit atau menghapus portfolio langsung dari halaman detail jika Anda adalah pemiliknya.',
          ]),
          const SizedBox(height: 22),

          // ===== E. Tips Portfolio yang Baik =====
          Text(
            "E. Tips Portfolio yang Baik",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Colors.blue[900],
            ),
          ),
          Text(
            "Untuk membuat portofolio lebih berkualitas, perhatikan hal-hal berikut:",
            style: GoogleFonts.poppins(fontSize: 14.5, height: 1.6),
          ),
          const SizedBox(height: 8),
          buildBulletList([
            'Gunakan judul yang jelas dan menarik (maks 255 karakter).',
            'Tulis deskripsi yang detail dan informatif — deskripsi dapat mengandung line break untuk memudahkan pembacaan.',
            'Isi durasi pengerjaan dengan jelas, contoh: "2 minggu", "3 bulan".',
            'Sertakan link project yang valid jika tersedia online (GitHub, demo live, dll).',
            'Upload gambar dengan kualitas baik (format: JPEG, PNG, JPG, GIF, maks 2MB).',
            'Pastikan semua informasi akurat dan up-to-date.',
          ]),
          const SizedBox(height: 22),

          // ===== F. Troubleshooting =====
          Text(
            "F. Troubleshooting",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Colors.blue[900],
            ),
          ),
          Text(
            "Jika mengalami masalah saat mengelola portfolio:",
            style: GoogleFonts.poppins(fontSize: 14.5, height: 1.6),
          ),
          const SizedBox(height: 8),
          buildBulletList([
            'Modal tidak terbuka: Refresh halaman dan coba lagi.',
            'Error saat menyimpan: Periksa apakah semua field wajib sudah diisi dengan benar.',
            'Gambar tidak terupload: Pastikan ukuran gambar tidak melebihi 2MB dan format yang didukung (JPG, PNG, GIF).',
            'Link tidak valid: Pastikan URL dimulai dengan http:// atau https://.',
            'Deskripsi mengandung enter: Sistem sekarang mendukung line break, pastikan browser Anda sudah di-refresh jika masih mengalami masalah.',
          ]),
        ],
      );
    }

    if (title == "Mengelola Sertifikat") {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Panduan ini memberikan langkah-langkah untuk menambah, mengedit, dan menghapus sertifikat siswa.",
            style: GoogleFonts.poppins(fontSize: 14.5, height: 1.6),
          ),
          const SizedBox(height: 20),

          // ===== A. Menambah Sertifikat Baru =====
          Text(
            "A. Menambah Sertifikat Baru",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Colors.blue[900],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Berikut adalah langkah-langkah untuk menambahkan sertifikat baru:",
            style: GoogleFonts.poppins(fontSize: 14.5, height: 1.6),
          ),
          const SizedBox(height: 10),
          buildStepList([
            'Buka profil Anda (klik foto profil atau nama Anda), kemudian klik tab Sertifikat.',
            'Klik tombol + Tambah Sertifikat.',
            'Isi form yang muncul dengan detail berikut:',
          ]),
          buildBulletList([
            'Judul: Nama sertifikat (wajib, maks 255 karakter)',
            'Deskripsi: Penjelasan tentang sertifikat (opsional, maks 1000 karakter)',
            'File Sertifikat: Upload file sertifikat (wajib, maks 10MB)',
          ]),
          buildStepList(['Klik tombol Simpan untuk menyimpan sertifikat.']),
          Text(
            '*Format file yang didukung: JPEG, PNG, JPG, GIF, WEBP, PDF, DOC, DOCX (maks 10MB).',
            style: GoogleFonts.poppins(
              fontStyle: FontStyle.italic,
              fontSize: 14.5,
              height: 1.6,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 22),

          // ===== B. Mengedit Sertifikat =====
          Text(
            "B. Mengedit Sertifikat",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Colors.blue[900],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Berikut adalah langkah-langkah untuk mengedit sertifikat:",
            style: GoogleFonts.poppins(fontSize: 14.5, height: 1.6),
          ),
          const SizedBox(height: 10),
          buildStepList([
            'Temukan sertifikat yang ingin diedit pada tab Sertifikat di profil Anda.',
            'Klik ikon pensil (🖊️) pada card sertifikat yang ingin diedit.',
            'Modal edit akan terbuka dengan data yang sudah terisi.',
            'Ubah judul, deskripsi, atau ganti file jika diperlukan.',
            'Klik tombol Update untuk menyimpan perubahan.',
          ]),
          Text(
            '*Jika Anda mengganti file, file lama akan otomatis dihapus.',
            style: GoogleFonts.poppins(
              fontStyle: FontStyle.italic,
              fontSize: 14.5,
              height: 1.6,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 22),

          // ===== C. Melihat Sertifikat =====
          Text(
            "C. Melihat Sertifikat",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Colors.blue[900],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Berikut adalah cara melihat sertifikat berdasarkan jenis file:",
            style: GoogleFonts.poppins(fontSize: 14.5, height: 1.6),
          ),
          const SizedBox(height: 10),

          // Sub-bagian berdasarkan tipe file
          Text(
            "File Gambar (JPG, PNG, GIF, WEBP):",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 14.5,
            ),
          ),
          const SizedBox(height: 6),
          buildBulletList([
            'Klik pada gambar sertifikat untuk melihat preview dalam ukuran penuh.',
            'Modal preview akan terbuka dengan gambar yang dapat di-zoom.',
            'Klik tombol close atau area gelap di luar gambar untuk menutup preview.',
          ]),
          const SizedBox(height: 12),
          Text(
            "File PDF:",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 14.5,
            ),
          ),
          const SizedBox(height: 6),
          buildBulletList([
            'Klik tombol "Preview PDF" untuk melihat PDF dalam modal preview.',
            'Modal akan menampilkan PDF viewer dengan fitur download.',
            'Gunakan tombol download untuk menyimpan PDF ke perangkat Anda.',
          ]),
          const SizedBox(height: 12),
          Text(
            "File Dokumen (DOC/DOCX):",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 14.5,
            ),
          ),
          const SizedBox(height: 6),
          buildBulletList(['Klik tombol download untuk mengunduh file.']),
          const SizedBox(height: 10),
          Text(
            "Sertifikat Anda dapat dilihat oleh guru dan pengunjung profil publik Anda.",
            style: GoogleFonts.poppins(fontSize: 14.5, height: 1.6),
          ),
          const SizedBox(height: 22),

          // ===== D. Menghapus Sertifikat =====
          Text(
            "D. Menghapus Sertifikat",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Colors.blue[900],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Berikut adalah langkah-langkah untuk menghapus sertifikat:",
            style: GoogleFonts.poppins(fontSize: 14.5, height: 1.6),
          ),
          const SizedBox(height: 10),
          buildStepList([
            'Temukan sertifikat yang ingin dihapus pada tab Sertifikat.',
            'Klik ikon tempat sampah (🗑️) pada card sertifikat.',
            'Konfirmasi penghapusan akan muncul, baca peringatan dengan teliti.',
            'Klik tombol Ya, Hapus untuk menghapus sertifikat.',
          ]),
          const SizedBox(height: 6),
          Text(
            "⚠️ Catatan Penting: Penghapusan sertifikat bersifat permanen dan tidak dapat dibatalkan. File sertifikat juga akan dihapus dari server.",
            style: GoogleFonts.poppins(
              color: Colors.red[700],
              fontStyle: FontStyle.italic,
              fontSize: 14.5,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 22),

          // ===== E. Tips Sertifikat yang Baik =====
          Text(
            "E. Tips Sertifikat yang Baik",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Colors.blue[900],
            ),
          ),
          const SizedBox(height: 8),
          buildBulletList([
            'Gunakan nama sertifikat yang jelas dan spesifik.',
            'Sertakan nama lembaga/organisasi penerbit dalam judul atau deskripsi.',
            'Deskripsi dapat mengandung line break — gunakan untuk membuat poin-poin yang mudah dibaca.',
            'Gunakan resolusi gambar yang cukup agar teks terlihat jelas (minimal 1024px lebar).',
            'Format PDF lebih profesional dan universal untuk dokumen sertifikat.',
            'Tambahkan deskripsi untuk menjelaskan skill atau pencapaian yang diperoleh.',
            'Pastikan file tidak melebihi batas ukuran 10MB.',
          ]),
          const SizedBox(height: 22),

          // ===== F. Troubleshooting =====
          // ===== F. Troubleshooting =====
          Text(
            "F. Troubleshooting",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Colors.blue[900],
            ),
          ),
          const SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildBulletList([
                'Modal tidak terbuka: Pastikan JavaScript aktif di browser Anda, refresh halaman dan coba lagi.',
              ]),
              const SizedBox(height: 6),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "• ",
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Error saat upload:\nPeriksa ukuran file (maks 10MB), pastikan format file didukung (JPG, PNG, GIF, WEBP, PDF, DOC, DOCX), dan coba compress file jika terlalu besar.",
                      style: GoogleFonts.poppins(fontSize: 14.5, height: 1.6),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              buildBulletList([
                'Preview tidak muncul: Pastikan file sertifikat valid dan tidak corrupt.',
                'PDF tidak bisa dibuka: Gunakan browser modern (Chrome, Firefox, Edge) untuk preview PDF.',
                'Deskripsi dengan enter bermasalah: Sistem sekarang mendukung line break, refresh browser jika masih ada masalah.',
              ]),
            ],
          ),
        ],
      );
    }

    if (title == "Catatan Sikap Saya") {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Panduan untuk melihat dan memahami catatan sikap yang telah dilaporkan oleh guru.",
            style: GoogleFonts.poppins(fontSize: 14.5, height: 1.6),
          ),
          const SizedBox(height: 20),

          // ===== A. Mengakses Catatan Sikap =====
          Text(
            "A. Mengakses Catatan Sikap",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Colors.blue[900],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Untuk melihat catatan sikap Anda:",
            style: GoogleFonts.poppins(fontSize: 14.5, height: 1.6),
          ),
          const SizedBox(height: 10),
          buildStepList([
            'Login ke sistem menggunakan akun siswa Anda.',
            'Buka menu Catatan Sikap Saya dari sidebar atau dashboard.',
            'Halaman akan menampilkan semua catatan sikap yang pernah dilaporkan untuk Anda.',
          ]),
          const SizedBox(height: 22),

          // ===== B. Memahami Statistik Dashboard =====
          Text(
            "B. Memahami Statistik Dashboard",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Colors.blue[900],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Di bagian atas halaman, terdapat 3 card statistik:",
            style: GoogleFonts.poppins(fontSize: 14.5, height: 1.6),
          ),
          const SizedBox(height: 10),
          buildBulletList([
            'Total Catatan: Jumlah total catatan sikap yang pernah dilaporkan untuk Anda.',
            'Dalam Perbaikan: Catatan dengan status "Belum Ada Perubahan" atau "Mulai Ada Perubahan" (ditandai warna kuning).',
            'Sudah Berubah: Catatan dengan status "Sudah Berubah" - menunjukkan Anda telah berhasil memperbaiki sikap (ditandai warna hijau).',
          ]),
          const SizedBox(height: 8),
          Text(
            "✅ Target: Usahakan semua catatan mencapai status 'Sudah Berubah' dengan terus memperbaiki diri.",
            style: GoogleFonts.poppins(
              color: Colors.green[800],
              fontWeight: FontWeight.w600,
              fontSize: 14.5,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 22),

          // ===== C. Membaca Tabel Catatan =====
          Text(
            "C. Membaca Tabel Catatan",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Colors.blue[900],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Tabel catatan menampilkan informasi berikut:",
            style: GoogleFonts.poppins(fontSize: 14.5, height: 1.6),
          ),
          const SizedBox(height: 10),
          buildBulletList([
            'No: Nomor urut catatan.',
            'Kategori: Jenis catatan (Perbuatan, Sifat, atau Pembelajaran):',
          ]),
          buildBulletList([
            'Perbuatan - Tindakan atau perilaku yang dilakukan.',
            'Sifat - Karakter atau attitude.',
            'Pembelajaran - Terkait proses belajar.',
          ]),
          buildBulletList([
            'Catatan: Deskripsi detail temuan sikap/perilaku.',
            'Status: Status perkembangan perubahan Anda:',
          ]),
          buildBulletList([
            'Belum Ada Perubahan - Perlu segera diperbaiki.',
            'Mulai Ada Perubahan - Sudah ada perbaikan, pertahankan!',
            'Sudah Berubah - Berhasil berubah positif.',
          ]),
          buildBulletList([
            'Dilaporkan: Tanggal dan waktu catatan pertama kali dibuat.',
            'Update Terakhir: Tanggal dan waktu terakhir status di-update oleh guru.',
          ]),
          const SizedBox(height: 22),

          // ===== D. Melihat Riwayat Perubahan =====
          Text(
            "D. Melihat Riwayat Perubahan",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Colors.blue[900],
            ),
          ),
          const SizedBox(height: 8),
          buildStepList([
            'Pada tabel, klik ikon jam (🕒) di kolom Aksi pada catatan yang ingin dilihat.',
            'Modal riwayat akan terbuka menampilkan timeline perubahan dengan:',
          ]),
          buildBulletList([
            'Badge Status: Menunjukkan status dengan warna (merah/kuning/hijau).',
            'Waktu Update: Kapan update dilakukan (misal: "2 hari yang lalu").',
            'Nama Guru/Updater: Siapa yang melakukan evaluasi perubahan.',
            'Deskripsi: Catatan detail tentang perkembangan Anda.',
          ]),
          const SizedBox(height: 6),
          Text(
            "💡 Gunakan riwayat ini untuk memahami perkembangan Anda dan area yang masih perlu diperbaiki.",
            style: GoogleFonts.poppins(
              color: Colors.orange[800],
              fontStyle: FontStyle.italic,
              fontSize: 14.5,
              height: 1.6,
            ),
          ),
          buildStepList([
            'Timeline ditampilkan dari yang terbaru ke yang terlama dengan garis penghubung visual',
          ]),
          const SizedBox(height: 22),

          // ===== E. Menanggapi Catatan Sikap =====
          // ===== E. Menanggapi Catatan Sikap =====
          Text(
            "E. Menanggapi Catatan Sikap",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Colors.blue[900],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Yang harus Anda lakukan setelah menerima catatan sikap:",
            style: GoogleFonts.poppins(fontSize: 14.5, height: 1.6),
          ),
          const SizedBox(height: 10),
          buildStepList([
            'Baca dengan Seksama: Pahami catatan yang diberikan oleh guru.',
            'Refleksi Diri: Renungkan perilaku Anda dan akui jika ada kesalahan.',
            'Buat Rencana Perbaikan: Tentukan langkah konkrit untuk memperbaiki diri.',
            'Konsultasi: Jika perlu, konsultasi dengan guru BK atau wali kelas.',
            'Tindak Lanjut: Terapkan perubahan positif dalam keseharian.',
            'Pantau Perkembangan: Cek berkala status catatan Anda.',
            'Pertahankan: Jaga konsistensi perilaku positif.',
          ]),
          const SizedBox(height: 22),

          // ===== F. Tips Perbaikan Diri =====
          Text(
            "F. Tips Perbaikan Diri",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Colors.blue[900],
            ),
          ),
          Text(
            "Cara efektif untuk memperbaiki sikap dan perilaku:",
            style: GoogleFonts.poppins(fontSize: 14.5, height: 1.6),
          ),
          const SizedBox(height: 8),
          buildBulletList([
            'Jujur pada Diri Sendiri: Akui kesalahan sebagai langkah awal perbaikan.',
            'Minta Maaf: Jika ada pihak yang dirugikan, minta maaf dengan tulus.',
            'Konsisten: Terapkan perubahan positif secara konsisten, bukan hanya sementara.',
            'Cari Dukungan: Minta bantuan teman, guru, atau orang tua untuk mendukung perubahan Anda.',
            'Evaluasi Berkala: Lihat perkembangan Anda melalui riwayat update status.',
            'Jangan Menyerah: Perubahan membutuhkan waktu, tetap semangat!',
          ]),
          const SizedBox(height: 22),

          // ===== G. Memahami Kategori Catatan =====
          Text(
            "G. Memahami Kategori Catatan",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Colors.blue[900],
            ),
          ),
          Text(
            "Penjelasan detail setiap kategori catatan:",
            style: GoogleFonts.poppins(fontSize: 14.5, height: 1.6),
          ),
          const SizedBox(height: 8),
          buildBulletList([
            'Perbuatan (Merah): Tindakan atau perilaku fisik yang dilakukan. Contoh: berkelahi, merusak fasilitas, membolos, dll. Biasanya memerlukan perhatian segera.',
            'Sifat (Orange): Karakter, sikap, atau attitude yang ditunjukkan. Contoh: tidak sopan, tidak disiplin, egois, dll. Perlu perbaikan karakter jangka panjang.',
            'Pembelajaran (Biru): Terkait dengan proses dan sikap belajar. Contoh: malas mengerjakan tugas, mengganggu kelas, tidak fokus, dll. Berdampak pada prestasi akademik.',
          ]),
          const SizedBox(height: 22),

          // ===== H. Hak dan Kewajiban =====
          Text(
            "H. Hak dan Kewajiban",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Colors.blue[900],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Yang perlu Anda ketahui:",
            style: GoogleFonts.poppins(fontSize: 14.5, height: 1.6),
          ),
          const SizedBox(height: 8),
          Text(
            "Hak Anda:",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 14.5,
            ),
          ),
          buildBulletList([
            'Melihat semua catatan sikap yang dilaporkan untuk Anda.',
            'Mengetahui perkembangan perubahan melalui riwayat update.',
            'Mendapat evaluasi yang objektif dan adil.',
            'Berkonsultasi dengan guru terkait catatan yang diterima.',
          ]),
          const SizedBox(height: 8),
          Text(
            "Kewajiban Anda:",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 14.5,
            ),
          ),
          buildBulletList([
            'Membaca dan memahami setiap catatan yang diberikan.',
            'Melakukan introspeksi dan perbaikan diri.',
            'Menghormati evaluasi guru.',
            'Tidak mengulangi kesalahan yang sama.',
            'Menunjukkan perubahan positif yang konsisten.',
          ]),
          const SizedBox(height: 6),
          Text(
            "📌 Catatan: Anda hanya bisa melihat, tidak bisa mengedit atau menghapus catatan. Hanya guru yang bisa meng-update status perubahan.",
            style: GoogleFonts.poppins(
              color: Colors.red[700],
              fontStyle: FontStyle.italic,
              fontSize: 14.5,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 22),

          // ===== I. FAQ =====
          Text(
            "I. FAQ (Pertanyaan Umum)",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Colors.blue[900],
            ),
          ),
          const SizedBox(height: 8),
          buildBulletList([
            'Q: Apakah orang tua bisa melihat catatan sikap saya?\nA: Ya, sistem ini dirancang transparan agar orang tua juga dapat memantau perkembangan sikap anak melalui rapor atau laporan berkala.',
            'Q: Berapa lama waktu yang dibutuhkan untuk mengubah status dari "Belum Ada Perubahan" ke "Sudah Berubah"?\nA: Tidak ada waktu pasti. Tergantung konsistensi perubahan positif yang Anda tunjukkan. Guru akan meng-update status saat melihat perkembangan nyata.',
            'Q: Apa yang harus dilakukan jika saya merasa catatan tidak adil?\nA: Konsultasikan dengan guru yang membuat catatan atau wali kelas Anda secara langsung dengan sikap terbuka dan tidak defensif.',
            'Q: Apakah catatan sikap mempengaruhi nilai rapor?\nA: Ya, catatan sikap biasanya berpengaruh pada nilai sikap/kepribadian di rapor. Semakin baik sikap Anda, semakin baik nilai sikap Anda.',
          ]),
        ],
      );
    }

    // Default lama tetap dipakai
    return Text(
      getContent(title),
      style: GoogleFonts.poppins(fontSize: 14.5, height: 1.6),
    );
  }

  String getContent(String title) {
    if (title == "Unggah Profile") {
      return "Halaman ini memberikan panduan langkah demi langkah untuk "
          "mengunggah foto profil pengguna. Pengguna diinstruksikan untuk "
          "mengakses bagian Pengaturan Akun, mengisi field Unggah Photo Profile, "
          "dan menyimpan perubahan yang telah dilakukan.\n\n"
          "1. Klik pada bagian Pengaturan Akun\n"
          "2. Lalu isi field Unggah Photo Profile\n"
          "3. Jika sudah, klik Simpan";
    }

    if (title == "Ganti Password") {
      return "Halaman ini berisi panduan langkah demi langkah untuk mengganti password akun Anda. "
          "Ikuti instruksi yang diberikan untuk memastikan bahwa password baru Anda berhasil disimpan dan akun Anda tetap aman.\n\n"
          "1. Klik pada bagian Pengaturan Akun,\n"
          "2. lalu isi field Password baru\n"
          "3. jika sudah, lalu klik Simpan\n";
    }

    return "Belum ada panduan untuk menu ini.";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Row(
                  children: const [
                    Icon(Icons.arrow_back, size: 20),
                    SizedBox(width: 4),
                    Text(
                      "Kembali ke Panduan Penggunaan",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  const Icon(
                    Icons.menu_book_outlined,
                    size: 28,
                    color: Color(0xFF1B3B8B),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "Panduan Penggunaan",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF1B3B8B),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF1B3B8B),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(child: getContentWidget(title)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ==========================================
// HALAMAN PLACEHOLDER
// ==========================================
class PlaceholderPage extends StatelessWidget {
  final String title;

  const PlaceholderPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Center(
        child: Text("$title Page", style: GoogleFonts.poppins(fontSize: 20)),
      ),
    );
  }
}
