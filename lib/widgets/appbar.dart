import 'package:flutter/material.dart';

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
                "Fauzan Ihsan Putra",
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
            backgroundImage: AssetImage("assets/images/anuan.jpeg"),
          ),
        ],
      ),
      centerTitle: true,
    );
  }
}