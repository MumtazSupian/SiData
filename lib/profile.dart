import 'package:flutter/material.dart';
import 'login_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Color bg = const Color(0xFFF4F6F9);
    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Jurnalku",
          style: TextStyle(
            color: Color(0xFF64748B),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: bg,
        elevation: 0,
        actions: [
          SizedBox(width: 10),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
            child: Text("Login", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
