import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/surah_model.dart';

Widget SurahListTile({
  required Surah surah,
required BuildContext context,
required VoidCallback ontap
})
{
  return GestureDetector(
    onTap: ontap,
    child: Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black,
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 2
          )
        ]

      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                alignment: Alignment.center,
                height: 30,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle
                ),
                child: Text(surah.number.toString(),style: TextStyle(color: Colors.white , fontSize: 14),),
              ),
              SizedBox(width: 12,),
              Column(
                children: [
                  Text(surah.englishName!,style: TextStyle(color: Colors.white , fontSize: 16,fontWeight: FontWeight.bold),),
                  Text(surah.englishNameTranslation!,style: TextStyle(color: Colors.white , fontSize: 12),),
                ],
              ),
              Spacer(),
              Column(
                children: [
                  Text(surah.name!,style: TextStyle(color: Colors.white , fontSize: 16),),
                ],
              ),


            ],
          )
        ],
      ),
    ),
  );
}