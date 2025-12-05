import 'package:flutter/material.dart';
import 'package:sidata_app/explore2.dart';

import 'package:sidata_app/pembiasaan_page.dart';
import 'package:sidata_app/progress_page.dart';
import 'package:sidata_app/dashboard.dart';
import 'package:sidata_app/login_page.dart';
import 'package:sidata_app/panduan_page.dart';
import 'package:sidata_app/permintaan_saksi_page.dart';
import 'package:sidata_app/profile.dart';
import 'package:sidata_app/settings.dart';
import 'package:sidata_app/student_behavior.dart';

class AppbarProp extends StatelessWidget implements PreferredSizeWidget {
  const AppbarProp({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 3,
      backgroundColor: const Color(0xFFF4F6F9),

      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(4),
        child: Divider(
          height: 1,
          thickness: 1,
          color: Colors.grey.withOpacity(0.3),
        ),
      ),


      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // LEFT ICON
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.home_outlined),
            color: const Color(0xFF64748B),
            iconSize: 28,
          ),

          const Spacer(),

          // Name and Avatar
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Text(
                "Fauzan Mumtaz Nisa",
                style: TextStyle(
                  color: Color(0xFF1E293B),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 2),
              Text(
                "PPLG XII-5",
                style: TextStyle(
                  color: Color(0xFF64748B),
                  fontSize: 13,
                ),
              ),
            ],
          ),
          const SizedBox(width: 16,),

          // RIGHT AVATAR
          const CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage("assets/images/catker.jpeg"),
          ),
          SizedBox(height: 10),

          PopupMenuButton(
            offset: Offset(0, 40),
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey[800],
                  ),
            itemBuilder: (context) => [
              PopupMenuItem(
                      value: 2, 
                      child: Row(
                        children: [
                          Icon(Icons.home, size: 20),
                          SizedBox(width: 10),
                          Text("Dashboard"),
                        ],
                      ),
                    ),
              PopupMenuItem(
                      value: 1, 
                      child: Row(
                        children: [
                          Icon(Icons.person, size: 20),
                          SizedBox(width: 10),
                          Text("Profile"),
                        ],
                      ),
                    ),
              PopupMenuItem(
                      value: 10, 
                      child: Row(
                        children: [
                          Icon(Icons.timer, size: 20),
                          SizedBox(width: 10),
                          Text("Jelajahi"),
                        ],
                      ),
                    ),
              PopupMenuItem(
                      value: 3, 
                      child: Row(
                        children: [
                          Icon(Icons.book_online, size: 20),
                          SizedBox(width: 10),
                          Text("Jurnal Pembiasaan"),
                        ],
                      ),
                    ),
              PopupMenuItem(
                      value: 4, 
                      child: Row(
                        children: [
                          Icon(Icons.watch, size: 20),
                          SizedBox(width: 10),
                          Text("Permintaan saksi"),
                        ],
                      ),
                    ),
              PopupMenuItem(
                      value: 6, 
                      child: Row(
                        children: [
                          Icon(Icons.task, size: 20),
                          SizedBox(width: 10),
                          Text("Progress"),
                        ],
                      ),
              ),
              PopupMenuItem(
                      value: 9, 
                      child: Row(
                        children: [
                          Icon(Icons.sticky_note_2, size: 20),
                          SizedBox(width: 10),
                          Text("Catatan Sikap"),
                        ],
                      ),
                    ),
              PopupMenuItem(
                      value: 5, 
                      child: Row(
                        children: [
                          Icon(Icons.book, size: 20),
                          SizedBox(width: 10),
                          Text("Panduan"),
                        ],
                      ),
                    ),
              PopupMenuItem(
                      value: 7, 
                      child: Row(
                        children: [
                          Icon(Icons.settings, size: 20),
                          SizedBox(width: 10),
                          Text("Settings"),
                        ],
                      ),
                    ),
              PopupMenuItem(
                      value: 8, 
                      child: Row(
                        children: [
                          Icon(Icons.logout, size: 20),
                          SizedBox(width: 10),
                          Text("Logout"),
                        ],
                      ),
                    ),
            ],
            onSelected: (value) {
              if (value == 1) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage()));
              } else if (value == 2) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Dashboard()));
              } else if (value == 3) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const PembiasaanPage()));
              } else if (value == 4) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const PermintaanSaksiPage()));
              } else if (value == 5) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PanduanPage()));
              } else if (value == 7) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsPage()));
              } else if (value == 8) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
              } else if(value == 6) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ProgressPage()));
              } else if(value == 9){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const StudentBehavior()));
              } else if(value == 10){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Explore2()));
              }
            },
          ),
          
        ],
      ),
      centerTitle: true,
    );
  }
}