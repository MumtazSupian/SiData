import 'package:flutter/material.dart';
import 'package:sidata_app/widgets/appbar.dart';

class StudentBehavior extends StatelessWidget {
  const StudentBehavior({super.key});

  @override
  Widget build(BuildContext context) {
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

            // behavior card
            Card(
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
                        children: const [
                          Text(
                            "Total Catatan",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF1E293B),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),

                          Text(
                            "0",
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
                      decoration: const BoxDecoration(
                        color: Color(0xFFE8F0FF),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.description,
                        color: Color(0xFF3B82F6),
                        size: 28,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),

            // under development card
            Card(
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
                        children: const [
                          Text(
                            "Dalam Perbaikan",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF1E293B),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),

                          Text(
                            "0",
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
                      decoration: const BoxDecoration(
                        color: Color(0xFFFEF9C3),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.bolt_sharp,
                        color: Color(0xFFCA8A04),
                        size: 28,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),

            // changed behavior card
            Card(
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
                        children: const [
                          Text(
                            "Sudah Berubah",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF1E293B),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),

                          Text(
                            "0",
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
                      decoration: const BoxDecoration(
                        color: Color(0xFFDCFCE7),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.check_circle_outline,
                        color: Color(0XFF16A34A),
                        size: 28,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 25),

            // Table Section
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Color(0xFFE0E0E0)),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DataTable(
                      headingRowColor: MaterialStateProperty.all(
                        Color(0xFFF8FAFC),
                      ),
                      columnSpacing: 40,
                      columns: const [
                        DataColumn(label: Text("NO")),
                        DataColumn(label: Text("KATEGORI")),
                        DataColumn(label: Text("CATATAN")),
                        DataColumn(label: Text("STATUS")),
                        DataColumn(label: Text("DILAPORKAN")),
                        DataColumn(label: Text("UPDATE TERAKHIR")),
                        DataColumn(label: Text("AKSI")),
                      ],
                      rows: const [],
                    ),

                    // Placeholder sejajar + mengikuti scroll
                    Container(
                      width: 900, // ≤ Sesuaikan dengan total lebar tabel
                      padding: const EdgeInsets.symmetric(vertical: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.check_circle_outline,
                            size: 70,
                            color: Color(0xFF94A3B8),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Tidak ada catatan",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF1E293B),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Belum ada catatan sikap yang ditambahkan",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF64748B),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
