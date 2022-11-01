import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quran_sharif_bangla/screen/home_screen.dart';
import 'package:quran_sharif_bangla/screen/main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'introduction_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool alreadyUsed=false;
  void getData()async{
    final prefs = await SharedPreferences.getInstance();
    alreadyUsed =prefs.getBool("alreadyUsed")??false;
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    Timer(Duration(seconds: 3), ()=>Navigator.pushReplacement(context,
    MaterialPageRoute(builder: (context) {
      return alreadyUsed?MainScreen() :OnBoardingScreen();
    })));
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Center(
              child: Text("Quran shikhi"),
            ),
            Positioned(
              bottom: 40,
                right: 15,
                left: 15,

                child: Image.asset('assets/images/islamic.png'))
          ],
        ),
      ),
    );
  }
}
