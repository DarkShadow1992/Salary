import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import '../../../Utils/Keys.dart';
import '../Class/Categories.dart';
import '../Class/Me.dart';
import '../Class/Products.dart';
import '../Class/Requests.dart';
import '../Class/TehranCash.dart';

class HomeService {

  Future<Me?> getME(String token) async {
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

      Response<Map> response = await dio.get("${apiAddress}api/users/me");
      var data= await json.decode(json.encode(response.data));

      print(data);

      Me me=Me.fromJson(data);
      return me;
    } on DioError catch (e) {
      print(e.response!.statusCode);
      print(e.response!.data);
      return null;
    }
  }

  Future<String?> getMazaneh(String token) async {
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

      Response<Map> response = await dio.get("${apiAddress}api/prices");
      var data= await json.decode(json.encode(response.data));

      return "${data["value"][0]["price"]}|${data["value"][0]["updated_at"]}";
    } on DioError catch (e) {
      print(e.response!.statusCode);
      print(e.response!.data);
      return null;
    }
  }

  Future<Categories?> getCats(String token) async {
    var dio = Dio();

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient dioClient) {
      dioClient.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
      return dioClient;
    };
    dio.options.headers["Content-Type"] = "application/json;charset=UTF-8";
    dio.options.headers["Accept"] = "application/json";
    dio.options.headers["token"] = token;

    print(token);

    try {

      var param = {
        "take" : "100",
        "skip" : "0",
      };

      Response<Map> response = await dio.get("${apiAddress}api/categories",queryParameters: param);
      var data= await json.decode(json.encode(response.data));

      print(data);

      Categories categories=Categories.fromJson(data);

      return categories;
    } on DioError catch (e) {
      print(e.response!.statusCode);
      print(e.response!.data);
      return null;
    }
  }

  Future<Products?> getPRDS(String token, int skip,String serch,String cats,String sort,String filter) async {
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
      var param;

      param = {
        'take': "10",
        'skip':skip.toString(),
        '\$filter':
        "contains(name, '$serch')"
            "${cats.isNotEmpty ? " and category_id eq $cats" : ""}"
            "${filter.isNotEmpty ? " and $filter" : ""}",
        if(sort.isNotEmpty) '\$orderby':sort,
      };

      print(param);

      Response<Map> response = await dio.get("${apiAddress}api/products",queryParameters: param);
      var data= await json.decode(json.encode(response.data));

      log(data.toString());

      Products products=Products.fromJson(data);
      return products;
    } on DioError catch (e) {
      return null;
    }
  }

  Future<TehranCash?> getCash(String token) async {
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

      Response<Map> response = await dio.get("${apiAddress}api/kifi_wage/tehran_cash");
      var data= await json.decode(json.encode(response.data));

      print(data);

      TehranCash tehranCash=TehranCash.fromJson(data);
      return tehranCash;
    } on DioError catch (e) {
      print(e.response!.statusCode);
      print(e.response!.data);
      return null;
    }
  }

  Future<Requests?> getRequests(String token) async {
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

      Response<Map> response = await dio.get("${apiAddress}api/requests/products");
      var data= await json.decode(json.encode(response.data));

      Requests requests=Requests.fromJson(data);

      return requests;
    } on DioError catch (e) {
      return null;
    }
  }

 /* Future<String?> getPercent(String token) async {
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

      Response<Map> response = await dio.get("${apiAddress}api/settings/weight_discount_percent");
      var data= await json.decode(json.encode(response.data));

      print(data);

      return data["data"].toString();
    } on DioError catch (e) {
      print(e.response!.statusCode);
      print(e.response!.data);
      return null;
    }
  }

  Future<String?> getMin(String token) async {
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

      Response<Map> response = await dio.get("${apiAddress}api/settings/discount_min_weight");
      var data= await json.decode(json.encode(response.data));

      print(data);

      return data["data"].toString();
    } on DioError catch (e) {
      print(e.response!.statusCode);
      print(e.response!.data);
      return null;
    }
  }*/
}