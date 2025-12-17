import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// class RecordTable extends StatelessWidget {
//   const RecordTable({super.key, this.items = const []});
//   final List<Map<String, dynamic>> items;

//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(10),
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           border: Border.all(color: Colors.grey.shade300),
//         ),
//         child: SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Column(
//             children: [
//               _buildTableHeader(),
//               items.isEmpty ? _buildEmptyState() : _buildTableRows(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTableHeader() {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 15),
//       color: Colors.grey.shade100,
//       child: Row(
//         children: const [
//           _TableHeaderCell(label: "NO", width: 60),
//           _TableHeaderCell(label: "KATEGORI", width: 150),
//           _TableHeaderCell(label: "CATATAN", width: 250),
//           _TableHeaderCell(label: "STATUS", width: 120),
//           _TableHeaderCell(label: "DILAPORKAN", width: 150),
//           _TableHeaderCell(label: "UPDATE TERAKHIR", width: 180),
//           _TableHeaderCell(label: "AKSI", width: 100),
//         ],
//       ),
//     );
//   }

//   Widget _buildTableRows() {
//     return Column(
//       children: items.asMap().entries.map((e) {
//         final data = e.value;
//         return Container(
//           padding: const EdgeInsets.symmetric(vertical: 15),
//           decoration: BoxDecoration(
//             border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
//           ),
//           child: Row(
//             children: [
//               _JobTableCell(width: 60, child: Text((e.key + 1).toString())),
//               _TableCell(width: 150, child: Text(data["kategori"])),
//               _TableCell(width: 250, child: Text(data["catatan"])),
//               _TableCell(width: 120, child: Text(data["status"])),
//               _TableCell(width: 150, child: Text(data["tanggal_1"])),
//               _TableCell(width: 180, child: Text(data["tanggal_2"])),
//               _TableCell(width: 100, child: Text(data["aksi"])),
//             ],
//           ),
//         );
//       }).toList(),
//     );
//   }

//   Widget _buildEmptyState() {
//     return Container(
//       width: 1010,
//       height: 250,
//       alignment: Alignment.center,
//       color: Colors.white,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(
//             Icons.check_circle_outline,
//             size: 70,
//             color: Colors.grey.shade400,
//           ),
//           const SizedBox(height: 10),
//           const Text(
//             "Tidak ada catatan",
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           Text(
//             "Belum ada catatan sikap yang dilaporkan.",
//             style: TextStyle(color: Colors.grey.shade600),
//           ),
//         ],
//       ),
//     );
//   }
// }

class RecordList extends StatelessWidget {
  final List<Map<String, dynamic>> items;

  const RecordList({super.key, this.items = const []});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items.isEmpty
          ? [
              const SizedBox(height: 100),
              const Text("Tidak ada catatan"),
            ]
          : items.map((item) => RecordCard(data: item)).toList(),
    );
  }
}

class RecordCard extends StatefulWidget {
  final Map<String, dynamic> data;

  const RecordCard({super.key, required this.data});

  @override
  State<RecordCard> createState() => _RecordCardState();
}

class _RecordCardState extends State<RecordCard>
    with SingleTickerProviderStateMixin {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 5,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () => setState(() => expanded = !expanded),
            borderRadius: BorderRadius.circular(20),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // TEXT AREA
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Kategori chip
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.red.shade400,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Text(
                            widget.data["kategori"],
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 10),
                        // Judul
                        Text(
                          widget.data["catatan"],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 10),
                        // Status chip
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.yellow.shade100,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            widget.data["status"],
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    ),
                  ),
                  Icon(
                    expanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    size: 28,
                  )
                ],
              ),
            ),
          ),

          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: expanded
                ? Container(
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DetailItem(
                            label: "Catatan", value: widget.data["catatan"]),
                        DetailItem(
                            label: "Status", value: widget.data["status"]),
                        DetailItem(
                            label: "Update Terakhir",
                            value: widget.data["tanggal_2"]),
                        DetailItem(
                            label: "Dilaporkan",
                            value: widget.data["tanggal_1"]),
                        DetailItem(
                          label: "Aksi",
                          value: "Lihat",
                          isLink: true,
                        ),
                      ],
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}

class DetailItem extends StatelessWidget {
  final String label;
  final String value;
  final bool isLink;

  const DetailItem({
    super.key,
    required this.label,
    required this.value,
    this.isLink = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          SizedBox(
            width: 140,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                color: isLink ? Colors.blue : Colors.black87,
                decoration: isLink ? TextDecoration.underline : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class SimpleRecordTable extends StatelessWidget {
  const SimpleRecordTable({super.key, this.items = const []});
  final List<Map<String, dynamic>> items;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            children: [
              _buildTableHeader(),
              items.isEmpty ? _buildEmptyState() : _buildTableRows(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTableHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      color: Colors.grey.shade100,
      child: Row(
        children: const [
          _TableHeaderCell(label: "PENGIRIM", width: 150),
          _TableHeaderCell(label: "TANGGAL", width: 150),
          _TableHeaderCell(label: "KONFIRMASI", width: 150),
        ],
      ),
    );
  }

  Widget _buildTableRows() {
    return Column(
      children: items.map((data) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
          ),
          child: Row(
            children: [
              _TableCell(width: 200, child: Text(data["pengirim"])),
              _TableCell(width: 150, child: Text(data["tanggal"])),
              _TableCell(width: 150, child: Text(data["konfirmasi"])),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildEmptyState() {
    return Container(
      width: 400,
      height: 200,
      alignment: Alignment.center,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.people_outline, size: 60, color: Colors.grey.shade400),
          const SizedBox(height: 10),
          const Text(
            "Belum ada permintaan",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          Text(
            "Belum ada yang mengirim permintaan saksi kepada Anda",
            style: TextStyle(color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }
}

class _TableHeaderCell extends StatelessWidget {
  final String label;
  final double width;

  const _TableHeaderCell({required this.label, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12,
          letterSpacing: 1,
        ),
      ),
    );
  }
}

class _TableCell extends StatelessWidget {
  final double width;
  final Widget child;

  const _TableCell({required this.width, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: child,
      ),
    );
  }
}

class JobTable extends StatelessWidget {
  const JobTable({super.key, this.items = const []});

  final List<Map<String, dynamic>> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        children: [
          _buildHeader(),
          items.isEmpty ? _buildEmptyState() : _buildRows(),
          _buildAddButton(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: const Color(0xFFE5ECF5),
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          _ClickableHeader(label: "Pekerjaan", width: 160),
          _ClickableHeader(label: "Tgl", width: 80),
          _ClickableHeader(label: "Saksi", width: 120),
        ],
      ),
    );
  }

  Widget _buildRows() {
    return Column(
      children: items.map((data) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
          ),
          child: Row(
            children: [
              _JobTableCell(width: 200, child: Text(data["pekerjaan"])),
              _JobTableCell(width: 80, child: Text(data["tanggal"])),
              _JobTableCell(width: 120, child: Text(data["saksi"])),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildEmptyState() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Text(
        "Belum ada pekerjaan yang diinput.",
        style: TextStyle(
          color: Colors.grey.shade700,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }

  Widget _buildAddButton() {
    return GestureDetector(
      onTap: () {}, 
      child: Container(
        padding: const EdgeInsets.all(12),
        alignment: Alignment.centerLeft,
        child: Text(
          "+ Tambah Pekerjaan",
          style: TextStyle(
            color: Colors.blue.shade700,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class _JobTableCell extends StatelessWidget {
  final double width;
  final Widget child;

  const _JobTableCell({required this.width, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width, child: child);
  }
}

class _ClickableHeader extends StatelessWidget {
  final String label;
  final double width;

  const _ClickableHeader({required this.label, required this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {}, 
      child: SizedBox(
        width: width,
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
  }

class ProgressData {
  final String kompetensi;
  final String guru;
  final String tanggal;
  final String status;
  final String catatan;

  ProgressData({
    required this.kompetensi,
    required this.guru,
    required this.tanggal,
    required this.status,
    required this.catatan,
  });
}

class ProgressTable extends StatefulWidget {
  final String title;
  final List<ProgressData> data;

  const ProgressTable({
    super.key,
    required this.title,
    required this.data,
  });

  @override
  State<ProgressTable> createState() => _ProgressTableState();
}

class _ProgressTableState extends State<ProgressTable> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          // ====== HEADER CARD ======
          InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              setState(() => isExpanded = !isExpanded);
            },
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text title di kiri
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: GoogleFonts.inter(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Kompetensi dan materi pembelajaran",
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Arrow icon
                  Icon(
                    isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    size: 28,
                    color: Colors.grey[700],
                  )
                ],
              ),
            ),
          ),

          // ====== DROPDOWN CONTENT ======
          AnimatedCrossFade(
            firstChild: SizedBox(),
            secondChild: _buildContent(),
            crossFadeState: isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 250),
          ),
        ],
      ),
    );
  }

  // ====== CONTENT (BUKAN TABEL, TAPI TEKS VERTIKAL) ======
  Widget _buildContent() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Column(
        children: widget.data.map((item) {
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFFF7F7F7),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _textRow("Kompetensi", item.kompetensi),
                _textRow("Guru", item.guru),
                _textRow("Tanggal", item.tanggal),
                _textRow("Status", item.status),
                _textRow("Catatan", item.catatan),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  // ====== HELPER ROW "LABEL : VALUE" ======
  Widget _textRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              "$label:",
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: GoogleFonts.inter(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}

class HabitJournalTable extends StatelessWidget {
  const HabitJournalTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: Colors.grey, width: 1),
      columnWidths: const {
        0: FlexColumnWidth(1.5),
        1: FlexColumnWidth(2),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(
          decoration: BoxDecoration(color: Colors.grey[300]),
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Kategori',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      'Poin',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                // Sub-header M1 - M4
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.grey, width: 1),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(color: Colors.grey, width: 1),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              'M1',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(color: Colors.grey, width: 1),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              'M2',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(color: Colors.grey, width: 1),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              'M3',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          child: const Center(
                            child: Text(
                              'M4',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),

        TableRow(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                '(1 - 5) Mengerjakan project/adanya update progress belajar',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(color: Colors.grey, width: 1),
                        right: BorderSide(color: Colors.grey, width: 1),
                      ),
                    ),
                    child: const Center(child: Text('0')),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(color: Colors.grey, width: 1),
                      ),
                    ),
                    child: const Center(child: Text('0')),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(color: Colors.grey, width: 1),
                      ),
                    ),
                    child: const Center(child: Text('0')),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: const Center(child: Text('0')),
                  ),
                ),
              ],
            ),
          ],
        ),

        TableRow(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                '(1 - 5) Poin dari pertanyaan atau laporan pengetahuan materi',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(color: Colors.grey, width: 1),
                        right: BorderSide(color: Colors.grey, width: 1),
                      ),
                    ),
                    child: const Center(child: Text('0')),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(color: Colors.grey, width: 1),
                      ),
                    ),
                    child: const Center(child: Text('0')),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(color: Colors.grey, width: 1),
                      ),
                    ),
                    child: const Center(child: Text('0')),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: const Center(child: Text('0')),
                  ),
                ),
              ],
            ),
          ],
        ),

        TableRow(
          decoration: BoxDecoration(color: Colors.grey[100]),
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Jumlah poin minggu ini',
                style: TextStyle(fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(color: Colors.grey, width: 1),
                        right: BorderSide(color: Colors.grey, width: 1),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        '0',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(color: Colors.grey, width: 1),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        '0',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(color: Colors.grey, width: 1),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        '0',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: const Center(
                      child: Text(
                        '0',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),

        TableRow(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Jumlah poin checklist pembiasaan'),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border(left: BorderSide(color: Colors.grey, width: 1)),
              ),
              child: const Center(child: Text('0')),
            ),
          ],
        ),

        TableRow(
          decoration: BoxDecoration(color: Colors.grey[200]),
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Jumlah keseluruhan poin',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border(left: BorderSide(color: Colors.grey, width: 1)),
              ),
              child: const Center(
                child: Text(
                  '0',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}