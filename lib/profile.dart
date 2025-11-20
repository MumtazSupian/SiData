import 'package:flutter/material.dart';
import 'package:sidata_app/widgets/appbar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Color bg = const Color(0xFFF4F6F9);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: bg,
        appBar: const AppbarProp(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 16),
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

            const SizedBox(height: 10),

            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 140,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/wikrama-mewah.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  bottom: -40,
                  child: Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                        )
                      ],
                    ),
                    child: const CircleAvatar(
                      radius: 45,
                      backgroundImage: AssetImage("assets/images/anuan.jpeg"),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 50),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Fauzan Ihsan Putra",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 6),
                        Wrap(
                          spacing: 10,
                          children: [
                            Text("12309647", style: TextStyle(color: Colors.grey)),
                            Text("|"),
                            Text("PPLG XII-5", style: TextStyle(color: Colors.grey)),
                            Text("|"),
                            Text("Cic 10", style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.share, color: Colors.white),
                    style: IconButton.styleFrom(
                      backgroundColor: const Color(0xFF02398C),
                      padding: const EdgeInsets.all(14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 20),

            const TabBar(
              labelColor: Color(0xFF02398C),
              unselectedLabelColor: Colors.grey,
              indicatorColor: Color(0xFF02398C),
              tabs: [
                Tab(text: "Overview"),
                Tab(text: "Portfolio"),
                Tab(text: "Sertifikat"),
              ],
            ),

            Expanded(
              child: TabBarView(
                children: [
                  // OVERVIEW
                  ListView(
                    padding: const EdgeInsets.all(16),
                    children: const [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Portfolio Terbaru",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Lihat Semua",
                            style: TextStyle(
                              color: Color(0xFF02398C),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Column(
                        children: [
                          Icon(Icons.work, size: 60, color: Colors.grey),
                          SizedBox(height: 10),
                          Text(
                            "Portfolio akan ditampilkan di sini",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),

                  // PORTFOLIO TAB
                  Center(
                    child: Text(
                      "Belum ada Portfolio",
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ),

                  // SERTIFIKAT TAB
                  Center(
                    child: Text(
                      "Belum ada Sertifikat",
                      style: TextStyle(color: Colors.grey, fontSize: 16),
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