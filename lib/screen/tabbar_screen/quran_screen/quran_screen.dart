import 'package:flutter/material.dart';
import 'package:quran_sharif_bangla/screen/tabbar_screen/quran_screen/juz_screen.dart';
import 'package:quran_sharif_bangla/service/api_service.dart';
import 'package:quran_sharif_bangla/service/constants.dart';
import 'package:quran_sharif_bangla/theme/pcolor.dart';
import 'package:quran_sharif_bangla/widget/surah_tile.dart';

import '../../../model/surah_model.dart';
class QuranScreen extends StatefulWidget {
  const QuranScreen({Key? key}) : super(key: key);

  @override
  _QuranScreenState createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  ApiServices apiServices=ApiServices();

  @override
  Widget build(BuildContext context) {
    var _size=MediaQuery.of(context).size;
    return DefaultTabController(
        length: 3,
        initialIndex: 0,

        child: SafeArea(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.black,
                title: Text("Amader Quran",
                ),
                centerTitle: true,
                bottom: TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                    tabs: [
                      Text("Surah",style: TextStyle(color: Colors.white , fontSize: 21,fontWeight: FontWeight.bold),),
                      Text("Sejdah",style: TextStyle(color: Colors.white , fontSize: 21,fontWeight: FontWeight.bold),),
                      Text("juz",style: TextStyle(color: Colors.white , fontSize: 21,fontWeight: FontWeight.bold),)

                    ]),
              ),
              body: TabBarView(
                  children: [
                    FutureBuilder(
                        future:apiServices.getSurah(),
                        builder: (BuildContext context,AsyncSnapshot<List<Surah>>snapshot){
                          if(snapshot.hasData){
                            List<Surah>?surah=snapshot.data;
                            return ListView.builder(
                                itemCount: surah!.length,
                                itemBuilder: (context, index) =>SurahListTile(
                                    surah: surah[index],
                                    context: context,
                                    ontap: (){} ),
                            );
                          }
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }),
                    Center(
                      child: Text("Quran"),
                    ),
                    GestureDetector(
                      child: Container(
                        child: GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                            itemCount: 30,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: (){
                                  setState(() {
                                    Constantss.juzIndex=(index+1);
                                  });
                                  Navigator.pushNamed(context, JuzScreen.id);
                                },
                                child: Card(
                                  elevation: 3,
                                  color: Colors.blueGrey,
                                  child: Text("${index+1}",style: TextStyle(color: Colors.red),),
                                ),
                              );
                            })),
                      ),
                  ]),
            )));
  }
}
