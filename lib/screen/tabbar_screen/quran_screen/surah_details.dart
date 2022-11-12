import 'package:flutter/material.dart';
import 'package:quran_sharif_bangla/service/api_service.dart';
import 'package:quran_sharif_bangla/service/constants.dart';
import 'package:quran_sharif_bangla/widget/translation.dart';

import '../../../model/surah_translation.dart';
class SurahDetails extends StatefulWidget {
  const SurahDetails({Key? key}) : super(key: key);
  static const String id='surahDetails_screen';

  @override
  _SurahDetailsState createState() => _SurahDetailsState();
}

class _SurahDetailsState extends State<SurahDetails> {
  ApiServices _apiservices=ApiServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: _apiservices.getTranslation(Constantss.surahIndex!),
          builder: (BuildContext context,AsyncSnapshot<SurahTranslationList>snapshot){
            if(snapshot.connectionState==ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            else if(snapshot.hasData){
              return ListView.builder(
                  itemCount: snapshot.data!.translationList.length,
                  itemBuilder: (context,index){
                    return TranslationTile(index: index,
                        surahTranslation: snapshot.data!.translationList[index]);
                  });
            }
            else return Center(child: Text("translation error"),);

          }),

    );
  }
}
