

import 'package:flutter/material.dart';
import 'package:quran_sharif_bangla/screen/main_screen.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quran Sikkha"),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.deepPurple.shade800.withOpacity(0.8),
                  Colors.teal.shade200,
                  Colors.white54.withOpacity(0.5)
                ]
            )
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),


          child: Column(

            children: [
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        IconButton(onPressed: (){},
                            icon: Icon(Icons.description),
                          iconSize: 35,
                          color: Colors.white,
                          padding: EdgeInsets.all(5),
                          focusColor: Colors.teal,
                        
                        ),
                        IconButton(onPressed: (){},
                            icon: Icon(Icons.login),iconSize: 35,color: Colors.white,),

                      ],

                    ),
                    SizedBox(height: 12,),
                    Container(
                      height: 220,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: NetworkImage(
                              "https://is3-ssl.mzstatic.com/image/thumb/Purple113/v4/0b/4d/18/0b4d1843-7de1-4c19-e451-6ee07336b9d6/source/512x512bb.jpg",


                            ),
                          fit: BoxFit.cover
                        ),
                        border: Border.all(
                          color: Colors.purple.shade100,
                          width: 3,
                        ),

                      ),


                    ),
                  ],
                ),
              ),
              Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      Text("Learn Quran, Recite once Everyday",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),)
                    ],
                  )),

              Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MainScreen()));

                      },
                          child: Text("Get Started",style: TextStyle(color: Colors.white,fontSize: 22),))
                    ],
                  ))

            ],
          ),
        ),
      ),
    );
  }
}
