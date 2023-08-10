import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Details extends StatelessWidget {
  String? code;
  Map? infos;
  //
  //
  Details(this.infos) {
    print(
        "${infos!['id_valid']} =|= ${infos!['date_valid']} =|= ${infos!['etat_valid']}");
    // infos = {
    //   "id": 5,
    //   "nom": "BOKETSHU",
    //   "postnom": "BOKOMO",
    //   "prenom": "JOEL",
    //   "sexe": "M",
    //   "date_nais": "1961-07-15",
    //   "date_arrivee": "2023-08-13",
    //   "nationalite": "R\u00e9publique du Congo",
    //   "pays_origine": "Belize",
    //   "num_passeport": "op4552099",
    //   "telephone": "+24309818790577",
    //   "email": "joelbkm@gmail.com",
    //   "voie_transport": "Voie a\u00e9rienne",
    //   "compagnie": "Ethiopian Airlines",
    //   "num_vol": "ET840",
    //   "province_actuel": null,
    //   "province_dest": null,
    //   "num_siege": "24B",
    //   "destination": null,
    //   "pays_visite": null,
    //   "fievre": 1,
    //   "sensation_fievre": 1,
    //   "test_covid": 1,
    //   "toux": 1,
    //   "symptomes": "",
    //   "difficulte_respiratoire": 1,
    //   "assurance_maladie": 1,
    //   "adresse": "Mont ngafula villa 661",
    //   "langue": "",
    //   "poids": "98",
    //   "taille": 166,
    //   "code": "",
    //   "etat": "Actif",
    //   "mvt": null,
    //   "date_creat": "2023-07-29 17:18:41",
    //   "id_valid": null,
    //   "date_valid": null,
    //   "etat_valid": null,
    //   "id_verif": null,
    //   "date_verif": null,
    //   "etat_verif": null,
    //   "noms": "BOKETSHU BOKOMO JOEL",
    //   "avatar": "http:\/\/localhost\/www\/sursa\/img\/avatar\/5.jpg",
    //   "qrcode": "http:\/\/localhost\/www\/sursa\/img\/qrcode\/5.png",
    //   "exp": ""
    // };
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red.shade900, // Status bar color
      child: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Informations du passager"),
            backgroundColor: Colors.red.shade900,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              // Container(
              //   height: 45,
              //   alignment: Alignment.center,
              //   child: ToggleButtons(
              //     isSelected: [true, false],
              //     onPressed: (t) {
              //       //
              //     },
              //     selectedColor: Colors.black,
              //     fillColor: Colors.grey.shade200,
              //     borderRadius: BorderRadius.circular(15),
              //     textStyle: const TextStyle(
              //       fontWeight: FontWeight.bold,
              //       fontSize: 15,
              //     ),
              //     children: const [
              //       Text("  Conforme "),
              //       Text(" Non Conforme  "),
              //     ],
              //   ),
              // ),
              Expanded(
                flex: 1,
                child: ListView(
                  padding: const EdgeInsets.all(0),
                  children: [
                    Container(
                      height: 30,
                      alignment: Alignment.centerLeft,
                      // child: Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Container(
                      //       height: 30,
                      //       width: 5,
                      //       color: Colors.lightBlue.shade300,
                      //     ),
                      //     Text("Informations du passager"),
                      //     Text(""),
                      //   ],
                      // ),
                    ),
                    ListTile(
                      title: const Text("Moyen de transport"),
                      subtitle: Text("${infos!['voie_transport']}"),
                    ),
                    //champ("Voie de transport ", "${infos!['voie_transport']}",
                    //  Icons.menu),
                    const Divider(),
                    champ("Nom", "${infos!['nom']}", Icons.person),
                    champ("Postnom", "${infos!['postnom']}", Icons.person),
                    champ("Prenom", "${infos!['prenom']}", Icons.person),
                    champ("Sexe", "${infos!['sexe']}", Icons.category),
                    champ("Email", "${infos!['email']}", Icons.email),
                    champ("Numéro téléphone", "${infos!['telephone']}",
                        Icons.numbers),
                    champ("Date naissance", "${infos!['date_nais']}",
                        Icons.calendar_month),
                    champ("Lieu de naissance", "${infos!['nom']}",
                        Icons.location_on),
                    champ("Nationalité", "${infos!['nationalite']}",
                        Icons.language),
                    champ("Pays d'origine", "${infos!['pays_origine']}",
                        Icons.language),
                    champ("Date d'arrivé", "${infos!['date_arrivee']}",
                        Icons.calendar_today),
                    champ("Date Creation", "${infos!['date_creat']}",
                        Icons.calendar_today),
                    champ("Compagnie aérienne", "${infos!['compagnie']}",
                        Icons.airplane_ticket),
                    champ(
                        "Mouvement", "${infos!['mvt']}", Icons.airplane_ticket),
                    champ("Numéro de vol", "${infos!['num_vol']}",
                        Icons.airplane_ticket),
                    champ("Numéro de siège", "${infos!['num_siege']}",
                        Icons.airplane_ticket),
                    champ("Ville de destination", "${infos!['destination']}",
                        Icons.location_on),
                    champ("Pays visités ", "${infos!['pays_visite']}",
                        Icons.location_on),
                    champ(
                        "Température corporelle",
                        infos!['fievre'] == 1 ? 'Oui' : 'Non',
                        Icons.thermostat),
                    champ("Maux", "${infos!['nom']}", Icons.sick),
                    champ("Fièvre", infos!['fievre'] == 1 ? 'Oui' : 'Non',
                        Icons.sick),
                    champ(
                        "Sensation Fievre",
                        infos!['sensation_fievre'] == 1 ? 'Oui' : 'Non',
                        Icons.sick),
                    champ(
                        "PCR Covid19 négatif",
                        infos!['test_covid'] == 1 ? 'Oui' : 'Non',
                        Icons.coronavirus),
                    champ("Toux", infos!['toux'] == 1 ? 'Oui' : 'Non',
                        Icons.sick),
                    champ("Symptomes", "${infos!['symptomes']}", Icons.sick),
                    champ(
                        "Difficulté à respirer ",
                        infos!['difficulte_respiratoire'] == 1 ? 'Oui' : 'Non',
                        Icons.air),
                    champ(
                        "Assurance Maladie ",
                        infos!['assurance_maladie'] == 1 ? 'Oui' : 'Non',
                        Icons.air),

                    champ(
                        "Nom de la personne-ressource (le plus proche parent)",
                        "${infos!['nom']}",
                        Icons.person),
                    champ("Numéro passeport", "${infos!['num_passeport']}",
                        Icons.person),
                    champ("Numéro de téléphone de la personne à contacter",
                        "${infos!['nom']}", Icons.numbers),
                    champ("Village/Numéro de maison/Hôtel", "${infos!['nom']}",
                        Icons.hotel),
                    champ("Sous-location/Domaine ", "${infos!['nom']}",
                        Icons.hotel),
                    champ("Adresse ", "${infos!['adresse']}", Icons.hotel),
                    //champ("Adresse postale ", "${infos!['nom']}", Icons.hotel),
                    /**
                     * infos!['id_valid'] = "${user['id']}"; //
                                infos!['date_valid'] = "$dateTime";
                                infos!['etat_valid']
                     */
                    infos!['id_valid'] == null ||
                            infos!['date_valid'] == null ||
                            infos!['etat_valid'] == null
                        ? Container(
                            alignment: Alignment.center,
                            child: Text.rich(
                              TextSpan(
                                text:
                                    "*************** EN ATTENTE ***************\n",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.red.shade900),
                                children: [
                                  const TextSpan(
                                    text:
                                        "Ce formumaire n'a pas été utilisé et est ",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "", //${infos!['etat_valid']}
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue.shade900,
                                    ),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )
                        : Container(
                            alignment: Alignment.center,
                            child: Text.rich(
                              TextSpan(
                                text:
                                    "*************** ATTENTION ***************\n",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.red.shade900),
                                children: [
                                  const TextSpan(
                                    text:
                                        "Ce formumaire à déjà été utilisé et est ",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "${infos!['etat_valid']}",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue.shade900,
                                    ),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget champ(String titre, String valeur, IconData ic) {
    return ListTile(
      leading: Icon(
        ic,
        size: 40,
      ),
      title: Text(
        titre,
        style: const TextStyle(
          fontSize: 17,
          color: Colors.grey,
        ),
      ),
      subtitle: Text(
        valeur,
        style: const TextStyle(
          fontSize: 17,
          color: Colors.black,
        ),
      ),
    );
  }
}
