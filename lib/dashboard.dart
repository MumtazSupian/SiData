import 'package:flutter/material.dart';
import 'package:sidata_app/widgets/appbar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override

  

  Widget build(BuildContext context) {

    double cardWidth = (MediaQuery.of(context).size.width / 2) - 24;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),

      appBar: const AppbarProp(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20), // <-- BIAR GAMBAR IKUT ROUNDED
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        "assets/images/hdb1.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
            
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Selamat Datang di Jurnalku",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  color: Colors.black54,
                                  blurRadius: 6,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "Solusi cerdas untuk memantau perkembangan kompetensi siswa secara efektif",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                shadows: [
                                  Shadow(
                                    color: Colors.black54,
                                    blurRadius: 6,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            //Card section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 54, 34, 209), 
                    Color.fromARGB(255, 24, 10, 98), 
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column( 
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Apa itu Jurnalku?",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Jurnalku adalah aplikasi cerdas yang membantu guru dan siswa dalam memantau dan mengelola kompetensi keahlian siswa secara efektif, terstruktur, dan real-time. Dengan fitur lengkap, proses pemantauan menjadi lebih mudah dan transparan.",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon( Icons.school_outlined, color: Colors.black, size: 24),

                  SizedBox(height: 8),

                  Text(
                    "Dirancang Khusus",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Memenuhi kebutuhan spesifik sekolah kami dengan fokus pada kemajuan siswa.",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),

                ],
              ),
            ),
          SizedBox(height: 8,),

          Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon( Icons.school_outlined, color: Colors.black, size: 24),

                  SizedBox(height: 8),

                  Text(
                    "Efektif",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Memudahkan siswa dan guru melihat perkembangan secara real-time.",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(height: 8,),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon( Icons.school_outlined, color: Colors.black, size: 24),

                  SizedBox(height: 8),

                  Text(
                    "Terintegrasi",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),  
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Pengajuan kompetensi siswa, validasi dan laporan perkembangan yang transparan.",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(height: 8,),
            Divider(color: Colors.grey,),
            SizedBox(height: 15,),
            Align(
            alignment: Alignment.centerLeft,
            child: Text("MENU APLIKASI",
                style: TextStyle(
                  fontSize: 20,
                  color: const Color.fromARGB(255, 86, 84, 84),
                  fontWeight: FontWeight.bold,
                ),  
              ),
            ), 

            SizedBox(height: 8,),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),

                  _buildMenuItem(
                    icon: Icons.person,
                    title: "Profil",
                    subtitle: "Lihat dan kelola profilmu di sini.",
                  ),

                  Divider(height: 30, color: Colors.grey.shade300),

                  
                  _buildMenuItem(
                    icon: Icons.work_outline,
                    title: "Portofolio",
                    subtitle: "Lihat dan kelola portofoliomu di sini.",
                  ),

                  Divider(height: 30, color: Colors.grey.shade300),

                  
                  _buildMenuItem(
                    icon: Icons.auto_awesome,
                    title: "Sertifikat",
                    subtitle: "Lihat dan unduh sertifikatmu di sini.",
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),

            // menu apk pt 2
            Container(
              
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),

                  
                  _buildMenuItem(
                    icon: Icons.book,
                    title: "Jurnal Pembiasaan",
                    subtitle: "Catat dan pantau kegiatan pembiasaan harianmu.",
                  ),

                  Divider(height: 30, color: Colors.grey.shade300),

                  
                  _buildMenuItem(
                    icon: Icons.people,
                    title: "Permintaan Saksi",
                    subtitle: "Lihat teman yang mengajukan permintaan saksi.",
                  ),

                  Divider(height: 30, color: Colors.grey.shade300),

                  
                  _buildMenuItem(
                    icon: Icons.bar_chart,
                    title: "Progress",
                    subtitle: "Lihat kemajuan kompetensi dan pencapaian belajarmu.",
                  ),

                  Divider(height: 30, color: Colors.grey.shade300),

                  _buildMenuItem(
                    icon: Icons.note_add,
                    title: "Catatan Sikap",
                    subtitle: "Lihat catatan sikap dan perilaku dari guru.",
                  )
                ],
              ),
            ),

            SizedBox(height: 30,),
            Align(
            alignment: Alignment.centerLeft,
            child: Text("STATISTIK KOMPETENSI",
                style: TextStyle(
                  fontSize: 20,
                  color: const Color.fromARGB(255, 86, 84, 84),
                  fontWeight: FontWeight.bold,
                ),  
              ),
            ), 
            SizedBox(height: 10,),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                _buildStatCard(
                  title: "Materi Diselesaikan",
                  count: "0",
                  label: "Selesai",
                  icon: Icons.check_circle,
                  color: Colors.green,
                  width: cardWidth,
                ),
                _buildStatCard(
                  title: "Pengajuan Pending",
                  count: "0",
                  label: "Pending",
                  icon: Icons.access_time,
                  color: Colors.orange,
                  width: cardWidth,
                ),
                _buildStatCard(
                  title: "Materi Hari Ini",
                  count: "0",
                  label: "Hari Ini",
                  icon: Icons.calendar_today,
                  color: Colors.blue,
                  width: cardWidth,
                ),
                _buildStatCard(
                  title: "Materi Revisi",
                  count: "0",
                  label: "Revisi",
                  icon: Icons.refresh,
                  color: Colors.purple,
                  width: cardWidth,
                ),
              ],
            ),
            SizedBox(height: 30,),
            //Progress
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Progress Akademik",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
      SizedBox(height: 20),

      // Grid 2x2
      GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 4,
        ),
        children: [
          // Selesai
          Row(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 8),
              Text("Selesai"),
              Spacer(),
              Text("0"),
              Spacer(),
            ],
          ),

          // Pending
          Row(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: Colors.indigo,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 8),
              Text("Pending"),
              Spacer(),
              Text("0"),
              Spacer(),
            ],
          ),

          // Belum
          Row(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 8),
              Text("Belum"),
              Spacer(),
              Text("0"),
              Spacer(),
            ],
          ),

          // Hari Ini
          Row(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 8),
              Text("Hari Ini"),
              Spacer(),
              Text("0"),
              Spacer(),
            ],
          ),
        ],
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

Widget _buildMenuItem({
  required IconData icon,
  required String title,
  required String subtitle,

}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Icon Rounded Background
      Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFFE9F1FF),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: Color(0xFF2B63F1),
          size: 26,
        ),
      ),
      const SizedBox(width: 16),

      // Text section
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),

      // Arrow kanan
      const Icon(
        Icons.arrow_forward_ios,
        size: 18,
        color: Color(0xFF2B63F1),
      ),
    ],
  );
}

Widget _buildStatCard({
  required String title,
  required String count,
  required String label,
  required IconData icon,
  required Color color,
  required double width,
}) {
  return Container(
    width: width,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 6,
          offset: Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Judul
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 12),

        // Counter + Icon
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              count,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            CircleAvatar(
              radius: 22,
              backgroundColor: color.withOpacity(0.15),
              child: Icon(
                icon,
                color: color,
                size: 24,
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        // Label bawah
        Row(
          children: [
            Icon(Icons.circle, size: 10, color: color),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: color,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
