
import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart';
import 'package:quran_sharif_bangla/model/ayatmodel.dart';
import 'package:http/http.dart' as http;
import 'package:quran_sharif_bangla/model/juz_model.dart';

import '../model/surah_model.dart';

class ApiServices {

  final endPointUrl="http://api.alquran.cloud/v1/surah";
  List<Surah>list=[];
  Future<ApiTool> getApiTool() async {

    // for random Aya we need to generate random number
    // (1,6237) from 1 to 6236
    // Random Aya
    String url = "https://api.alquran.cloud/v1/ayah/${random(1,6237)}/editions/quran-uthmani,en.asad,en.pickthall";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return ApiTool.fromJSON(json.decode(response.body));
    } else {
      print("Failed to load");
      throw Exception("Failed  to Load Post");
    }
  }
  random(min, max){
    var rn = new Random();
    return min + rn.nextInt(max - min);
  }



  Future<List<Surah>>getSurah()async{
    String url = "https://api.alquran.cloud/v1/ayah/${random(1,6237)}/editions/quran-uthmani,en.asad,en.pickthall";
    Response resp=await http.get(Uri.parse(endPointUrl));
    if(resp.statusCode==200){
      print("api ok");
      Map<String,dynamic>json=jsonDecode(resp.body);
      print("jsondecode ok");
      json['data'].forEach((element){
        if(list.length<114){
          list.add(Surah.fromJSON(element));
          print("fromjson ok");
        }
      });
      print("length ok ${list.length}");
      return list;

    }
    else{
      throw("can't get the surah");
    }

  }

  Future<JuzModel> getJuzz(int index) async {
    String url = "http://api.alquran.cloud/v1/juz/$index/quran-uthmani";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return JuzModel.fromJSON(json.decode(response.body));
    } else {
      print("Failed to load");
      throw Exception("Failed  to Load Post");
    }
  }

}