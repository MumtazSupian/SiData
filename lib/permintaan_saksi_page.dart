import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sidata_app/widgets/appbar.dart';

class PermintaanSaksiPage extends StatefulWidget {
  const PermintaanSaksiPage({super.key});

  @override
  State<PermintaanSaksiPage> createState() => _PermintaanSaksiPageState();
}

class _PermintaanSaksiPageState extends State<PermintaanSaksiPage> {
  // Contoh data dummy (nanti bisa diganti dengan data asli)
  final List<Map<String, String>> permintaanList = [
    {
      "pengirim": "Alya Putri",
      "tanggal": "19 Nov 2025",
      "rombel": "PPLG XI-1",
      "rayon": "Cisarua 7",
      "deskripsi":
          "Membantu kegiatan sosial di Panti Asuhan dengan mengajar anak-anak dan membersihkan area sekitar.",
    },
    {
      "pengirim": "Rafi Ahmad",
      "tanggal": "18 Nov 2025",
      "rombel": "TJKT XI-2",
      "rayon": "Cicurug 4",
      "deskripsi":
          "Melakukan kegiatan kebersihan lingkungan sekolah bersama rekan kelompok.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppbarProp(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ===== TITLE & SUBTITLE =====
            Text(
              "Permintaan Saksi",
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              "Kelola permintaan menjadi saksi dari siswa lain",
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 15),

            // ===== TANGGAL =====
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFEFF5FF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "Thursday, 20 November 2025",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: const Color(0xFF1A73E8),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // ===== DAFTAR PERMINTAAN =====
            Expanded(
              child: permintaanList.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.group_outlined,
                            size: 50,
                            color: Colors.grey[400],
                          ),
                          const SizedBox(height: 10),
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
                    )
                  : ListView.builder(
                      itemCount: permintaanList.length,
                      itemBuilder: (context, index) {
                        final item = permintaanList[index];
                        return Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.grey[300]!),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                blurRadius: 6,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: ExpansionTile(
                            tilePadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            backgroundColor: Colors.white,
                            collapsedBackgroundColor: const Color(
                              0xFFF8F9FB,
                            ).withOpacity(0.5),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    item['pengirim']!,
                                    style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Text(
                                  item['tanggal']!,
                                  style: GoogleFonts.poppins(
                                    fontSize: 13.5,
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ],
                            ),
                            childrenPadding: const EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 8,
                            ),

                            // ===== ISI DETAIL =====
                            children: [
                              detailRow("Rombel", item['rombel']!),
                              detailRow("Rayon", item['rayon']!),
                              const SizedBox(height: 6),
                              Text(
                                "Deskripsi Pekerjaan:",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.5,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                item['deskripsi']!,
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: Colors.grey[800],
                                  height: 1.5,
                                ),
                              ),
                              const SizedBox(height: 14),

                              // ===== BUTTON TERIMA / TOLAK =====
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton.icon(
                                    onPressed: () {
                                      _showConfirmationDialog(
                                        context,
                                        item['pengirim']!,
                                        true,
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.check_circle_outline,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                    label: Text(
                                      "Terima",
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(
                                        0xFF1A73E8,
                                      ), // biru
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                  ElevatedButton.icon(
                                    onPressed: () {
                                      _showConfirmationDialog(
                                        context,
                                        item['pengirim']!,
                                        false,
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.cancel_outlined,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                    label: Text(
                                      "Tolak",
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.redAccent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi helper untuk row detail (judul + isi)
  Widget detailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          SizedBox(
            width: 90,
            child: Text(
              "$title:",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 14.5,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: GoogleFonts.poppins(
                fontSize: 14.5,
                color: Colors.grey[800],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Dialog konfirmasi
  void _showConfirmationDialog(
    BuildContext context,
    String nama,
    bool isAccepted,
  ) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(
          isAccepted ? "Konfirmasi Terima" : "Konfirmasi Tolak",
          style: GoogleFonts.poppins(fontWeight: FontWeight.w700, fontSize: 17),
        ),
        content: Text(
          isAccepted
              ? "Apakah Anda yakin ingin menerima permintaan saksi dari $nama?"
              : "Apakah Anda yakin ingin menolak permintaan saksi dari $nama?",
          style: GoogleFonts.poppins(fontSize: 14.5),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Batal",
              style: GoogleFonts.poppins(color: Colors.grey[700]),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    isAccepted
                        ? "Permintaan dari $nama telah diterima ✅"
                        : "Permintaan dari $nama telah ditolak ❌",
                    style: GoogleFonts.poppins(),
                  ),
                  backgroundColor: isAccepted
                      ? Colors.green[600]
                      : Colors.redAccent,
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: isAccepted
                  ? Colors.green[600]
                  : Colors.redAccent,
            ),
            child: Text("Ya", style: GoogleFonts.poppins(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
