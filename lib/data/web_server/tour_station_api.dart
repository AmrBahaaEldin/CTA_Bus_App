
import 'dart:convert';

import 'package:dio/dio.dart';

class Model{
  final dio =Dio();
  Future getPost()async{
    //get
    //post insert & del & edit
    final response =await dio.request(
        'http://192.168.1.5:8000/guide/',
      options: Options(
        method: 'GET',
       // 10 seconds timeout
      ),
    );
    if (response.statusCode == 200) {
      print(json.encode(response.data));
    }
    else {
      print(response.statusMessage);
    }
  }




}
