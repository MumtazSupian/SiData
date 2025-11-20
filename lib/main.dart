import 'package:flutter/material.dart';
// import 'package:sidata_app/login_page.dart';
// import 'package:sidata_app/panduan_page.dart';
import 'package:sidata_app/permintaan_saksi_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jurnalku',
      debugShowCheckedModeBanner: false,
      home: PermintaanSaksiPage(),
    );
  }
}
