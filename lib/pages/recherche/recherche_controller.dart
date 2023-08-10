import 'dart:convert';

import 'package:get/get.dart';
import 'package:sursa_admin/utils/requete.dart';
import 'package:dio/dio.dart' as d;

class RechercheController extends GetxController with StateMixin<List> {
//
  Requete requete = Requete();
  //
  Future<void> load() async {
    change([], status: RxStatus.empty());
  }

  //
  Future<void> recherche(Map e) async {
    //pseudo,pwd,profil, etat
    String req = "";
    if (e["noms"] != "") {
      req += "noms=${e['noms']}&";
    }
    if (e["sexe"] != "") {
      req += "sexe=${e['sexe']}&";
    }
    if (e["date_arrivee"] != "") {
      req += "date_arrivee=${e['date_arrivee']}&";
    }
    if (e["pays_visite"] != "") {
      req += "pays_visite=${e['pays_visite']}&";
    }
    if (e["compagnie"] != "") {
      req += "compagnie=${e['compagnie']}&";
    }
    if (e["num_passeport"] != "") {
      req += "num_passeport=${e['num_passeport']}&";
    }
    if (e["num_vol"] != "") {
      req += "num_vol=${e['num_vol']}&";
    }
    // else {
    //   req += "";
    // }
    //
    String r = req.replaceRange(req.length - 1, req.length, "");
    //
    print("la requete: $r");
    change([], status: RxStatus.loading());
    d.Response rep = await requete.getE("/api/?_c=form&_a=select&$r");
    //
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      print("la rep du serveur: ${rep.data}");
      List l = jsonDecode(rep.data);
      print("La reponse: $l");
      //box.write("user", rep.body);
      //Get.back();
      //Get.snackbar("Succès", "L'enregistrement éffectué !");
      //Get.off(Connexion());
      change(l, status: RxStatus.success());
    } else {
      change([], status: RxStatus.empty());
      //Get.back();
      //Get.snackbar("Erreur", "Un problème lors de la suppression");
    }
  }
}
