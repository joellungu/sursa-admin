import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'agents/agent.dart';
import 'extraction/extraction.dart';
import 'recherche/recherche.dart';

class Accueil extends StatelessWidget {
  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
  Rx<Widget> vue = Rx(
    Center(
      child: Image.asset(
        "assets/img-1.jpeg",
        fit: BoxFit.cover,
      ),
    ),
  );
  Accueil() {
    //
    vue.value = Center(
      child: Image.asset(
        "assets/img-1.jpeg",
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        toolbarHeight: 20,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.red.shade900,
        title: const Text(
          "Système de gestion de surveillance sanitaire des voyageurs internationaux entrants en RDC",
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: Drawer(
        elevation: 0,
        child: ListView(
          padding: const EdgeInsets.all(5),
          children: [
            DrawerHeader(
              margin: const EdgeInsets.all(0),
              padding: const EdgeInsets.all(0),
              child: Image.asset(
                "assets/img-2.jpeg",
                fit: BoxFit.cover,
              ),
            ),
            ListTile(
              onTap: () {
                Get.back();
                vue.value = Agent();
              },
              leading: Icon(
                Icons.person,
                color: Colors.red.shade900,
                size: 20,
              ),
              title: const Text(
                "Agents",
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 15,
              ),
            ),
            ListTile(
              onTap: () {
                Get.back();
                Get.to(Recherche());
                //vue.value = Recherche();
              },
              leading: Icon(
                Icons.search,
                color: Colors.red.shade900,
                size: 20,
              ),
              title: const Text(
                "Recherche",
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 15,
              ),
            ),
            ListTile(
              onTap: () {
                Get.back();
                vue.value = Extraction();
              },
              leading: Icon(
                Icons.cloud_download,
                color: Colors.red.shade900,
                size: 20,
              ),
              title: const Text(
                "Extraction des données",
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 15,
              ),
            ),
            ListTile(
              onTap: () {
                Get.back();
                exit(0);
              },
              leading: Icon(
                Icons.exit_to_app_rounded,
                color: Colors.red.shade900,
                size: 20,
              ),
              title: const Text(
                "Quitter",
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 15,
              ),
            ),
          ],
        ),
      ),
      body: Obx(() => vue.value),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          globalKey.currentState!.openDrawer();
        },
        backgroundColor: Colors.red.shade900,
        child: const Icon(Icons.menu),
      ),
    );
  }
}
