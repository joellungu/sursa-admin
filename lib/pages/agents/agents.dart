import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'agent_controller.dart';
import 'details_agent.dart';

class Agents extends GetView<AgentController> {
  //
  RxInt c = 1.obs;
  RxString noms = "".obs;
  //
  //AgentController agentController = Get.find();
  Agents() {
    var box = GetStorage();
    //
    Map user = box.read("user") ?? {};
    controller.getAllAgents("${user['id_ets']}");
  }
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
            width: 410,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Column(
              children: [
                Container(
                  height: 50,
                  // ignore: sort_child_properties_last
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: TextField(
                          onChanged: (t) {
                            noms.value = t;
                          },
                          decoration: InputDecoration(
                            hintText: "Recherche",
                            icon: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Expanded(
                      //   flex: 4,
                      //   child: DropdownButtonHideUnderline(
                      //     child: DropdownButton<int>(
                      //       items: const [
                      //         //"Chauffeur","Receveur","Embarqueur"
                      //         DropdownMenuItem(
                      //           value: 1,
                      //           child: Text("Super admin"),
                      //         ),
                      //         DropdownMenuItem(
                      //           value: 2,
                      //           child: Text("Admin"),
                      //         ),
                      //         DropdownMenuItem(
                      //           value: 3,
                      //           child: Text("Agent"),
                      //         ),
                      //       ],
                      //       onChanged: (e) {
                      //         c.value = e as int;
                      //         controller.listeAll([
                      //           "Super admin",
                      //           "Admin",
                      //           "Agent",
                      //         ][c.value - 1]);
                      //       },
                      //       value: c.value,
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  flex: 1,
                  child: controller.obx(
                    (state) {
                      List l = state!;
                      //
                      return ListView(
                        padding: const EdgeInsets.all(10),
                        children: List.generate(l.length, (index) {
                          Map e = l[index];
                          print("Map: $e");
                          return Obx(() {
                            if ("${e['nom']}"
                                    .toLowerCase()
                                    .contains(noms.value.toLowerCase()) &&
                                "${e['profil']}" != "Admin") {
                              return ListTile(
                                onTap: () {
                                  //
                                  Get.to(DetailsAgent(e));
                                  //
                                },
                                leading: const Icon(Icons.person),
                                title: Text("${e['nom']}"),
                                subtitle: Text("${e['email']}"),
                              );
                            } else {
                              return Container();
                            }
                          });
                        }),
                      );
                    },
                    onEmpty: Container(),
                    onLoading: const Center(
                      child: SizedBox(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
