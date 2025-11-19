import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemData {
  final String title;
  final String subtitle;
  final IconData icon; // tetap IconData (FontAwesome juga IconData)

  ItemData({
    required this.title,
    required this.subtitle,
    required this.icon,
  });
}

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

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        titleSpacing: 0,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: FaIcon(
                FontAwesomeIcons.house,
                color: Colors.black87,
                size: 20,
              ),
            ),

            Spacer(),

            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Go Min-Si",
                  style: GoogleFonts.poppins(
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.5,
                  ),
                ),
                Text(
                  "Fineshyt",
                  style: GoogleFonts.poppins(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
              ],
            ),

            SizedBox(width: 10),

            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage("assets/images/minsi.jpg"),
            ),
            SizedBox(width: 6),
          ],
        ),
      ),

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
              children: umumItems
                  .map((e) => Padding(
                        padding: const EdgeInsets.only(bottom: 14),
                        child: GuideItem(item: e),
                      ))
                  .toList(),
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
              children: untukSiswaItems
                  .map((e) => Padding(
                        padding: const EdgeInsets.only(bottom: 14),
                        child: GuideItem(item: e),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

// ===================================================
// ITEM CARD YANG SUDAH PAKAI FONT AWESOME
// ===================================================
class GuideItem extends StatelessWidget {
  final ItemData item;
  GuideItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
