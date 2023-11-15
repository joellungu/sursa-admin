import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'agent_controller.dart';

class DetailsAgent extends StatefulWidget {
  Map agent;
  DetailsAgent(this.agent);
  //
  @override
  State<StatefulWidget> createState() {
    return _DetailsAgent();
  }
}

class _DetailsAgent extends State<DetailsAgent> {
  //
  RxInt frontier = RxInt(1);
  //
  List frontiers = [
    {"post": "Aéroport int. De Njili", "province": "Kinshasa"},
    {"post": "Beach Ngobila", "province": "Kinshasa"},
    {"post": "Frontière de Lufu", "province": "Kongo Central"},
    {"post": "Port de Matadi", "province": "Kongo Central"},
    {"post": "Port de Boma", "province": "Kongo Central"},
    {"post": "Port de Banana (muanda)", "province": "Kongo Central"},
    {"post": "Aéroport int. De Luano", "province": "Haut katanga"},
    {"post": "kasumbalesa", "province": "Haut katanga"},
    {"post": "Port de Kalemi", "province": "Tanganyika"},
    {"post": "Maluku de kasongolunda", "province": "kwango"},
    {"post": "dhafudji de kayemba", "province": "kwango"},
    {"post": "Aéroport  De bunia", "province": ""},
    {"post": "mahagi", "province": "Ituri"},
    {"post": "Tchomia", "province": "Ituri"},
    {"post": "Aru", "province": "Ituri"},
    {"post": "Aéro Goma Int", "province": "Nord   kivu"},
    {"post": "Frontière Grande barrière Goma", "province": "Nord   kivu"},
    {"post": "Frontière de Kasindi-Ouganda", "province": "Nord   kivu"},
    {"post": "Frontière Petite barrière Goma", "province": "Nord   kivu"},
    {"post": "Bunagana", "province": "Nord   kivu"},
    {"post": "Kamanyola", "province": "Sud kivu"},
    {"post": "KAVIMVIRA", "province": "Sud kivu"},
    {"post": "Ruzizi 1", "province": "Sud kivu"},
    {"post": "Ruzizi 2", "province": "Sud kivu"},
    {"post": "Aéroport de Bangboka", "province": "Tshopo"},
    {"post": "Tshikapa", "province": "Kasai"},
    {"post": "kamako", "province": "Kasai"},
  ];
  //
  RxString post = "".obs;
  //
  RxList l = [].obs;
  //
  RxBool statut = false.obs;
  //
  AgentController agentController = Get.find();
  //
  @override
  void initState() {
    //
    super.initState();
    //
    frontier = RxInt(int.parse("${widget.agent['id_poste']}"));
    //
    print("agent: ${widget.agent}");
    //
    statut.value = "${widget.agent['statut']}" == "actif";
    print("maj:: ${"${widget.agent['statut']}" == "actif"}");
    //
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details agent"),
        backgroundColor: Colors.red.shade900,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.all(10),
              ),
            ),
            SizedBox(
              width: 10,
              child: Container(
                height: Get.size.height / 1.3,
                width: 2,
                color: Colors.grey.shade100,
              ),
            ),
            Expanded(
              flex: 3,
              child: ListView(
                padding: const EdgeInsets.all(10),
                children: [
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text("Nom d'utilisateur"),
                    subtitle: Text("${widget.agent['pseudo']}"),
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text("Téléphone"),
                    subtitle: Text("${widget.agent['telephone']}"),
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text("Email"),
                    subtitle: Text("${widget.agent['email']}"),
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text("profil"),
                    subtitle: Text("${widget.agent['profil']}"),
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text("Statut"),
                    subtitle: Obx(
                      () => Text(statut.value ? "Actif" : "non actif"),
                    ),
                    trailing: Obx(
                      () => Switch(
                        value: statut.value,
                        onChanged: (e) {
                          //
                          statut.value = e;
                          print(statut.value ? "actif" : "non actif");
                        },
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text("agence"),
                    subtitle: Text("${widget.agent['id_ets']}"),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
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
                                  future: agentController.getPosteFrontalier(),
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
                                              int r = c as int;
                                              //
                                              frontier.value = l[r]['id'];
                                            },
                                            value: frontier.value,
                                            items: List.generate(l.length,
                                                (index) {
                                              Map e = l[index];
                                              return DropdownMenuItem(
                                                value: index,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  child: Text.rich(
                                                    TextSpan(
                                                      text: "${e['lib']}\n",
                                                      style: const TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                      children: [
                                                        TextSpan(
                                                          text:
                                                              "Province: ${e['province']}",
                                                          style: const TextStyle(
                                                              fontSize: 13,
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
                                      child: const CircularProgressIndicator(),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text("post_frontalier"),
                    subtitle: Text("${widget.agent['id_poste']}"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      //
                      print("==== ::: ${frontier.value}");
                      //
                      Map u = {
                        "id": widget.agent['id'],
                        "pseudo": "${widget.agent['pseudo']}",
                        "telephone": "${widget.agent['telephone']}",
                        "email": "${widget.agent['email']}",
                        "pwd": "${widget.agent['pwd']}",
                        "profil": "Agent",
                        "statut": statut.value ? "actif" : "non actif",
                        "id_ets": "${widget.agent['id_ets']}",
                        "id_poste": frontier.value,
                      };
                      //
                      Get.dialog(
                        const Center(
                          child: SizedBox(
                            height: 40,
                            width: 40,
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      );
                      //
                      agentController.miseajour(u);
                      //
                    },
                    child: const Text("Mettre à jour"),
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
                  )
                ],
              ),
            ),
            SizedBox(
              width: 10,
              child: Container(
                height: Get.size.height / 1.3,
                width: 2,
                color: Colors.grey.shade100,
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.all(10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
