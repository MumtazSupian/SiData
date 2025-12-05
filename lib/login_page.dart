import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sidata_app/dashboard.dart';
import 'profile.dart';
import 'explore.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Color bg = const Color(0xFFF4F6F9);

    return Scaffold(
      backgroundColor: bg,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Explore()),
          );
        },

        label: Text(
          "Jelajahi Siswa",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        icon: const Icon(Icons.explore, color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 22, 25, 130),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // HEADER IMAGE
            Image.asset(
              "assets/images/header.jpg",
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            const SizedBox(height: 20),

            // FORM LOGIN
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                      children: const [
                        TextSpan(text: "Masuk untuk memulai "),
                        TextSpan(
                          text: "Jurnalku",
                          style: TextStyle(
                            color: Color.fromARGB(255, 22, 25, 130),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),

                  Text("Username atau NIS", style: GoogleFonts.poppins()),
                  const SizedBox(height: 5),
                  TextField(
                    style: GoogleFonts.poppins(),
                    decoration: InputDecoration(
                      hintText: "Masukkan username atau NIS",
                      hintStyle: GoogleFonts.poppins(),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  Text("Password", style: GoogleFonts.poppins()),
                  const SizedBox(height: 5),
                  TextField(
                    obscureText: true,
                    style: GoogleFonts.poppins(),
                    decoration: InputDecoration(
                      hintText: "Masukkan password",
                      hintStyle: GoogleFonts.poppins(),
                      suffixIcon: const Icon(Icons.visibility),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Dashboard(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 22, 25, 130),
                        padding: const EdgeInsets.all(14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        "Masuk",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),
                  Center(
                    child: Text(
                      "Lupa password? Hubungi guru laboran.",
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 150),

            // JUDUL FITUR
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: Text(
                  "Menyatukan Upaya untuk Kemajuan \nSiswa",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Jurnalku adalah aplikasi cerdas yang membantu \nguru dan siswa "
                "dalam memantau dan \nmengelola kompetensi keahlian siswa secara \nefektif.",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.grey.shade700,
                ),
              ),
            ),

            const SizedBox(height: 25),

            // FEATURE LIST
            _buildFeature(
              icon: Icons.school,
              bgColor: Colors.yellow.shade100,
              title: "Dirancang untuk Sekolah Kami",
              description:
                  "Dikembangkan khusus untuk memenuhi \nkebutuhan sekolah kami dengan fokus \npada kemajuan siswa kami.",
              background: bg,
            ),
            _buildFeature(
              icon: Icons.grid_view_rounded,
              bgColor: Colors.purple.shade100,
              title: "Pemantauan yang Terstruktur",
              description:
                  "Memudahkan guru dalam menyusun \ndan memantau kompetensi \nkeahlian yang harus dikuasai siswa.",
              background: bg,
            ),
            _buildFeature(
              icon: Icons.auto_graph_rounded,
              bgColor: Colors.blue.shade100,
              title: "Fitur Praktis dan Bermanfaat",
              description:
                  "Termasuk reminder otomatis, grafik \nperkembangan, dan analisis mendalam \nuntuk efektivitas belajar.",
              background: bg,
            ),
            _buildFeature(
              icon: Icons.assignment_turned_in_rounded,
              bgColor: Colors.orange.shade100,
              title: "Pengajuan Kompetensi oleh Siswa",
              description:
                  "Siswa dapat mengajukan kompetensi \nyang telah dikuasai untuk diverifikasi \noleh guru.",
              background: bg,
            ),
            _buildFeature(
              icon: Icons.verified_rounded,
              bgColor: Colors.green.shade100,
              title: "Validasi dan Tanda Tangan Guru",
              description:
                  "Setiap kompetensi yang disetujui akan \ndiberikan tanda terima dan tanda tangan \nguru sebagai bukti.",
              background: bg,
            ),
            _buildFeature(
              icon: Icons.monitor_heart_rounded,
              bgColor: Colors.pink.shade100,
              title: "Pantauan Real-Time dan Transparan",
              description:
                  "Monitoring langsung, menciptakan \nlingkungan belajar yang efisien.",
              background: bg,
            ),
            const SizedBox(height: 30),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 30),
              color: const Color.fromARGB(255, 22, 25, 130),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      FaIcon(
                        FontAwesomeIcons.whatsapp,
                        color: Colors.white,
                        size: 28,
                      ),
                      SizedBox(width: 18),
                      FaIcon(
                        FontAwesomeIcons.instagram,
                        color: Colors.white,
                        size: 28,
                      ),
                      SizedBox(width: 18),
                      FaIcon(
                        FontAwesomeIcons.linkedin,
                        color: Colors.white,
                        size: 28,
                      ),
                      SizedBox(width: 18),
                      FaIcon(
                        FontAwesomeIcons.youtube,
                        color: Colors.white,
                        size: 28,
                      ),
                    ],
                  ),

                  SizedBox(height: 20),
                  Text(
                    "© GEN-28 PPLG SMK Wikrama Bogor. All Rights \nReserved.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: Colors.white,
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

  // FEATURE CARD
  Widget _buildFeature({
    required IconData icon,
    required Color bgColor,
    required String title,
    required String description,
    required Color background,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: background, // bukan putih lagi — menyatu dengan body
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE2E4E7), width: 1.3),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ICON
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: 28),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.grey.shade700,
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