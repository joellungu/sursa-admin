import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sursa_admin/pages/accueil.dart';
import 'package:sursa_admin/pages/login/mdp_oublier.dart';
import 'package:sursa_admin/utils/app_controller.dart';

import 'login_controller.dart';

class Login extends StatelessWidget {
  //
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final mdp = TextEditingController();

  LoginController loginController = Get.find();
  RxBool masquer = true.obs;

  AppController appController = Get.find();
  //
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red.shade900, // Status bar color
      child: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            toolbarHeight: 20,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.red.shade900,
            title: Text(
              "Système de gestion de surveillance sanitaire des voyageurs internationaux entrants en RDC",
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: Center(
            child: Container(
              width: 400,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/logo_MIN SANTE 2.png",
                        width: 200,
                        height: 200,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      TextFormField(
                        controller: email,
                        validator: (e) {
                          if (e!.isEmpty) {
                            return "Veuilliez inserer email";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 5),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          prefixIcon: Icon(Icons.email),
                          hintText: "Email",
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Obx(
                        () => TextFormField(
                          controller: mdp,
                          obscureText: masquer.value,
                          validator: (e) {
                            if (e!.isEmpty) {
                              return "Veuilliez inserer votre mot de passe";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 5),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            prefixIcon: IconButton(
                              icon: Icon(Icons.lock),
                              onPressed: () {
                                //
                                masquer.value = !masquer.value;
                              },
                            ),
                            hintText: "Mot de passe",
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            //Get.off(Accueil());

                            Get.dialog(Container(
                              height: 40,
                              width: 40,
                              child: const CircularProgressIndicator(),
                              alignment: Alignment.center,
                            ));
                            //
                            Map e = {
                              "email": email.text,
                              "pwd": mdp.text,
                            };
                            appController.login(e);
                            //
                            // Timer(Duration(seconds: 3), () {
                            //   Get.back();
                            //   Get.off(Accueil());
                            // });
                            //loginController.login(numero.text, mdp.text);
                            //loginController.deja.value = true;
                          }
                        },
                        style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(
                            Size(
                              double.maxFinite,
                              45,
                            ),
                          ),
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red.shade900),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          width: double.maxFinite,
                          child: Text("S'authentifier"),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      OutlinedButton(
                        onPressed: () {
                          //
                          Get.to(MdpOublie());
                        },
                        style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(
                            Size(
                              double.maxFinite,
                              45,
                            ),
                          ),
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                          //backgroundColor:
                          //  MaterialStateProperty.all(Colors.red.shade900),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          width: double.maxFinite,
                          child: const Text(
                            "Mot de passe oublié",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  //)
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
