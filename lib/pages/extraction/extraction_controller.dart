import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart' as d;

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:sursa_admin/utils/requete.dart';

class ExtractionController extends GetxController with StateMixin<String> {
  //
  Requete requete = Requete();
  //
  loader() async {
    change("", status: RxStatus.empty());
  }

  //
  Future<void> downloadFile(String url, String fileName, String dir,
      String date_create_a, String date_create_b) async {
    change("", status: RxStatus.loading());
    HttpClient httpClient = new HttpClient();
    File file;
    String filePath = '';
    String myUrl = Requete.url;

    d.Response rep = await requete.getE(
        "api/?_c=form&_a=export&date_creat_a=$date_create_a&date_creat_b=$date_create_b");

    if (rep.statusCode == 200 || rep.statusCode == 201) {
      print("cool tout ok ${rep.data}");
      var bytes = '${rep.data}'.codeUnits;
      print('la rep:  ${bytes.length}');
      filePath = '$dir$fileName';
      file = File(filePath);
      await file.writeAsBytes(bytes);

      change(filePath, status: RxStatus.success());
    } else {
      change("Un problème lors du téléchargement", status: RxStatus.success());
    }

    // try {
    //   //myUrl = url + '/' + fileName;
    //   var request = await httpClient.getUrl(Uri.parse(
    //       "$myUrl/api/?_c=form&_a=export&date_create_a=$date_create_a&date_create_b=$date_create_b"));
    //   var response = await request.close();
    //   if (response.statusCode == 200) {
    //     var bytes = await consolidateHttpClientResponseBytes(response);
    //     print('la rep:  ${bytes.length}');
    //     filePath = '$dir/$fileName';
    //     file = File(filePath);
    //     await file.writeAsBytes(bytes);
    //   } else
    //     filePath = 'Error code: ' + response.statusCode.toString();
    // } catch (ex) {
    //   filePath = 'Can not fetch url';
    // }

    //return filePath;
  }
}
