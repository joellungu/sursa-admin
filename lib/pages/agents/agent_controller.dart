import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sursa_admin/utils/requete.dart';
import 'package:dio/dio.dart' as d;

class AgentController extends GetxController with StateMixin<List> {
  Requete requete = Requete();
  load(int id) async {
    d.Response rep = await requete.getE(
      "agents/all/$id",
    );
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      //
      change(rep.data, status: RxStatus.success());
    } else {
      //
      change([], status: RxStatus.empty());
    }
  }

  //
  Future<List> getPosteFrontalier() async {
    d.Response rep = await requete.getE(
      "/api/?_c=poste&_a=select",
    );
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      //
      print("data  ${rep.data}");
      return jsonDecode(rep.data);
      //
      //change(rep.data, status: RxStatus.success());
    } else {
      //
      return [];
      //change([], status: RxStatus.empty());
    }
  }

  //
  Future<List> getAgence() async {
    d.Response rep = await requete.getE(
      "/api/?_c=agence&_a=select",
    );
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      //
      print("data  ${rep.data}");
      return jsonDecode(rep.data);
      //
      //change(rep.data, status: RxStatus.success());
    } else {
      //
      return [];
      //change([], status: RxStatus.empty());
    }
  }

  //
  Future<List> getPays() async {
    d.Response rep = await requete.getE(
      "/api/?_c=common&_a=compagnie-list",
    );
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      //
      print("data  ${rep.data}");
      return jsonDecode(rep.data);
      //
      //change(rep.data, status: RxStatus.success());
    } else {
      //
      return [];
      //change([], status: RxStatus.empty());
    }
  }

  //
  Future<void> enregistrement(Map e) async {
    //pseudo,pwd,profil, etat
    print(e);
    //?_c=user&_a=select&id_agence=
    //&pseudo=${e['pseudo']}&pwd=${e['pwd']}&profil=${e['profil']}&etat=${e['etat']}
    d.Response rep = await requete.getE(
        "/api/?_c=user&_a=insert&pseudo=${e['pseudo']}&pwd=${e['pwd']}&profil=${e['profil']}&statut=${e['statut']}&telephone=${e['telephone']}&email=${e['email']}&id_agence=${e['id_agence']}&id_poste=${e['id_poste']}");
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      print("data: ${rep.data}");
      //box.write("user", rep.data);
      Get.back();
      Get.snackbar("Succès", "L'enregistrement éffectué !");
      //Get.off(Connexion());
    } else {
      print("data: ${rep.data}");
      Get.back();
      Get.snackbar("Erreur", "Un problème lors de l'enregistrement");
    }
  }

  //
  Future<void> miseajour(Map e) async {
    //pseudo,pwd,profil, etat
    print("maj:: $e");
    //?_c=user&_a=select&id_agence=
    //&pseudo=${e['pseudo']}&pwd=${e['pwd']}&profil=${e['profil']}&etat=${e['etat']}
    d.Response rep = await requete.getE(
        "/api/?_c=user&_a=update&pseudo=${e['pseudo']}&pwd=${e['pwd']}&profil=${e['profil']}&statut=${e['statut']}&telephone=${e['telephone']}&email=${e['email']}&id_agence=${e['id_agence']}&id_poste=${e['id_poste']}&id=${e['id']}");
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      print("data: ${rep.data}");
      //box.write("user", rep.data);
      Get.back();
      Get.snackbar("Succès", "Mise à jour éffectué !");
      //Get.off(Connexion());
    } else {
      print("data: ${rep.data}");
      Get.back();
      Get.snackbar("Erreur", "Un problème lors de l'enregistrement");
    }
  }

  //
  Future<void> getAllAgents(int id) async {
    //pseudo,pwd,profil, etat
    //print(id);
    //?_c=user&_a=select&id_agence=
    //&pseudo=${e['pseudo']}&pwd=${e['pwd']}&profil=${e['profil']}&etat=${e['etat']}
    d.Response rep =
        await requete.getE("/api/?_c=user&_a=select&id_agence=$id");
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      //print("data: ${rep.data}");
      //return jsonDecode(rep.data);
      change(jsonDecode(rep.data), status: RxStatus.success());
      //box.write("user", rep.data);
      //Get.back();
      //Get.snackbar("Succès", "L'enregistrement éffectué !");
      //Get.off(Connexion());
    } else {
      //print("data: ${rep.data}");
      change([], status: RxStatus.empty());
      //Get.back();
      //Get.snackbar("Erreur", "Un problème lors de l'enregistrement");
    }
  }

  //
  Future<void> listeAll(String profil) async {
    //
    change([], status: RxStatus.loading());
    //
    print("/api/?_c=user&_a=select&profil=$profil");
    d.Response rep =
        await requete.getE("/api/?_c=user&_a=select&profil=$profil");
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      print(rep.data);
      //box.write("user", rep.data);
      Get.back();
      //Get.snackbar("Succès", "L'enregistrement à reussit");
      change(rep.data, status: RxStatus.success());
      //Get.off(Connexion());
    } else {
      print(rep.data);
      Get.back();
      Get.snackbar("Vide", "Pas $profil trouvé");
      change(rep.data, status: RxStatus.empty());
    }
  }

  // enregistrement(Map e) async {
  //   Response rep = await requete.postE("agents", e);
  //   if (rep.statusCode == 200 || rep.statusCode == 201) {
  //     Get.back();
  //     //
  //     Get.snackbar(
  //       "Succès",
  //       "Enregistrement éffectué",
  //     );
  //   } else {
  //     //
  //     Get.back();
  //     Get.snackbar(
  //       "Erreur",
  //       "Enregistrement non éffectué code: ${rep.statusCode}",
  //     );
  //   }
  // }

  supprimer(String id) async {
    d.Response rep = await requete.deleteE(
      "agents/$id",
    );
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      Get.back();
      Get.back();
      load(1);
      //
      Get.snackbar(
        "Succès",
        "Suppression éffectué",
      );
    } else {
      //
      Get.back();
      Get.snackbar(
        "Erreur",
        "Suppression non éffectué code: ${rep.statusCode}",
      );
    }
  }
}
