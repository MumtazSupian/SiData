import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sidata_app/widgets/appbar.dart';
import 'package:sidata_app/widgets/student_behavior_card.dart';
import 'package:sidata_app/widgets/datatables.dart';

class StudentBehavior extends StatefulWidget {
  const StudentBehavior({super.key});

  @override
  State<StudentBehavior> createState() => _StudentBehaviorState();
}

class _StudentBehaviorState extends State<StudentBehavior> {
  final List<Map<String, dynamic>> recordData = [
    {
      "kategori": "Kedisiplinan",
      "catatan": "Sering terlambat 10 menit, setelah bel masuk",
      "status": "Diproses",
      "tanggal_1": "10 Jan 2025",
      "tanggal_2": "12 Jan 2025",
      "aksi": "Lihat",
    },
    {
      "kategori": "Sikap",
      "catatan": "Kurang mem-perhatian pada saat jam pelajaran",
      "status": "Selesai",
      "tanggal_1": "5 Jan 2025",
      "tanggal_2": "7 Jan 2025",
      "aksi": "Lihat",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppbarProp(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(23),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Catatan Sikap Saya",
                style: GoogleFonts.inter(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Lihat Catatan Sikap dan Perilaku yang Telah Dilaporkan",
                style: GoogleFonts.inter(fontSize: 16),
              ),
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.yellow[50],
                  border: Border.all(color: Colors.yellow.shade700, width: 1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.warning_amber_outlined,
                      size: 16,
                      color: Colors.yellow.shade700,
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Perhatian",
                            style: GoogleFonts.inter(
                              color: Colors.brown[700],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Jika Anda merasa ada catatan yang tidak sesuai atau keliru, silakan hubungi guru jurusan untuk mengajukan\nklarifikasi.",
                            style: GoogleFonts.inter(color: Colors.brown[800]),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),
              CompetencyStatisticCard(
                title: "Total Catatan",
                value: 0,
                color: "0xFF3b82f6",
                valueColor: "0xFF000000",
                icon: Icons.my_library_books_outlined,
              ),
              SizedBox(height: 25),
              CompetencyStatisticCard(
                title: "Dalam Perbaikan",
                value: 0,
                color: "0xFFa855f7",
                valueColor: "0xFF000000",
                icon: Icons.bolt_sharp,
              ),
              SizedBox(height: 25),
              CompetencyStatisticCard(
                title: "Sudah Berubah",
                value: 0,
                color: "0xFF22c55e",
                valueColor: "0xFF000000",
                icon: Icons.check_circle_outline,
              ),
              SizedBox(height: 25),
              RecordList(items: recordData),
            ],
          ),
        ),
      ),
    );
  }
}
