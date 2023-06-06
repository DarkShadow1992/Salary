import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import '../../../Utils/Keys.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class BasePageService {

  Future<String?> postNumbers(String token,String numbers) async {
    var dio = Dio();

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient dioClient) {
      dioClient.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
      return dioClient;
    };
    dio.options.headers["Content-Type"] = "application/json;charset=UTF-8";
    dio.options.headers["Accept"] = "application/json";
    dio.options.headers["token"] = token;

    try {

      var param = {
        "user_to_add" : numbers.toEnglishDigit(),
      };


      Response<Map> response = await dio.post("${apiAddress}api/requests/follow",data: param);
      var data= await json.decode(json.encode(response.data));


      return data["message"];
    } on DioError {
      return null;
    }
  }

}