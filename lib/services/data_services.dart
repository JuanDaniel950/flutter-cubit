import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:personal/model/data_model.dart';

class DataServices {
  //server pruebas abiertas en cualquier momento no estará disponible
  String baseUrl = "http://mark.bslmeiyu.com/api";

  Future<List<DataModel>> getInfo() async {
    var apiUrl = "/getplaces";
    http.Response res = await http.get(Uri.parse(baseUrl + apiUrl));

    try {
      if (res.statusCode == 200) {
        List<dynamic> list = jsonDecode(res.body);
        return list.map((e) => DataModel.fromJson(e)).toList();
      } else {
        return <DataModel>[];
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
      return <DataModel>[];
    }
  }
}
