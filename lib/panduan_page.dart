import 'package:flutter/material.dart';

// Model data panduan
class ItemData {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconBgColor;
  final Color iconColor;

  ItemData({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconBgColor,
    required this.iconColor,
  });
}

class PanduanPage extends StatelessWidget {
  // Data untuk bagian "Umum" (Panduan Penggunaan)
  final List<ItemData> umumItems = [
    ItemData(
      title: 'Unggah Profile',
      subtitle: 'Panduan untuk mengunggah profile pengguna',
      icon: Icons.calendar_today,
      iconBgColor: Color(0xFFD7E4FD),
      iconColor: Color(0xFF3168F6),
    ),
    ItemData(
      title: 'Ganti Password',
      subtitle: 'Panduan untuk mengganti password pengguna',
      icon: Icons.calendar_today,
      iconBgColor: Color(0xFFD7E4FD),
      iconColor: Color(0xFF3168F6),
    ),
  ];

  // Data untuk bagian "Untuk Siswa"
  final List<ItemData> untukSiswaItems = [
    ItemData(
      title: 'Mengisi Jurnal',
      subtitle: 'Panduan untuk mengisi kegiatan sehari-hari',
      icon: Icons.calendar_today,
      iconBgColor: Color(0xFFD7E4FD),
      iconColor: Color(0xFF3168F6),
    ),
    ItemData(
      title: 'Kelengkapan Profile',
      subtitle: 'Panduan untuk melengkapi profile',
      icon: Icons.calendar_today,
      iconBgColor: Color(0xFFD7E4FD),
      iconColor: Color(0xFF3168F6),
    ),
    ItemData(
      title: 'Mengelola Portfolio',
      subtitle: 'Panduan untuk menambah, edit, dan hapus portfolio',
      icon: Icons.photo,
      iconBgColor: Color(0xFFD7E4FD),
      iconColor: Color(0xFF3168F6),
    ),
    ItemData(
      title: 'Mengelola Sertifikat',
      subtitle: 'Panduan untuk menambah, edit, dan hapus sertifikat',
      icon: Icons.verified,
      iconBgColor: Color(0xFFD7E4FD),
      iconColor: Color(0xFF3168F6),
    ),
    ItemData(
      title: 'Catatan Sikap Saya',
      subtitle: 'Panduan untuk melihat dan memahami catatan sikap',
      icon: Icons.info,
      iconBgColor: Color(0xFFD7E4FD),
      iconColor: Color(0xFF3168F6),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Muhammad Mumtaz Supian',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'PPLG XII-5',
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  ),
                ],
              ),
            ),
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/images/profile_photo.jpg'),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bagian Panduan Penggunaan terlebih dahulu
            Row(
              children: [
                Icon(Icons.menu_book, color: Color(0xFF1B3B8B), size: 26),
                SizedBox(width: 6),
                Text(
                  'Panduan Penggunaan',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1B3B8B),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Text(
              'Selamat datang di panduan penggunaan aplikasi Jurnalku. Panduan ini akan membantu Anda memahami cara menggunakan fitur-fitur yang tersedia dengan optimal.',
              style: TextStyle(
                fontSize: 14,
                height: 1.5,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Umum',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 12),
            Column(
              children: umumItems.map((item) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: GuideItemWidget(item: item),
              )).toList(),
            ),

            SizedBox(height: 32),

            // Bagian Untuk Siswa setelahnya
            Text(
              'Untuk Siswa',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 12),
            Column(
              children: untukSiswaItems.map((item) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: GuideItemWidget(item: item),
              )).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class GuideItemWidget extends StatelessWidget {
  final ItemData item;

  GuideItemWidget({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(12),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: item.iconBgColor,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.all(8),
            child: Icon(item.icon, color: item.iconColor, size: 28),
          ),
          SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.title, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                SizedBox(height: 2),
                Text(item.subtitle, style: TextStyle(color: Colors.grey[600], fontSize: 14)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}