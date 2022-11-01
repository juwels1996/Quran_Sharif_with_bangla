import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/ayatmodel.dart';
import '../../service/api_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  ApiServices _apiServices = ApiServices();
  void setData()async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("alreadyUsed", true);

  }


  @override
  void initState() {
    setData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    HijriCalendar.setLocal('ar');
    var _hijri = HijriCalendar.now();
    var day = DateTime.now();
    var format = DateFormat('EEE , d MMM yyyy');
    var formatted = format.format(day);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: _size.height * 0.26, // 22% of screen
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/backg.jpg')
                  )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(formatted,style: TextStyle(color: Colors.white , fontSize: 30),),
                  RichText(
                    text: TextSpan(
                        children: <InlineSpan>[
                          WidgetSpan(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(_hijri.hDay.toString(),
                                style: TextStyle(fontSize: 20,color: Colors.white),),
                            ),
                          ),
                          WidgetSpan(
                            child: Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(_hijri.longMonthName,
                                style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                            ) ,
                          ),
                          WidgetSpan(
                            child: Padding(
                              padding: EdgeInsets.all(4),
                              child: Text('${_hijri.hYear} AH',style: TextStyle(fontSize: 20,color: Colors.white),),
                            ),
                          ),
                        ]
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsetsDirectional.only(top: 10,bottom: 20),
                child: Column(
                  children: [
                    FutureBuilder<ApiTool>(
                      future: _apiServices.getApiTool(),
                      builder: (context,snapshot){
                        switch(snapshot.connectionState){
                          case ConnectionState.none:
                            return Icon(Icons.sync_problem);
                          case ConnectionState.waiting:
                          case ConnectionState.active:
                            return CircularProgressIndicator();
                          case ConnectionState.done:
                            return  Container(
                              margin: EdgeInsetsDirectional.all(8),
                              padding: EdgeInsetsDirectional.all(12),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  color: Colors.black,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 2,
                                      spreadRadius: 1,
                                      offset: Offset(0,1),
                                    )
                                  ]
                              ),
                              child: Column(
                                children: [
                                  Text("Quran Aya of the Day",
                                    style: TextStyle(color: Colors.white,
                                        fontWeight: FontWeight.bold,fontSize: 18),),
                                  Divider(color: Colors.white,thickness: 0.5,),
                                  Text(
                                    snapshot.data!.arText!,
                                    style: TextStyle(color: Colors.white, fontSize: 18),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    snapshot.data!.enTran!,
                                    style: TextStyle(color: Colors.white, fontSize: 18),
                                    textAlign: TextAlign.center,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                        children: <InlineSpan>[
                                          WidgetSpan(
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text(snapshot.data!.surNumber!.toString()
                                                ,style: TextStyle(fontSize: 16,color: Colors.white),),
                                            ),
                                          ),
                                          WidgetSpan(
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text(snapshot.data!.surEnName!
                                                  ,style: TextStyle(fontSize: 16,color: Colors.white)),
                                            ),
                                          ),
                                        ]
                                    ),
                                  ),
                                ],
                              ),
                            );
                        }
                      },
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
