// ignore_for_file: file_names, non_constant_identifier_names, unused_local_variable

import 'package:dio/dio.dart';

class AreaData {
  static Future<List<String>> getArea() async {
    Response response = await Dio()
        .get('https://www.themealdb.com/api/json/v1/1/list.php?a=list');
    List<String> areaList = [];
    if (response.statusCode == 200) {
      for (int i = 0; i < response.data['meals'].length; i++) {
        areaList.add(response.data['meals'][i]['strArea']);
      }
    }
    return areaList;
  }
}
