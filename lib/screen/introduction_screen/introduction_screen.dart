import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../home_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: IntroductionScreen(
              globalBackgroundColor: Colors.black,
              pages: [
                PageViewModel(

              title: "Read Quran",
              bodyWidget: Column(
               crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                Padding(

                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Customize your reading view in multiple language,"

                      ,style: TextStyle(color: Colors.white,fontSize: 18),
                    textAlign: TextAlign.center,),
                ),
                Icon(Icons.edit,color: Colors.white,),
                Text(" Be Honest and help others",
                  style: TextStyle(color: Colors.white,fontSize: 18),
                  textAlign: TextAlign.center,),
              ],
              ),
                image: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('assets/images/quran.png',
                  fit: BoxFit.cover,),
                )
              ),
                PageViewModel(

                    title: "Prayer Alert",
                    bodyWidget: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Padding(

                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Pray 5 times and see change of yourself,"

                            ,style: TextStyle(color: Colors.white,fontSize: 18),
                            textAlign: TextAlign.center,),
                        ),
                        Icon(Icons.edit,color: Colors.white,),
                        Text(" Be Honest and help others",
                          style: TextStyle(color: Colors.white,fontSize: 18),
                          textAlign: TextAlign.center,),
                      ],
                    ),
                    image: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('assets/images/prayer.png',
                        fit: BoxFit.cover,),
                    )
                ),
                PageViewModel(

                    title: "Build Better Habit",
                    bodyWidget: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Padding(

                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Help others and find peace of mind,"

                            ,style: TextStyle(color: Colors.white,fontSize: 18),
                            textAlign: TextAlign.center,),
                        ),
                        Icon(Icons.edit,color: Colors.white,),
                        Text(" Be Honest and help others",
                          style: TextStyle(color: Colors.white,fontSize: 18),
                          textAlign: TextAlign.center,),
                      ],
                    ),
                    image: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('assets/images/zakat.png',
                        fit: BoxFit.cover,),
                    )
                ),

             ],
              onDone: () {
              Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            onSkip: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => HomeScreen()));
            },
              showNextButton: true,
              showSkipButton: true,
            next: Icon(Icons.arrow_forward,color: Colors.white,),
              skip: Text("skip",style: TextStyle(color: Colors.white),),
              done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
              dotsDecorator: DotsDecorator(
              size: const Size.square(10.0),
              activeSize: const Size(20.0, 10.0),
              color: Colors.black26,
              spacing: const EdgeInsets.symmetric(horizontal: 3.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
            showBackButton: false,
          )));
        }
}
