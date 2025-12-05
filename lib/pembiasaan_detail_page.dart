import 'package:flutter/material.dart';
import 'package:sidata_app/widgets/appbar.dart';

class PembiasaanBiasaPage extends StatefulWidget {
  final int tanggal;
  final int status;

  const PembiasaanBiasaPage({
    super.key,
    required this.tanggal,
    required this.status,
  });

  @override
  State<PembiasaanBiasaPage> createState() => _PembiasaanBiasaPageState();
}

class _PembiasaanBiasaPageState extends State<PembiasaanBiasaPage> {
  final List<String> hari = [
    "Senin",
    "Selasa",
    "Rabu",
    "Kamis",
    "Jumat",
    "Sabtu",
    "Minggu"
  ];

  List<String> pertanyaanK3 = [
    "Pencahayaan dan sirkulasi udara pada ruang kerja baik.",
    "Duduk menggunakan meja dan kursi yang nyaman.",
    "Punggung dan leher tegak, tidak bungkuk.",
    "Posisi siku sejajar dengan meja/keyboard.",
    "Posisi kaki tidak menggantung dan tidak menekuk.",
    "Posisi layar sejajar dengan mata.",
    "Melihat ke arah jauh setiap 30 menit melihat layar.",
    "Melakukan stretching setiap 1 jam duduk.",
    "Minum 200 ml (segelas) air mineral setiap 2 jam.",
  ];

  List<String> pertanyaanKeselamatan = [
    "Tidak ada benda berbahaya di dekat peralatan kerja (misalnya air yang terbuka, dsb).",
    "Kabel tertata rapi dan tidak terbuka.",
    "Stop kontak aman dan tidak terbuka.",
    "Peralatan kerja dirapikan kembali setelah digunakan.",
  ];

  List<String> pertanyaanKarakter = [
    "Berdoa sebelum dan sesudah bekerja.",
    "Bagi muslim, melaksanakan sholat tepat waktu (tidak menunda-nunda).",
    "Berkomitmen pada pekerjaan/tugas.",
    "Berpartisipasi dalam tim dan membantu teman.",
    "Menghormati rekan kerja (Ucapan Maaf dan Terima Kasih).",
    "Terbiasa Wajib Ngulik untuk meningkatkan pemahaman/penguasaan materi dan pemecahan masalah.",
  ];

  late List<List<bool>> checkK3;
  late List<List<bool>> checkKeselamatan;
  late List<List<bool>> checkKarakter;

  @override
  void initState() {
    super.initState();

    checkK3 = List.generate(hari.length, (_) => List.generate(pertanyaanK3.length, (_) => false));
    checkKeselamatan = List.generate(hari.length, (_) => List.generate(pertanyaanKeselamatan.length, (_) => false));
    checkKarakter = List.generate(hari.length, (_) => List.generate(pertanyaanKarakter.length, (_) => false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarProp(),
      body: Stack(
        children: [
          // Isi halaman
          SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                buildKategori("Kesehatan dan Keselamatan Kerja", pertanyaanK3, checkK3),
                const SizedBox(height: 20),
                buildKategori("Keselamatan", pertanyaanKeselamatan, checkKeselamatan),
                const SizedBox(height: 20),
                buildKategori("Karakter", pertanyaanKarakter, checkKarakter),
              ],
            ),
          ),

          // Tombol kembali kiri bawah
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: TextButton.icon(
                onPressed: () => Navigator.pop(context),
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFF02398C),
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 16),
                label: const Text(
                  "Kembali",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildKategori(String nama, List<String> pertanyaan, List<List<bool>> checklist) {
    return ExpansionTile(
      title: Text(
        nama,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      children: List.generate(hari.length, (hariIndex) {
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: ExpansionTile(
            title: Text(hari[hariIndex]),
            children: List.generate(pertanyaan.length, (qIndex) {
              return ListTile(
                title: Text(pertanyaan[qIndex]),
                trailing: Checkbox(
                  value: checklist[hariIndex][qIndex],
                  onChanged: (val) {
                    setState(() {
                      checklist[hariIndex][qIndex] = val!;
                    });
                  },
                ),
              );
            }),
          ),
        );
      }),
    );
  }
}
