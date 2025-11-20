import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class PermintaanSaksiPage extends StatefulWidget {
  const PermintaanSaksiPage({super.key});

  @override
  State<PermintaanSaksiPage> createState() => _PermintaanSaksiPageState();
}

class _PermintaanSaksiPageState extends State<PermintaanSaksiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        titleSpacing: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(height: 1, color: Colors.grey),
        ),

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

      body: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Permintaan Saksi",
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 15),

            Row(
              children: [
                Text(
                  "Kelola permintaan menjadi saksi dari siswa lain",
                  overflow: TextOverflow.fade,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                Spacer(),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFF5FF), 
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Thursday, 20 November 2025",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Color(0xFF1A73E8), // biru teks seperti gambar
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.withOpacity(0.3)),
              ),
              child: Column(
                children: [
                  // HEADER TABLE
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 14),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8F9FB),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "PENGIRIM",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Colors.grey[700],
                          ),
                        ),
                        Text(
                          "TANGGAL",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Colors.grey[700],
                          ),
                        ),
                        Text(
                          "KONFIRMASI",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(height: 1, color: Colors.grey.withOpacity(0.25)),

                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 50),
                    child: Column(
                      children: [
                        Icon(
                          Icons.group_outlined,
                          size: 48,
                          color: Colors.grey[400],
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Belum ada permintaan",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "Belum ada yang mengirim permintaan saksi kepada Anda",
                          style: GoogleFonts.poppins(color: Colors.grey[600]),
                        ),
                      ],
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
