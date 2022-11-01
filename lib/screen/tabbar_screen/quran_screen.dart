import 'package:flutter/material.dart';
class QuranScreen extends StatefulWidget {
  const QuranScreen({Key? key}) : super(key: key);

  @override
  _QuranScreenState createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {

  @override
  Widget build(BuildContext context) {
    var _size=MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          body: Container(
            height:_size.height*0.30,
            width: double.infinity,
            child: Column(
              children: [

              ],
            ),
          ),
        ));
  }
}
