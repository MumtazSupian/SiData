import 'package:flutter/material.dart';
import 'package:sidata_app/pembiasaan_detail_page.dart';
import 'package:sidata_app/widgets/appbar.dart';

class JobEntry {
  final String pekerjaan;
  final DateTime tanggal;
  final String saksi;
  
  JobEntry({
    required this.pekerjaan,
    required this.tanggal,
    required this.saksi,
  });
}

class MateriEntry {
  final String materi;
  final String status;
  final DateTime tanggal;
  
  MateriEntry({
    required this.materi,
    required this.status,
    required this.tanggal,
  });
}

class PembiasaanPage extends StatefulWidget {
  const PembiasaanPage({Key? key}) : super(key: key);
  

  @override
  State<PembiasaanPage> createState() => _PembiasaanPageState();
}

class _PembiasaanPageState extends State<PembiasaanPage> {
  static const int _offset = 2;
  static const int _daysInMonth = 28;
  
  final Map<int, int> _statusByDay = {
    2: 2, 3: 3, 4: 3, 5: 3, 6: 3, 7: 3, 8: 3, 9: 3,
    10: 3, 11: 3, 12: 3, 13: 0, 14: 4, 15: 4, 16: 4,
    17: 4, 18: 4, 19: 4, 20: 4, 21: 4, 22:4, 23: 4, 24: 4, 25: 4,
    26: 4, 27: 4, 28: 4,
  };

  // Job entries
  final List<JobEntry> _jobs = [];
  final TextEditingController _pekerjaanCtrl = TextEditingController();
  final TextEditingController _saksiCtrl = TextEditingController();
  DateTime? _pickedDate;

  final List<MateriEntry> _materi = [];
  final TextEditingController _materiCtrl = TextEditingController();
  DateTime? _materiDate;
  String _materiStatus = 'A';

  final List<String> _categories = [
    '(5) mengerjakan project/adanya update progress belajar',
    '(1-5) poin dari pertanyaan atau laporan pengetahuan materi',
  ];
  final Map<String, List<int>> _categoryPoints = {};

  List<List<bool>> checklist = [
    [false, false],
    [false, false],
    [false, false],
    [false, false],
  ];

  @override
  void initState() {
    super.initState();
    _initializeCategoryPoints();
  }

  void _initializeCategoryPoints() {
    for (var category in _categories) {
      _categoryPoints[category] = List<int>.filled(4, 0);
    }
  }

  @override
  void dispose() {
    _pekerjaanCtrl.dispose();
    _saksiCtrl.dispose();
    _materiCtrl.dispose();
    super.dispose();
  }

  int _calculateChecklistPoints() {
    return _statusByDay.values.where((v) => v == 1).length;
  }

  List<int> _calculateWeeklyTotals() {
    return List<int>.generate(
      4,
      (i) => _categories.fold<int>(
        0,
        (sum, c) => sum + (_categoryPoints[c]![i]),
      ),
    );
  }

  int _calculateTotalPoints() {
    final weeklyTotals = _calculateWeeklyTotals();
    final checklistPoints = _calculateChecklistPoints();
    return weeklyTotals.fold<int>(0, (s, v) => s + v) + checklistPoints;
  }

  Future<void> _showAddJobDialog() async {
    _pekerjaanCtrl.clear();
    _saksiCtrl.clear();
    _pickedDate = null;

    await showDialog(
      context: context,
      builder: (ctx) => _JobDialog(
        pekerjaanCtrl: _pekerjaanCtrl,
        saksiCtrl: _saksiCtrl,
        pickedDate: _pickedDate,
        onDatePicked: (date) {
          setState(() => _pickedDate = date);
          Navigator.of(ctx).pop();
          _showAddJobDialog();
        },
        onSave: () {
          final pekerjaan = _pekerjaanCtrl.text.trim();
          final saksi = _saksiCtrl.text.trim();
          
          if (pekerjaan.isNotEmpty && _pickedDate != null) {
            setState(() {
              _jobs.add(JobEntry(
                pekerjaan: pekerjaan,
                tanggal: _pickedDate!,
                saksi: saksi,
              ));
            });
            Navigator.of(ctx).pop();
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Isi pekerjaan dan pilih tanggal')),
            );
          }
        },
      ),
    );
  }

  Future<void> _showAddMateriDialog() async {
    _materiCtrl.clear();
    _materiDate = null;
    _materiStatus = 'A';

    await showDialog(
      context: context,
      builder: (ctx) => _MateriDialog(
        materiCtrl: _materiCtrl,
        materiDate: _materiDate,
        materiStatus: _materiStatus,
        onStatusChanged: (status) => setState(() => _materiStatus = status),
        onDatePicked: (date) => setState(() => _materiDate = date),
        onSave: () {
          final materi = _materiCtrl.text.trim();
          
          if (materi.isNotEmpty && _materiDate != null) {
            setState(() {
              _materi.add(MateriEntry(
                materi: materi,
                status: _materiStatus,
                tanggal: _materiDate!,
              ));
            });
            Navigator.of(ctx).pop();
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Isi materi dan pilih tanggal')),
            );
          }
        },
      ),
    );
  }

  Future<void> _editPoint(String category, int weekIndex) async {
    final controller = TextEditingController(
      text: _categoryPoints[category]![weekIndex].toString(),
    );

    final result = await showDialog<int>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Edit Poin'),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(labelText: 'Masukkan poin (angka)'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () {
              final value = int.tryParse(controller.text.trim()) ?? 0;
              Navigator.of(ctx).pop(value);
            },
            child: const Text('Simpan'),
          ),
        ],
      ),
    );

    if (result != null) {
      setState(() {
        _categoryPoints[category]![weekIndex] = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppbarProp(),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: constraints.maxWidth > 600 ? 32 : 18,
            vertical: 12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 14),
              _buildNavigationButton(),
              const SizedBox(height: 18),

              _buildPembiasaanHarian(constraints.maxWidth),

              const SizedBox(height: 18),
              
  ExpansionTile(
  tilePadding: EdgeInsets.zero,
  childrenPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  title: const Text(
    'B. Pekerjaan yang dilakukan',
    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
  ),
  children: [
    // Card container
    Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(38),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),

      // ISI CARD
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Mobile Developer",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
            )
          ),
          const SizedBox(height: 2),
          Text(
            "Flutter Development",
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey[600],
            ),
          ),

          const SizedBox(height: 16),

          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Pekerjaan:  "),
              Expanded(child: Text("slicing ui")),
            ],
          ),
          const SizedBox(height: 8),

          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Tanggal:  "),
              Expanded(child: Text("8 Okt 2020")),
            ],
          ),
          const SizedBox(height: 8),

          

          const SizedBox(height: 16),

          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("saksi:  "),
              Expanded(
                child: Text(
                  "nijet",
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Status badge
          Row(
            children: [
              const Text("Status:  "),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green.withAlpha(38),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "Selesai",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.green,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),

    // Tombol Tambah Pekerjaan
    TextButton(
      onPressed: _showAddJobDialog,
      child: const Text(
        "+ Tambah Pekerjaan",
        style: TextStyle(color: Colors.blue),
      ),
    ),
  ],
),



              const SizedBox(height: 18),

              ExpansionTile(
                tilePadding: EdgeInsets.zero,
                childrenPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                title: const Text(
                  'C. Materi Yang Dipelajari',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                children: [
                  // Card container
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(38),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),

                    // ISI CARD
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Mobile Developer",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          "Flutter Development",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[600],
                          ),
                        ),

                        const SizedBox(height: 16),

                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Guru:  "),
                            Expanded(child: Text("Pak Istakim")),
                          ],
                        ),
                        const SizedBox(height: 8),

                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Tanggal:  "),
                            Expanded(child: Text("8 Okt 2020")),
                          ],
                        ),
                        const SizedBox(height: 8),

                        // Status badge
                        Row(
                          children: [
                            const Text("Status:  "),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.green.withAlpha(38),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text(
                                "Selesai",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.green,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Catatan Guru:  "),
                            Expanded(
                              child: Text(
                                "Pekerjaan sudah sesuai dengan standar kompetensi yang diharapkan",
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Catatan Siswa:  "),
                            Expanded(
                              child: Text(
                                "Terima kasih atas bimbingannya, saya akan terus belajar dan meningkatkan kemampuan",
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Tombol Tambah Pekerjaan
                  TextButton(
                    onPressed: _showAddJobDialog,
                    child: const Text(
                      "+ Tambah Pekerjaan",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

             ExpansionTile(
  tilePadding: EdgeInsets.zero,
  childrenPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  title: const Text(
    'D. Poin',
    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
  ),
  children: [
    // ============================
    // CARD M1
    // ============================
    _buildModuleCard(
      title: "M1",
      questions: [
        "Mengerjakan project/update progress",
        "Poin dari pertanyaan atau laporan materi"
      ],
    ),

    // ============================
    // CARD M2
    // ============================
    _buildModuleCard(
      title: "M2",
      questions: [
        "Mengerjakan project/update progress",
        "Poin dari pertanyaan atau laporan materi"
      ],
    ),

    // ============================
    // CARD M3
    // ============================
    _buildModuleCard(
      title: "M3",
      questions: [
        "Mengerjakan project/update progress",
        "Poin dari pertanyaan atau laporan materi"
      ],
    ),

    // ============================
    // CARD M4
    // ============================
    _buildModuleCard(
      title: "M4",
      questions: [
        "Mengerjakan project/update progress",
        "Poin dari pertanyaan atau laporan materi"
      ],
    ),

    // ===============================
    // JUMLAH POIN MINGGU INI
    // ===============================
    Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Jumlah poin minggu ini",
              style: TextStyle(fontWeight: FontWeight.bold)),
          DropdownButton<int>(
            value: 0,
            items: List.generate(
              51,
              (i) => DropdownMenuItem(value: i, child: Text(i.toString())),
            ),
            onChanged: (value) {},
          ),
        ],
      ),
    ),

    // ===============================
    // JUMLAH CEKLIST PEMBIASAAN
    // ===============================
    Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Jumlah ceklis pembiasaan",
              style: TextStyle(fontWeight: FontWeight.bold)),
          DropdownButton<int>(
            value: 0,
            items: List.generate(
              51,
              (i) => DropdownMenuItem(value: i, child: Text(i.toString())),
            ),
            onChanged: (value) {},
          ),
        ],
      ),
    ),

    // ===============================
    // TOTAL KESELURUHAN
    // ===============================
    Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            "Total Poin",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            "0",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  ],
),




              const SizedBox(height: 30),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Jurnal Pembiasaan',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 6),
        const Text(
          'NOVEMBER - 2025',
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildNavigationButton() {
    return Align(
      alignment: Alignment.centerLeft,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        label: const Text('Bulan Sebelumnya', style: TextStyle(color: Colors.white),),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue.shade700,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }

  Widget _buildPembiasaanHarian(double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'A. Pembiasaan harian',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 10),
        _buildLegend(),
        const SizedBox(height: 14),
        _buildCalendarGrid(width),
      ],
    );
  }

  Widget _buildLegend() {
    return Wrap(
      spacing: 12,
      runSpacing: 8,
      children: const [
        LegendDot(color: Colors.green, label: 'Sudah diisi'),
        LegendDot(color: Colors.grey, label: 'Belum diisi'),
        LegendDot(color: Colors.red, label: 'Tidak diisi'),
      ],
    );
  }

  Widget _buildCalendarGrid(double width) {
    final columns = _getColumnsForWidth(width);
    final horizontalSpacing = 6.0 * (columns - 1);
    final tileSize = (width - 36 - horizontalSpacing) / columns;
    final childAspect = tileSize / tileSize;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        mainAxisSpacing: 8,
        crossAxisSpacing: 6,
        childAspectRatio: childAspect,
      ),
      itemCount: 35,
      itemBuilder: (context, index) {
        if (index < _offset) return const SizedBox.shrink();

        final day = index - _offset + 3;
        if (day > _daysInMonth) return const SizedBox.shrink();

        final status = _statusByDay[day] ?? 0;
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => PembiasaanBiasaPage(
                  tanggal: day,
                  status: status,
                  
                ),
              ),
            );
          },
          child: DayTile(day: day, status: status),
        );

      },
    );
  }

  int _getColumnsForWidth(double width) {
    if (width > 1200) return 14;
    if (width > 800) return 10;
    return 7;
  }

  // Widget _buildPekerjaanSection() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       const Text(
  //         'B. Pekerjaan yang dilakukan',
  //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
  //       ),
  //       const SizedBox(height: 8),
  //       DataTableWidget(
  //         headers: const ['Pekerjaan', 'Tgl', 'Saksi'],
  //         columnWidths: const [6, 80, 100],
  //         isEmpty: _jobs.isEmpty,
  //         emptyMessage: 'Belum ada pekerjaan yang diinput.',
  //         addButtonText: '+ Tambah Pekerjaan',
  //         onAdd: _showAddJobDialog,
  //         children: _jobs.map((job) {
  //           return DataRow(
  //             cells: [
  //               job.pekerjaan,
  //               '${job.tanggal.day}/${job.tanggal.month}/${job.tanggal.year}',
  //               job.saksi,
  //             ],
  //           );
  //         }).toList(),
  //       ),
  //     ],
  //   );
  // }

  Widget _buildMateriSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'C. Materi yang dipelajari',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        DataTableWidget(
          headers: const ['Materi', 'Sts', 'Tgl'],
          columnWidths: const [null, 60, 80],
          isEmpty: _materi.isEmpty,
          emptyMessage: 'Belum ada materi yang diinput.',
          addButtonText: '+ Tambah Materi',
          onAdd: _showAddMateriDialog,
          children: _materi.map((m) {
            return DataRow(
              cells: [
                m.materi,
                null, 
                '${m.tanggal.day}/${m.tanggal.month}/${m.tanggal.year}',
              ],
              customWidgets: [
                null,
                Center(child: StatusDot(status: m.status)),
                null,
              ],
            );
          }).toList(),
        ),
        const SizedBox(height: 8),
        _buildMateriLegend(),
      ],
    );
  }

  Widget _buildMateriLegend() {
    return Row(
      children: const [
        SizedBox(width: 4),
        LegendDot(color: Colors.green, label: 'A : Approved'),
        SizedBox(width: 12),
        LegendDot(color: Colors.amber, label: 'P : Pending'),
        SizedBox(width: 12),
        LegendDot(color: Colors.red, label: 'R : Revisi'),
      ],
    );
  }

  Widget _buildPoinSection() {
    final weeklyTotals = _calculateWeeklyTotals();
    final checklistPoints = _calculateChecklistPoints();
    final totalOverall = _calculateTotalPoints();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'D. Poin',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        PoinTable(
          categories: _categories,
          categoryPoints: _categoryPoints,
          weeklyTotals: weeklyTotals,
          checklistPoints: checklistPoints,
          totalOverall: totalOverall,
          onEditPoint: _editPoint,
        ),
      ],
    );
  }

  Widget _buildModuleCard({
    required String title,
    required List<String> questions,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: ExpansionTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: Column(
              children: [
                ...questions.map(
                  (q) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: Text(q)),
                        DropdownButton<int>(
                          value: 0,
                          items: List.generate(
                            6,
                            (i) => DropdownMenuItem(
                              value: i,
                              child: Text(i.toString()),
                            ),
                          ),
                          onChanged: (value) {},
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
    );
  }
}

class LegendDot extends StatelessWidget {
  final Color color;
  final String label;

  const LegendDot({
    required this.color,
    required this.label,
    Key? key,
  }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
      GestureDetector(
        
          child: Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
        ),
        const SizedBox(width: 8),
        Text(label, style: const TextStyle(color: Colors.black54)),
      ],
    );
  }
}

class DayTile extends StatelessWidget {
  final int day;
  final int status;

  const DayTile({
    required this.day,
    required this.status,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final config = _getTileConfig(status);

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            color: config.backgroundColor,
            borderRadius: BorderRadius.circular(8),
            border: config.border,
          ),
          alignment: Alignment.center,
          padding: const EdgeInsets.all(6),
          child: Text(
            day.toString().padLeft(2, '0'),
            style: TextStyle(
              fontSize: 14,
              color: config.textColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        if (config.showCross) _buildCrossIcon(),
      ],
    );
  }

  _TileConfig _getTileConfig(int status) {
    switch (status) {
      case 1:
        return _TileConfig(
          backgroundColor: Colors.green.shade50,
          textColor: Colors.green.shade800,
        );
      case 2:
        return _TileConfig(
          backgroundColor: Colors.white,
          textColor: Colors.grey.shade800,
          border: Border.all(color: Colors.grey.shade300),
        );
      case 3:
        return _TileConfig(
          backgroundColor: const Color(0xFFFFF0F0),
          textColor: Colors.grey.shade700,
          showCross: true,
        );
      case 4:
        return _TileConfig(
          backgroundColor: Colors.grey.shade400,
          textColor: Colors.white,
        );
      default:
        return _TileConfig(
          backgroundColor: Colors.white,
          textColor: Colors.black87,
        );
    }
  }

  Widget _buildCrossIcon() {
    return Positioned(
      top: -8,
      right: -8,
      child: Container(
        width: 26,
        height: 26,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.red.shade600, width: 2),
            ),
            child: Center(
              child: Icon(
                Icons.close,
                size: 12,
                color: Colors.red.shade600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TileConfig {
  final Color backgroundColor;
  final Color textColor;
  final BoxBorder? border;
  final bool showCross;

  _TileConfig({
    required this.backgroundColor,
    required this.textColor,
    this.border,
    this.showCross = false,
  });
}

class StatusDot extends StatelessWidget {
  final String status;

  const StatusDot({required this.status, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = _getStatusColor(status);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 6),
        Text(status, style: const TextStyle(fontWeight: FontWeight.w600)),
      ],
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'A':
        return Colors.green;
      case 'P':
        return Colors.amber;
      case 'R':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}

class _JobDialog extends StatelessWidget {
  final TextEditingController pekerjaanCtrl;
  final TextEditingController saksiCtrl;
  final DateTime? pickedDate;
  final Function(DateTime) onDatePicked;
  final VoidCallback onSave;

  const _JobDialog({
    required this.pekerjaanCtrl,
    required this.saksiCtrl,
    required this.pickedDate,
    required this.onDatePicked,
    required this.onSave,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Tambah Pekerjaan'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: pekerjaanCtrl,
              decoration: const InputDecoration(labelText: 'Pekerjaan'),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: saksiCtrl,
              decoration: const InputDecoration(labelText: 'Saksi'),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Text(
                    pickedDate == null
                        ? 'Pilih tanggal'
                        : '${pickedDate!.day}/${pickedDate!.month}/${pickedDate!.year}',
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );
                    if (date != null) onDatePicked(date);
                  },
                  child: const Text('Pilih'),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Batal'),
        ),
        ElevatedButton(
          onPressed: onSave,
          child: const Text('Simpan'),
        ),
      ],
    );
  }
}

class _MateriDialog extends StatefulWidget {
  final TextEditingController materiCtrl;
  final DateTime? materiDate;
  final String materiStatus;
  final Function(String) onStatusChanged;
  final Function(DateTime) onDatePicked;
  final VoidCallback onSave;

  const _MateriDialog({
    required this.materiCtrl,
    required this.materiDate,
    required this.materiStatus,
    required this.onStatusChanged,
    required this.onDatePicked,
    required this.onSave,
    Key? key,
  }) : super(key: key);

  @override
  State<_MateriDialog> createState() => _MateriDialogState();
}

class _MateriDialogState extends State<_MateriDialog> {
  late String _currentStatus;
  late DateTime? _currentDate;

  @override
  void initState() {
    super.initState();
    _currentStatus = widget.materiStatus;
    _currentDate = widget.materiDate;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Tambah Materi'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: widget.materiCtrl,
              decoration: const InputDecoration(labelText: 'Materi'),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text('Status: '),
                const SizedBox(width: 8),
                DropdownButton<String>(
                  value: _currentStatus,
                  items: const [
                    DropdownMenuItem(value: 'A', child: Text('A : Approved')),
                    DropdownMenuItem(value: 'P', child: Text('P : Pending')),
                    DropdownMenuItem(value: 'R', child: Text('R : Revisi')),
                  ],
                  onChanged: (v) {
                    if (v != null) {
                      setState(() => _currentStatus = v);
                      widget.onStatusChanged(v);
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Text(
                    _currentDate == null
                        ? 'Pilih tanggal'
                        : '${_currentDate!.day}/${_currentDate!.month}/${_currentDate!.year}',
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );
                    if (date != null) {
                      setState(() => _currentDate = date);
                      widget.onDatePicked(date);
                    }
                  },
                  child: const Text('Pilih'),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Batal'),
        ),
        ElevatedButton(
          onPressed: widget.onSave,
          child: const Text('Simpan'),
        ),
      ],
    );
  }
}

class DataTableWidget extends StatelessWidget {
  final List<String> headers;
  final List<num?> columnWidths;
  final bool isEmpty;
  final String emptyMessage;
  final String addButtonText;
  final VoidCallback onAdd;
  final List<DataRow> children;

  const DataTableWidget({
    required this.headers,
    required this.columnWidths,
    required this.isEmpty,
    required this.emptyMessage,
    required this.addButtonText,
    required this.onAdd,
    required this.children,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        children: [
          _buildHeader(),
          if (isEmpty) _buildEmptyState() else _buildRows(),
        ],
      ),
    );
  }

  Widget _buildCell(Widget cell, num? width, BoxConstraints constraints) {
    if (width == null) {
      return Expanded(child: cell);
    }

    if (width <= 10) {
      return Expanded(flex: width.toInt(), child: cell);
    }

    final fixedWidth = width.toDouble();
    final maxAllowed = constraints.maxWidth * 0.45;
    final appliedWidth = fixedWidth > maxAllowed ? maxAllowed : fixedWidth;

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: appliedWidth),
      child: SizedBox(width: appliedWidth, child: cell),
    );
  }

  Widget _buildHeader() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final headerBg = const Color(0xFFEAF3FA);

        return Container(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
          ),
          child: Row(
            children: List.generate(headers.length, (i) {
              final width = columnWidths[i];

              final cell = Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                decoration: BoxDecoration(
                  color: headerBg,
                  border: Border(
                    right: i == headers.length - 1
                        ? BorderSide.none
                        : BorderSide(color: Colors.grey.shade300),
                  ),
                ),
                child: Text(
                  headers[i],
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              );

              return _buildCell(cell, width, constraints);
            }),
          ),
        );
      },
    );
  }

  Widget _buildEmptyState() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
              child: Row(
                children: List.generate(headers.length, (i) {
                  final width = columnWidths[i];
                  Widget cell;
                  if (i == 0) {
                    cell = Text(
                      emptyMessage,
                      style: const TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.black54,
                      ),
                    );
                  } else {
                    cell = const SizedBox.shrink();
                  }

                  if (width == null) {
                    return Expanded(child: cell);
                  }

                  if (width <= 10) {
                    return Expanded(flex: width.toInt(), child: cell);
                  }

                  final fixedWidth = width.toDouble();
                  final maxAllowed = constraints.maxWidth * 0.45;
                  final appliedWidth = fixedWidth > maxAllowed ? maxAllowed : fixedWidth;

                  return ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: appliedWidth),
                    child: SizedBox(width: appliedWidth, child: cell),
                  );
                }).expand((widget) => [widget, const SizedBox(width: 12)]).toList()
                  ..removeLast(),
              ),
            ),

            Divider(height: 1, color: Colors.grey.shade200),

            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: GestureDetector(
               onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PembiasaanBiasaPage(tanggal: 0, status: 0),
                  ),
                );
              },

                child: Text(
                  addButtonText,
                  style: TextStyle(
                    color: Colors.blue.shade700,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildRows() {
    return Column(
      children: [
        ...children.map((row) => _buildRow(row)),
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: GestureDetector(
            onTap: onAdd,
            child: Text(
              addButtonText,
              style: TextStyle(color: Colors.blue.shade700),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRow(DataRow row) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.grey.shade200)),
          ),
          child: Row(
            children: List.generate(row.cells.length, (i) {
              final width = columnWidths[i];
              final customWidget = row.customWidgets?[i];
              final cellContent = customWidget ?? Text(row.cells[i] ?? '');

              if (width == null) {
                return Expanded(child: cellContent);
              }

              if (width <= 10) {
                return Expanded(flex: width.toInt(), child: cellContent);
              }

              final fixedWidth = width.toDouble();
              final maxAllowed = constraints.maxWidth * 0.45;
              final appliedWidth = fixedWidth > maxAllowed ? maxAllowed : fixedWidth;

              return ConstrainedBox(
                constraints: BoxConstraints(maxWidth: appliedWidth),
                child: SizedBox(width: appliedWidth, child: cellContent),
              );
            }).expand((widget) => [widget, const SizedBox(width: 12)]).toList()
              ..removeLast(),
          ),
        );
      },
    );
  }
}

class DataRow {
  final List<String?> cells;
  final List<Widget?>? customWidgets;

  DataRow({
    required this.cells,
    this.customWidgets,
  });
}

class PoinTable extends StatelessWidget {
  final List<String> categories;
  final Map<String, List<int>> categoryPoints;
  final List<int> weeklyTotals;
  final int checklistPoints;
  final int totalOverall;
  final Function(String, int) onEditPoint;

  const PoinTable({
    required this.categories,
    required this.categoryPoints,
    required this.weeklyTotals,
    required this.checklistPoints,
    required this.totalOverall,
    required this.onEditPoint,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(4),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width - 36,
          ),
          child: Table(
            border: TableBorder.symmetric(
              inside: BorderSide(color: Colors.grey.shade200),
            ),
            columnWidths: const {
              0: FlexColumnWidth(3),
              1: FixedColumnWidth(56),
              2: FixedColumnWidth(56),
              3: FixedColumnWidth(56),
              4: FixedColumnWidth(56),
            },
            children: [
              _buildHeaderRow(),
              ...categories.map((cat) => _buildCategoryRow(cat)),
              _buildWeeklyTotalRow(),
              _buildChecklistRow(),
              _buildOverallTotalRow(),
            ],
          ),
        ),
      ),
    );
  }

  TableRow _buildHeaderRow() {
    return TableRow(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          color: Colors.grey.shade100,
          child: const Text(
            'Kategori Poin',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        for (var i = 1; i <= 4; i++)
          Container(
            padding: const EdgeInsets.all(10),
            color: Colors.grey.shade100,
            child: Text(
              'M$i',
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
      ],
    );
  }

  TableRow _buildCategoryRow(String category) {
    return TableRow(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          child: Text(category),
        ),
        for (var w = 0; w < 4; w++)
          GestureDetector(
            onTap: () => onEditPoint(category, w),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              alignment: Alignment.center,
              child: Text(
                categoryPoints[category]![w].toString(),
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ),
      ],
    );
  }

  TableRow _buildWeeklyTotalRow() {
    return TableRow(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          child: const Text(
            'Jumlah poin minggu ini',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        for (var w = 0; w < 4; w++)
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            alignment: Alignment.center,
            child: Text(
              weeklyTotals[w].toString(),
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
      ],
    );
  }

  TableRow _buildChecklistRow() {
    return TableRow(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          child: const Text(
            'Jumlah poin ceklist pembiasaan',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        for (var w = 0; w < 3; w++)
          Container(padding: const EdgeInsets.symmetric(vertical: 12)),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          alignment: Alignment.center,
          child: Text(
            checklistPoints.toString(),
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }

  TableRow _buildOverallTotalRow() {
    return TableRow(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          child: const Text(
            'Jumlah keseluruhan poin',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        for (var w = 0; w < 3; w++)
          Container(padding: const EdgeInsets.symmetric(vertical: 12)),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          alignment: Alignment.center,
          child: Text(
            totalOverall.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}