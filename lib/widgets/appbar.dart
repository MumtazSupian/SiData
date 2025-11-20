import 'package:flutter/material.dart';

class AppbarProp extends StatelessWidget implements PreferredSizeWidget {
  const AppbarProp({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    final Color bg = const Color(0xFFF4F6F9);

    return AppBar(
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      backgroundColor: bg,
      elevation: 0,

      leading: IconButton(
        padding: const EdgeInsets.only(left: -10),
        icon: const Icon(Icons.book, color: Color(0xFF02398C)),
        onPressed: () {
          // contoh navigasi
          // Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
        },
      ),

      title: const Text(
        "Jurnalku",
        style: TextStyle(
          color: Color(0xFF64748B),
          fontWeight: FontWeight.bold,
        ),
      ),

      actions: [
        const SizedBox(width: 10),
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: const Color(0xFF02398C),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            minimumSize: const Size(80, 40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () {},
          child: const Text(
            "Login",
            style: TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(width: 30),
      ],
    );
  }
}