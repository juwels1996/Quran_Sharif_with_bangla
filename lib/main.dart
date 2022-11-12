import 'package:flutter/material.dart';
import 'package:quran_sharif_bangla/screen/home_screen.dart';
import 'package:quran_sharif_bangla/screen/introduction_screen/splash_screen.dart';
import 'package:quran_sharif_bangla/screen/tabbar_screen/quran_screen/juz_screen.dart';
import 'package:quran_sharif_bangla/theme/pcolor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Constants.Kprimary,
        fontFamily: 'Poppins'
      ),
      home: SplashScreen(),
      routes: {
        JuzScreen.id:(context)=>JuzScreen(),


      },
    );
  }
}