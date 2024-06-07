import 'package:flutter/material.dart';
import 'package:si_desa_sleman/views/LoginPage.dart';
import 'package:si_desa_sleman/views/RegisterPage.dart';
import 'package:si_desa_sleman/views/akun.dart';
import 'package:si_desa_sleman/views/land.dart';
import 'package:si_desa_sleman/views/menusurat.dart';
import 'package:si_desa_sleman/views/notifikasi.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      routes: {
        '/register': (context) => RegisterPage(),
        '/login':(context) => LoginPage(),
        '/land':(context) => LandingPage(),
        '/surat':(context) => MenuSurat(),
        '/notif':(context) => NotifPage(),
        '/akun':(context) => Akun(),

      },
    );
  }
}