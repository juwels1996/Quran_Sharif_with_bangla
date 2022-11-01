import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:quran_sharif_bangla/screen/home_screen.dart';
import 'package:quran_sharif_bangla/screen/tabbar_screen/prayer_screen.dart';
import 'package:quran_sharif_bangla/screen/tabbar_screen/quran_screen.dart';

import 'tabbar_screen/audio_screen.dart';
import 'tabbar_screen/home_page.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectindex=0;
  List<Widget>_widgetlist=[HomePage(),QuranScreen(),AudioScreen(),PrayerScreen()];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _widgetlist[selectindex],
          bottomNavigationBar: ConvexAppBar(
            items: [
              TabItem(icon:
              ClipRRect(

                  borderRadius: BorderRadius.circular(22),
                  child: Image.asset('assets/images/homes.png')), title: 'Home'),
              TabItem(icon:Image.asset('assets/images/holyQuran.png'), title: 'quran'),
              TabItem(icon: Image.asset('assets/images/audio.png'), title: 'audio'),
              TabItem(icon:Image.asset('assets/images/mosque.png'), title: 'prayer'),
            ],
            initialActiveIndex: 0,
            onTap:updateindex,
          )
      ),
    );
  }

  void updateindex(index){
    setState(() {
      selectindex=index;
    });
  }
}
