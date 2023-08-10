import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sursa_admin/utils/app_controller.dart';
import 'accueil.dart';
import 'agents/agent_controller.dart';
import 'login/login.dart';
import 'login/login_controller.dart';

class Splash extends StatelessWidget {
  //
  Splash() {
    var box = GetStorage();
    //Map agent = box.read("agent") ?? {};
    Timer(const Duration(seconds: 3), () {
      Get.off(Login());
    });
  }
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/img-1.jpeg",
          width: 200,
          height: 200,
        ),
      ),
      bottomNavigationBar: Container(
        height: 40,
        alignment: Alignment.center,
        child: const Text(
          "Republique Démocratique du Congo",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
