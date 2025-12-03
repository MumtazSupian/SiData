import 'package:flutter/material.dart';
import 'package:sidata_app/widgets/appbar.dart';

class StudentBehavior extends StatelessWidget {
  const StudentBehavior({super.key});

  @override
  Widget build(BuildContext context) {
    // === 3 DATA DUMMY SESUAI TABEL DI GAMBAR ===
    final List<Map<String, dynamic>> behaviorData = [
      {
        "no": 1,
        "kategori": "Kerapian",
        "catatan": "Sering tidak memakai atribut lengkap",
        "status": "Dalam Perbaikan",
        "laporkan": "12 Jan 2025",
        "update": "15 Jan 2025",
      },
      {
        "no": 2,
        "kategori": "Sikap",
        "catatan": "Kurang fokus saat pembelajaran",
        "status": "Belum Ditindak",
        "laporkan": "10 Jan 2025",
        "update": "10 Jan 2025",
      },
      {
        "no": 3,
        "kategori": "Disiplin",
        "catatan": "Sering terlambat masuk kelas",
        "status": "Sudah Berubah",
        "laporkan": "05 Jan 2025",
        "update": "20 Jan 2025",
      },
    ];

    return Scaffold(
      appBar: const AppbarProp(),
      backgroundColor: const Color(0xFFF4F6F9),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: ListView(
          children: [
            Text(
              "Catatan Sikap Siswa",
              style: TextStyle(
                fontSize: 31,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1E293B),
              ),
            ),

            SizedBox(height: 10),

            Text(
              "Lihat catatan sikap dan perilaku yang telah\ndilaporkan",
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF475569),
                height: 1.4,
              ),
            ),

            SizedBox(height: 20),

            // === CARD PERHATIAN ===
            Card(
              elevation: 0,
              color: Color(0xFFFFFBEB),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                side: BorderSide(color: Color(0xFFFCD34D), width: 2),
              ),
              child: Padding(
                padding: EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.warning_amber_rounded,
                          color: Color(0xFFDC2626),
                          size: 28,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Perhatian",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1E293B),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Jika Anda merasa ada catatan yang tidak\n"
                      "sesuai atau keliru, silahkan hubungi guru\n"
                      "jurusan untuk mengajukan klarifikasi.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF475569),
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),

            // === STATISTIC CARDS ===
            _buildStatCard(
              "Total Catatan",
              "0",
              Color(0xFFE8F0FF),
              Icons.description,
              Color(0xFF3B82F6),
            ),
            SizedBox(height: 20),

            _buildStatCard(
              "Dalam Perbaikan",
              "0",
              Color(0xFFFEF9C3),
              Icons.bolt_sharp,
              Color(0xFFCA8A04),
            ),
            SizedBox(height: 20),

            _buildStatCard(
              "Sudah Berubah",
              "0",
              Color(0xFFDCFCE7),
              Icons.check_circle_outline,
              Color(0xFF16A34A),
            ),
            SizedBox(height: 25),

            // ===============================================================
            // ======================= TABLE SECTION =========================
            // ===============================================================
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Color(0xFFE0E0E0)),
              ),
              child: Column(
                children: [
                  // HEADER
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 20,
                    ),
                    decoration: const BoxDecoration(
                      color: Color(0xFFF8FAFC),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                    child: Row(
                      children: const [
                        SizedBox(
                          width: 40,
                          child: Text(
                            "NO",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "KATEGORI",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "CATATAN",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "STATUS",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "DILAPORKAN",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "UPDATE TERAKHIR",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          width: 70,
                          child: Text(
                            "AKSI",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // DATA ROWS
                  ...behaviorData.map((item) {
                    return ExpansionTile(
                      tilePadding: const EdgeInsets.symmetric(horizontal: 20),
                      childrenPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),

                      title: Row(
                        children: [
                          SizedBox(width: 40, child: Text("${item['no']}")),
                          Expanded(
                            child: Text(
                              item['kategori'],
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              item['catatan'],
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              item['status'],
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Expanded(child: Text(item['laporkan'])),
                          Expanded(child: Text(item['update'])),
                          const SizedBox(
                            width: 70,
                            child: Icon(Icons.more_horiz),
                          ),
                        ],
                      ),

                      // EXPANDED CONTENT
                      children: [
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Color(0xFFF1F5F9),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Detail Catatan",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1E293B),
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                item['catatan'],
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF475569),
                                ),
                              ),
                              SizedBox(height: 15),
                              ElevatedButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.edit, size: 18),
                                label: Text("Edit Catatan"),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF3B82F6),
                                  foregroundColor: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }),

                  SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ===============================================================
  // Reusable statistic card
  Widget _buildStatCard(
    String title,
    String value,
    Color bg,
    IconData icon,
    Color iconColor,
  ) {
    return Card(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Color(0xFFE0E0E0), width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF1E293B),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    value,
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(color: bg, shape: BoxShape.circle),
              child: Icon(icon, color: iconColor, size: 28),
            ),
          ],
        ),
      ),
    );
  }
}
