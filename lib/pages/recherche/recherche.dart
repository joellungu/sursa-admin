import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sursa_admin/pages/agents/agent_controller.dart';

import 'details.dart';
import 'recherche_controller.dart';

class Recherche extends GetView<RechercheController> {
  TextEditingController __noms = TextEditingController(); //
  TextEditingController __num_passeport = TextEditingController();
  TextEditingController __num_vol = TextEditingController();
  TextEditingController _reference = TextEditingController();
  TextEditingController __datedepart = TextEditingController();
  TextEditingController __heuredepart = TextEditingController();
  TextEditingController __datearrive = TextEditingController();
  TextEditingController __heurearrive = TextEditingController();
  //
  AgentController agentController = Get.find();
//
  Recherche() {
    controller.load();
  }
//
  String _datedepart = "";
  String _heuredepart = "";
  String _datearrive = "";
  String _heurearrive = "";
  //
  List userList = [];
  //
  RxInt c = 1.obs;
  //
  RxList companies = [].obs;
  RxList paysVisites = [].obs;
  //
  RxInt companie = 1.obs;
  RxInt paysVisite = 1.obs;
  RxBool companieBool = false.obs;
  RxBool paysVisiteBool = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade900,
        title: const Text("Filtre"),
        centerTitle: true,
      ),
      endDrawer: Drawer(
        elevation: 0,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          color: Colors.red.shade100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 70,
                      child: Column(
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Nom du voyageur"),
                          ),
                          Expanded(
                            flex: 1,
                            child: TextField(
                              controller: __noms,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.person),
                                hintText: "Exemple: Jean Lulu",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 70,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Sexe"),
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
                                    icon: Icon(
                                      Icons.woman,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<int>(
                                        items: const [
                                          //"Chauffeur","Receveur","Embarqueur"
                                          DropdownMenuItem(
                                            child: Text("Aucun"),
                                            value: 1,
                                          ),
                                          DropdownMenuItem(
                                            child: Text("Homme"),
                                            value: 2,
                                          ),
                                          DropdownMenuItem(
                                            child: Text("Femme"),
                                            value: 3,
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
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 70,
                      child: Column(
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Date arrivée "),
                          ),
                          Expanded(
                            flex: 1,
                            child: TextField(
                              controller: __datearrive,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    //
                                    showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2023),
                                      lastDate: DateTime(2030),
                                    ).then((d) {
                                      //yyyy-MM-dd
                                      int t = d!.day;
                                      String dd = t < 9 ? "0$t" : "$t";
                                      //-$dd
                                      _datearrive =
                                          "${d.year}-${d.month}-${d.day}";
                                      __datearrive.text = _datearrive;
                                      //setState(() {});
                                    });
                                  },
                                  icon: Icon(Icons.calendar_month),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      // child: Column(
                      //   children: [
                      //     Row(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //         // Expanded(
                      //         //   flex: 4,
                      //         //   child: Column(
                      //         //     children: [
                      //         //       Align(
                      //         //         alignment: Alignment.centerLeft,
                      //         //         child: Text("Date arrivée 1"),
                      //         //       ),
                      //         //       Expanded(
                      //         //         flex: 1,
                      //         //         child: TextField(
                      //         //           controller: __datedepart,
                      //         //           decoration: InputDecoration(
                      //         //             suffixIcon: IconButton(
                      //         //               onPressed: () {
                      //         //                 //
                      //         //                 showDatePicker(
                      //         //                   context: context,
                      //         //                   initialDate: DateTime.now(),
                      //         //                   firstDate: DateTime(2023),
                      //         //                   lastDate: DateTime(2030),
                      //         //                 ).then((d) {
                      //         //                   //yyyy-MM-dd
                      //         //                   int t = d!.day;
                      //         //                   String dd =
                      //         //                       t < 9 ? "0$t" : "$t";
                      //         //                   _datedepart =
                      //         //                       "${d.year}-${d.month}-${d.day}-$dd";
                      //         //                   __datedepart.text =
                      //         //                       _datedepart;
                      //         //                   //setState(() {});
                      //         //                 });
                      //         //               },
                      //         //               icon: Icon(Icons.calendar_month),
                      //         //             ),
                      //         //             border: OutlineInputBorder(
                      //         //               borderRadius:
                      //         //                   BorderRadius.circular(10),
                      //         //               borderSide: const BorderSide(
                      //         //                 color: Colors.grey,
                      //         //               ),
                      //         //             ),
                      //         //           ),
                      //         //         ),
                      //         //       ),
                      //         //     ],
                      //         //   ),
                      //         // ),
                      //         // const SizedBox(
                      //         //   width: 10,
                      //         // ),
                      //         Column(
                      //             children: [
                      //               Align(
                      //                 alignment: Alignment.centerLeft,
                      //                 child: Text("Date arrivée "),
                      //               ),
                      //               Expanded(
                      //                 flex: 1,
                      //                 child: TextField(
                      //                   controller: __datearrive,
                      //                   decoration: InputDecoration(
                      //                     suffixIcon: IconButton(
                      //                       onPressed: () {
                      //                         //
                      //                         showDatePicker(
                      //                           context: context,
                      //                           initialDate: DateTime.now(),
                      //                           firstDate: DateTime(2023),
                      //                           lastDate: DateTime(2030),
                      //                         ).then((d) {
                      //                           //yyyy-MM-dd
                      //                           int t = d!.day;
                      //                           String dd =
                      //                               t < 9 ? "0$t" : "$t";
                      //                           _datearrive =
                      //                               "${d.year}-${d.month}-${d.day}-$dd";
                      //                           __datearrive.text = _datearrive;
                      //                           //setState(() {});
                      //                         });
                      //                       },
                      //                       icon: Icon(Icons.calendar_month),
                      //                     ),
                      //                     border: OutlineInputBorder(
                      //                       borderRadius:
                      //                           BorderRadius.circular(10),
                      //                       borderSide: const BorderSide(
                      //                         color: Colors.grey,
                      //                       ),
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ),
                      //             ],
                      //           ),

                      //       ],
                      //     ),
                      //   ],
                      // ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 70,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Pays d'origine"),
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
                                    icon: Icon(
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
                                          DropdownMenuItem(
                                            child: Text("Admin"),
                                            value: 1,
                                          ),
                                          DropdownMenuItem(
                                            child: Text("Agent"),
                                            value: 2,
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
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 70,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Pays visité"),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 8,
                                child: Padding(
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
                                        future: agentController.getPays(),
                                        builder: (c, t) {
                                          if (t.hasData) {
                                            //
                                            List ll = t.data as List;
                                            paysVisites = ll.obs;
                                            Map e = {};
                                            // ll.forEach((element) {
                                            //   if (element['id'] == agence.value) {
                                            //     e = element;
                                            //   }
                                            // });
                                            //print("la liste de trucs2: $l");

                                            //
                                            return Obx(
                                              () => DropdownButtonHideUnderline(
                                                child: DropdownButton<int>(
                                                  isExpanded: true,
                                                  onChanged: (c) {
                                                    //
                                                    paysVisite.value = c as int;
                                                  },
                                                  value: paysVisite.value,
                                                  items: List.generate(
                                                      paysVisites.length,
                                                      (index) {
                                                    String pays =
                                                        paysVisites[index];
                                                    return DropdownMenuItem(
                                                      value: index,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10),
                                                        child: Text.rich(
                                                          TextSpan(
                                                            text: pays,
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
                              ),
                              Expanded(
                                flex: 2,
                                child: Obx(
                                  () => Checkbox(
                                    onChanged: (t) {
                                      paysVisiteBool.value = t!;
                                    },
                                    value: paysVisiteBool.value,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 70,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Compagnie Aerienne"),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 8,
                                child: Padding(
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
                                        future: agentController.getPays(),
                                        builder: (c, t) {
                                          if (t.hasData) {
                                            //
                                            List ll = t.data as List;
                                            companies = ll.obs;
                                            Map e = {};
                                            // ll.forEach((element) {
                                            //   if (element['id'] == agence.value) {
                                            //     e = element;
                                            //   }
                                            // });
                                            //print("la liste de trucs2: $l");

                                            //
                                            return Obx(
                                              () => DropdownButtonHideUnderline(
                                                child: DropdownButton<int>(
                                                  isExpanded: true,
                                                  onChanged: (c) {
                                                    //
                                                    companie.value = c as int;
                                                  },
                                                  value: companie.value,
                                                  items: List.generate(
                                                      companies.length,
                                                      (index) {
                                                    String compa =
                                                        companies[index];
                                                    return DropdownMenuItem(
                                                      value: index,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10),
                                                        child: Text.rich(
                                                          TextSpan(
                                                            text: compa,
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
                              ),
                              Expanded(
                                flex: 2,
                                child: Obx(
                                  () => Checkbox(
                                    onChanged: (t) {
                                      companieBool.value = t!;
                                    },
                                    value: companieBool.value,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //Divider(),
                    SizedBox(
                      height: 70,
                      child: Column(
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Numéro du passe-port"),
                          ),
                          Expanded(
                            flex: 1,
                            child: TextField(
                              controller: __num_passeport,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.numbers),
                                hintText: "Exemple: TFITYGNYI7",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 70,
                      child: Column(
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Numéro de vol"),
                          ),
                          Expanded(
                            flex: 1,
                            child: TextField(
                              controller: __datedepart,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.numbers),
                                hintText: "Exemple: D56GH78TO",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Map r = {
                    "noms": __noms.text,
                    "sexe": ["", "M", "F"][c.value - 1],
                    "date_arrivee": _datearrive,
                    "pays_visite": paysVisiteBool.value
                        ? paysVisites[paysVisite.value]
                        : "",
                    "compagnie":
                        companieBool.value ? companies[companie.value] : "",
                    "num_passeport": __num_passeport.text,
                    "num_vol": __num_vol.text,
                  };
                  /**
                   * eq += "noms=${e['']}&";
    } else if (e["sexe"] != null) {
      req += "sexe=${e['sexe']}&";
    } else if (e["data_arrivee"] != null) {
      req += "data_arrivee=${e['data_arrivee']}&";
    } else if (e["pays_visite"] != null) {
      req += "pays_visite=${e['pays_visite']}&";
    } else if (e["compagnie"] != null) {
      req += "compagnie=${e['compagnie']}&";
    } else if (e["num_passeport"] != null) {
      req += "num_passeport=${e['num_passeport']}&";
    } else if (e["num_vol"] != null) {
                   */
                  //
                  Get.back();
                  //
                  controller.recherche(r);
                },
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(
                    const Size(
                      double.maxFinite,
                      45,
                    ),
                  ),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.red.shade900),
                ),
                child: Container(
                  alignment: Alignment.center,
                  width: double.maxFinite,
                  child: Text("Rechercher"),
                ),
              )
            ],
          ),
        ),
      ),
      body: Material(
        //flex: 1,
        child: controller.obx(
          (state) {
            //
            List l = state!;
            //
            return DataTable2(
              columnSpacing: 12,
              horizontalMargin: 12,
              minWidth: 600,
              columns: const [
                DataColumn2(
                  label: Text('NOM'),
                  size: ColumnSize.L,
                ),
                DataColumn(
                  label: Text('POST-NOM'),
                ),
                DataColumn(
                  label: Text('PRENOM'),
                ),
                DataColumn(
                  label: Text('SEXE'),
                ),
                DataColumn(
                  label: Text('TELEPHONE'),
                ),
                DataColumn(
                  label: Text('EMAIL'),
                ),
                DataColumn(
                  label: Text('NATIONALITE'),
                  numeric: true,
                ),
              ],
              rows: List<DataRow>.generate(
                l.length,
                (index) {
                  Map e = l[index];
                  return DataRow(
                    cells: [
                      DataCell(
                        Text('${e['nom']}'),
                        onTap: () => Get.to(Details(e)),
                      ),
                      DataCell(
                        Text('${e['postnom']}'),
                        onTap: () => Get.to(Details(e)),
                      ),
                      DataCell(
                        Text('${e['prenom']}'),
                        onTap: () => Get.to(Details(e)),
                      ),
                      DataCell(
                        Text('${e['sexe']}'),
                        onTap: () => Get.to(Details(e)),
                      ),
                      DataCell(
                        Text('${e['telephone']}'),
                        onTap: () => Get.to(Details(e)),
                      ),
                      DataCell(
                        Text('${e['email']}'),
                        onTap: () => Get.to(Details(e)),
                      ),
                      DataCell(
                        Text('${e['nationalite']}'),
                        onTap: () => Get.to(Details(e)),
                      ),
                    ],
                  );
                },
              ),
            );
          },
          onEmpty: Container(),
          onLoading: Center(
            child: SizedBox(
              height: 40,
              width: 40,
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      ),
    );
  }
}
