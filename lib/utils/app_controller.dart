import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:get/get_connect/http/src/request/request.dart';
import 'package:dio/dio.dart' as d;
import 'package:get_storage/get_storage.dart';
import 'package:sursa_admin/pages/accueil.dart';
import 'requete.dart';

class AppController extends GetxController {
  //
  Requete requete = Requete();
  //
  var box = GetStorage();
  //
  Future<void> login(Map e) async {
    //pseudo,pwd,profil, etat
    print(
        "${Requete.url}///api/?_c=user&_a=login&pseudo=${e['pseudo']}&pwd=${e['pwd']}");
    //
    d.Response rep = await requete
        .getE("/api/?_c=user&_a=login&pseudo=${e['pseudo']}&pwd=${e['pwd']}");
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      //
      print("rep: ${rep.data}");
      Map e = jsonDecode(rep.data);
      //
      if (e["statut"] != null) {
        //
        if (e["profil"] == "Agent") {
          //
          if (e["statut"] == "non actif") {
            print(rep.data);
            //
            Get.back();
            Get.snackbar(
              "Compte",
              "Votre compte n'est pas actif veuillez contacter votre administrateur",
              backgroundColor: Colors.red.shade700,
              colorText: Colors.white,
            );
            //
          } else {
            box.write("user", json.decode(rep.data));

            //
            //box.write("user", rep.body);
            Get.back();
            Get.snackbar("Succès", "L'authentification éffectué !");
            Get.offAll(Accueil());
          }
        } else {
          //
          print(rep.data);
          //
          box.write("user", json.decode(rep.data));

          //
          //box.write("user", rep.body);
          Get.back();
          Get.snackbar("Succès", "L'authentification éffectué !");
          Get.offAll(Accueil());
        }
      } else {
        Get.back();
        Get.snackbar(
          "Oups",
          "Compte non valide",
          colorText: Colors.white,
          backgroundColor: Colors.red.shade900,
        );
      }

      //
    } else {
      //
      print(rep.statusCode);
      print(rep.data);
      //
      Get.back();
      Get.snackbar("Erreur", "Un problème lors de la suppression");
    }
  }

  //
  Future<void> enregistrement(Map e) async {
    //pseudo,pwd,profil, etat
    d.Response rep = await requete.getE(
        "/api/user/insert?pseudo=${e['pseudo']}&pwd=${e['pwd']}&profil=${e['profil']}&etat=${e['etat']}");
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      //box.write("user", rep.body);
      Get.back();
      Get.snackbar("Succès", "L'enregistrement éffectué !");
      //Get.off(Connexion());
    } else {
      Get.back();
      Get.snackbar("Erreur", "Un problème lors de la suppression");
    }
  }

  //
  Future<void> listeAll(String profil) async {
    print("/api/?_c=user&_a=select&profil=$profil");
    d.Response rep =
        await requete.getE("/api/?_c=user&_a=select&profil=$profil");
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      //box.write("user", rep.body);
      Get.back();
      Get.snackbar("Succès", "L'enregistrement à reussit");
      //Get.off(Connexion());
    } else {
      Get.back();
      Get.snackbar("Erreur", "Un problème lors de la suppression");
    }
  }
  //
  //
}
