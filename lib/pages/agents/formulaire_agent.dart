import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'agent_controller.dart';

class FormulaireAgent extends StatelessWidget {
  late Map user;
  var box = GetStorage();
  FormulaireAgent() {
    //
    user = box.read("user") ?? {};
    //
    agence.value = user['id_ets'].runtimeType == String
        ? int.parse(user['id_ets'])
        : user['id_ets'];
  }
  //
  final formKey = GlobalKey<FormState>();
  final nom = TextEditingController();
  final pseudo = TextEditingController();
  final telephone = TextEditingController();
  final email = TextEditingController();
  final status = TextEditingController();
  var pays = "CD";
  var codePays = "+243";
  RxInt c = 1.obs;
  //
  RxList l = [].obs;
  //
  AgentController agentController = Get.find();
  //
  List frontiers = [
    "Aéroport int. De Njili",
    "Beach Ngobila",
    "Frontière de Lufu",
    "Port de Matadi",
    "Port de Boma",
    "Port de Banana (muanda)",
    "Aéroport int. De Luano",
    "kasumbalesa",
    "Port de Kalemi",
    "Maluku de kasongolunda",
    "dhafudji de kayemba",
    "Aéroport  De bunia",
    "mahagi",
    "Tchomia ",
    "Aru",
    "Aéro Goma Int",
    "Frontière Grande barrière Goma",
    "Frontière de Kasindi-Ouganda",
    "Frontière Petite barrière Goma",
    "Bunagana ",
    "Kamanyola",
    "KAVIMVIRA",
    "Ruzizi 1",
    "Ruzizi 2",
    "Aéroport de Bangboka ",
    "Tshikapa ",
    "kamako",
  ];
  //
  RxInt frontier = RxInt(1);
  //
  RxList agences = [].obs;
  //
  RxInt agence = 1.obs;
  //
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: Center(
          child: Container(
            width: 400,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Nouvel agent",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  flex: 1,
                  child: Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: ListView(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: nom,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 5),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              prefixIcon: const Icon(Icons.person),
                              hintText: 'Noms'.tr,
                              labelText: 'Noms'.tr,
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'nom_message'.tr;
                              }

                              return null;
                            },
                            onChanged: (value) {
                              //print("Password value $value");
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          // TextFormField(
                          //   controller: pseudo,
                          //   decoration: InputDecoration(
                          //     contentPadding: EdgeInsets.symmetric(vertical: 5),
                          //     border: OutlineInputBorder(
                          //       borderRadius: BorderRadius.circular(20),
                          //     ),
                          //     prefixIcon: const Icon(Icons.person),
                          //     hintText: 'pseudo'.tr,
                          //     labelText: 'pseudo'.tr,
                          //   ),
                          //   validator: (value) {
                          //     if (value!.isEmpty) {
                          //       return 'nom_message'.tr;
                          //     }

                          //     return null;
                          //   },
                          //   onChanged: (value) {
                          //     //print("Password value $value");
                          //   },
                          // ),
                          // const SizedBox(
                          //   height: 20,
                          // ),
                          TextFormField(
                            controller: telephone,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 5),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              prefixIcon: const Icon(Icons.phone_android),
                              hintText: 'telephone'.tr,
                              labelText: 'telephone'.tr,
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'telephone'.tr;
                              }

                              return null;
                            },
                            onChanged: (value) {
                              //print("Password value $value");
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: email,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 5),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              prefixIcon: const Icon(Icons.email),
                              hintText: 'email'.tr,
                              labelText: 'email'.tr,
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'email'.tr;
                              }

                              return null;
                            },
                            onChanged: (value) {
                              //print("Password value $value");
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Obx(
                            () => Container(
                              height: 50,
                              // ignore: sort_child_properties_last
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.manage_accounts,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<int>(
                                        items: const [
                                          //"Chauffeur","Receveur","Embarqueur"
                                          // DropdownMenuItem(
                                          //   value: 1,
                                          //   child: Text("Super admin"),
                                          // ),
                                          DropdownMenuItem(
                                            value: 1,
                                            child: Text("S-Agent"),
                                          ),
                                          DropdownMenuItem(
                                            value: 2,
                                            child: Text("Agent"),
                                          ),
                                        ],
                                        onChanged: (e) {
                                          c.value = e as int;
                                        },
                                        value: c.value,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: Get.size.height / 9,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Poste frantalier",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      width: Get.size.width / 2.1,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Colors.black,
                                        ),
                                      ),
                                      child: FutureBuilder(
                                        future: agentController
                                            .getPosteFrontalier(),
                                        builder: (c, t) {
                                          if (t.hasData) {
                                            //
                                            List ll = t.data as List;
                                            l = ll.obs;
                                            print("la liste de trucs2: $l");
                                            //
                                            return Obx(
                                              () => DropdownButtonHideUnderline(
                                                child: DropdownButton<int>(
                                                  onChanged: (c) {
                                                    //
                                                    frontier.value = c as int;
                                                  },
                                                  value: frontier.value,
                                                  items: List.generate(l.length,
                                                      (index) {
                                                    Map e = l[index];
                                                    return DropdownMenuItem(
                                                      value: index,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.all(10),
                                                        child: Text.rich(
                                                          TextSpan(
                                                            text:
                                                                "${e['lib']}\n",
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 13,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                            children: [
                                                              TextSpan(
                                                                text:
                                                                    "Province: ${e['province']}",
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                        13,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                                ),
                                              ),
                                            );
                                          } else if (t.hasError) {
                                            return Container();
                                          }
                                          return Container(
                                            height: 40,
                                            width: 40,
                                            alignment: Alignment.center,
                                            child:
                                                const CircularProgressIndicator(),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: Get.size.height / 9,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Agence",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      width: Get.size.width / 2.1,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Colors.black,
                                        ),
                                      ),
                                      child: FutureBuilder(
                                        future: agentController.getAgence(),
                                        builder: (c, t) {
                                          if (t.hasData) {
                                            //
                                            List ll = t.data as List;
                                            agences = ll.obs;
                                            Map e = {};
                                            ll.forEach((element) {
                                              if (element['id'] ==
                                                  "${agence.value}") {
                                                e = element;
                                              }
                                            });
                                            //print("la liste de trucs2: $l");
                                            return Container(
                                              alignment: Alignment.center,
                                              height: 48,
                                              child: Text("${e['lib'] ?? ''}"),
                                            );
                                            //
                                            return Obx(
                                              () => DropdownButtonHideUnderline(
                                                child: DropdownButton<int>(
                                                  isExpanded: true,
                                                  onChanged: (c) {
                                                    //
                                                    agence.value = c as int;
                                                  },
                                                  value: frontier.value,
                                                  items: List.generate(
                                                      agences.length, (index) {
                                                    Map e = agences[index];
                                                    return DropdownMenuItem(
                                                      value: index,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.all(10),
                                                        child: Text.rich(
                                                          TextSpan(
                                                            text: "${e['lib']}",
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 13,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                            // children: [
                                                            //   TextSpan(
                                                            //     text:
                                                            //         "Province: ${e['province']}",
                                                            //     style: const TextStyle(
                                                            //         fontSize:
                                                            //             13,
                                                            //         fontWeight:
                                                            //             FontWeight
                                                            //                 .bold),
                                                            //   ),
                                                            // ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                                ),
                                              ),
                                            );
                                          } else if (t.hasError) {
                                            return Container();
                                          }
                                          return Container(
                                            height: 40,
                                            width: 40,
                                            alignment: Alignment.center,
                                            child:
                                                const CircularProgressIndicator(),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Obx(
                          //   () => c.value == 2
                          //       ? Container(
                          //           height: 50,
                          //           // ignore: sort_child_properties_last
                          //           child: Row(
                          //             mainAxisAlignment:
                          //                 MainAxisAlignment.spaceBetween,
                          //             children: [
                          //               IconButton(
                          //                 onPressed: () {},
                          //                 icon: const Icon(
                          //                   Icons.manage_accounts,
                          //                   color: Colors.grey,
                          //                 ),
                          //               ),
                          //               Expanded(
                          //                 flex: 1,
                          //                 child: DropdownButtonHideUnderline(
                          //                   child: DropdownButton<int>(
                          //                     items: List.generate(
                          //                         frontiers.length, (index) {
                          //                       return DropdownMenuItem(
                          //                         value: index + 1,
                          //                         child: Text(
                          //                             "${frontiers[index]}"),
                          //                       );
                          //                     }),
                          //                     onChanged: (e) {
                          //                       frontier.value = e as int;
                          //                     },
                          //                     value: frontier.value,
                          //                   ),
                          //                 ),
                          //               )
                          //             ],
                          //           ),
                          //           decoration: BoxDecoration(
                          //             borderRadius: BorderRadius.circular(20),
                          //             border: Border.all(
                          //               color: Colors.grey,
                          //             ),
                          //           ),
                          //         )
                          //       : Container(),
                          // ),

                          // const SizedBox(
                          //   height: 10,
                          // ),
                          // Container(
                          //   height: 50,
                          //   // ignore: sort_child_properties_last
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //     children: [
                          //       IconButton(
                          //         onPressed: () {},
                          //         icon: const Icon(
                          //           Icons.manage_accounts,
                          //           color: Colors.grey,
                          //         ),
                          //       ),
                          //       Expanded(
                          //         flex: 1,
                          //         child: Obx(
                          //           () => DropdownButtonHideUnderline(
                          //             child: DropdownButton<int>(
                          //               items: List.generate(agences.length,
                          //                   (index) {
                          //                 return DropdownMenuItem(
                          //                   value: index + 1,
                          //                   child: Text("${agences[index]}"),
                          //                 );
                          //               }),
                          //               onChanged: (e) {
                          //                 agence.value = e as int;
                          //               },
                          //               value: agence.value,
                          //             ),
                          //           ),
                          //         ),
                          //       )
                          //     ],
                          //   ),
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(20),
                          //     border: Border.all(
                          //       color: Colors.grey,
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Map u = {};
                      if ([
                            "s-agent",
                            "agent",
                          ][c.value - 1] ==
                          "s-agent") {
                        u = {
                          "nom": nom.text,
                          "pseudo": pseudo.text,
                          "telephone": telephone.text,
                          "email": email.text,
                          "pwd": "123456789",
                          "profil": [
                            "s-agent",
                            "agent",
                          ][c.value - 1],
                          "statut": "non actif",
                          "id_ets": agence.value,
                          "id_poste": l[frontier.value]['id'],
                        };
                      } else {
                        u = {
                          "nom": nom.text,
                          "pseudo": pseudo.text,
                          "telephone": telephone.text,
                          "email": email.text,
                          "pwd": "123456789",
                          "profil": [
                            "s-agent",
                            "agent",
                          ][c.value - 1],
                          "statut": "non actif",
                          "id_ets": agence.value,
                          "id_poste": l[frontier.value]['id'],
                        };
                      }

                      Get.dialog(
                        const Center(
                          child: SizedBox(
                            height: 40,
                            width: 40,
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      );
                      /*
                {
                  "nom": nom.text,
                  "email": email.text,
                  "numero": telephone.text,
                  "codePostal": pays,
                  "nomEntreprise": "",
                  "adresseEntreprise": "",
                  "gradeDansEntreprise": "",
                  "autreInfos": "",
                  "prime": "",
                };
                */
                      agentController.enregistrement(u);
                      //
                    }
                  },
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(
                      const Size(
                        double.maxFinite,
                        45,
                      ),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.red.shade900),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    width: double.maxFinite,
                    child: const Text("Enregistrer"),
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
