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
        "${Requete.url}/user/login?email=${e['email']}&pwd=${e['pwd']}&profil=admin");
    //
    d.Response rep = await requete
        .getE("user/login?email=${e['email']}&pwd=${e['pwd']}&profil=admin");
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      //
      print("rep: ${rep.data}");
      Map e = jsonDecode(rep.data);
      //
      if (e["etat"] == "actif") {
        //
        if (e["profil"] == "admin" || e["profil"] == "S-Agent") {
          //
          print(rep.data);
          //
          box.write("user", json.decode(rep.data));

          //
          //box.write("user", rep.body);
          Get.back();
          Get.snackbar("Succès", "L'authentification éffectué !");
          Get.offAll(Accueil());
        } else {
          //
          print(rep.data);
          //
          box.write("user", json.decode(rep.data));

          //
          //box.write("user", rep.body);
          Get.back();
          Get.snackbar(
            "Erreur",
            "Vous n'etes pas un administrateur",
            colorText: Colors.white,
            backgroundColor: Colors.red.shade900,
          );
          //Get.offAll(Accueil());
        }
      } else {
        Get.back();
        Get.snackbar(
          "Oups",
          "Compte non actif",
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
        "user/insert?pseudo=${e['pseudo']}&pwd=${e['pwd']}&profil=${e['profil']}&etat=${e['etat']}");
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
    print("user?select&profil=$profil");
    d.Response rep = await requete.getE("user?select&profil=$profil");
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
  Future<void> mdpOublier(String email) async {
    print("user?forgot&email=$email");
    //print(
    //  "rep:  https://www.sky-workspace.com/sursa/?_c=form&_a=get&id=$id");
    d.Response rep = await requete.getE(
      "user?forgot&email=$email",
    );
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      // print("rep: ${rep.statusCode} == $id == $id_user");
      print("rep: ${rep.data}");

      //box.write("user", rep.body);

      Get.back();
      Get.snackbar("Succès",
          "Un email a été envoyé dans votre compte pour reeinitialiser votre mot de passe");
      //Get.to(Details(jsonDecode(rep.data)));
    } else {
      print("rep: ${rep.data}");
      //Get.back();
      Get.snackbar("Erreur", "Un problème lors de la vérification");
    }
  }
  //
  //
}
