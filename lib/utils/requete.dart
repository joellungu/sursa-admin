import 'package:get/get.dart';
import 'package:dio/dio.dart' as d;

final dio = d.Dio();

class Requete extends GetConnect {
  static String url = "https://www.api.sursa.cd";
  //static String url = "http://192.168.1.185/www/sursa";
  //static String url = "http://10.0.2.2:8080";
  //static String ws = "ws://10.0.2.2:8080";
  Future<d.Response> getE(String path) async {
    print("$url/$path");
    return dio.get("$url/$path");
  }

  Future<d.Response> postE(String path, var e) async {
    return dio.post("$url/$path", data: e);
  }

  Future<d.Response> putE(String path, var e) async {
    return dio.put("$url/$path", data: e);
  }

  Future<d.Response> deleteE(String path) async {
    return dio.delete("$url/$path");
  }
}
