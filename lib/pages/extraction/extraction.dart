import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'extraction_controller.dart';

class Extraction extends GetView<ExtractionController> {
  RxString dateDepart = "".obs;
  RxString dateArrive = "".obs;
  RxString reponse = "".obs;

  Extraction() {
    controller.loader();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 70,
          color: Colors.red.shade100.withOpacity(0.4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 4,
                child: Obx(
                  () => ListTile(
                    onTap: () {
                      //
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2023),
                        lastDate: DateTime(2100),
                      ).then((d) {
                        dateDepart.value = "${d!.year}-${d.month}-${d.day}";
                      });
                    },
                    leading: const Icon(Icons.calendar_month),
                    title: const Text("Date de départ"),
                    subtitle: Text(
                      "$dateDepart",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Obx(
                  () => ListTile(
                    onTap: () {
                      //
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2023),
                        lastDate: DateTime(2100),
                      ).then((d) {
                        dateArrive.value = "${d!.year}-${d.month}-${d.day}";
                      });
                    },
                    leading: const Icon(Icons.calendar_month),
                    title: const Text("Date de départ"),
                    subtitle: Text(
                      "$dateArrive",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  onPressed: () async {
                    //

                    //reponse.value = await
                    final Directory appDocumentsDir =
                        await getApplicationDocumentsDirectory();

                    //
                    print("le rep: ${appDocumentsDir.path}");
                    //
                    bool dirDownloadExists = true;
                    var directory;
                    if (Platform.isIOS) {
                      directory = await getDownloadsDirectory();
                    } else {
                      directory = "/storage/emulated/0/Download/";

                      dirDownloadExists = await Directory(directory).exists();
                      if (dirDownloadExists) {
                        directory = "/storage/emulated/0/Download/";
                      } else {
                        directory = "/storage/emulated/0/Downloads/";
                      }
                    }
                    //
                    controller.downloadFile(
                      "",
                      "Rapport du ${dateDepart.value} au ${dateArrive.value}.xls",
                      directory,
                      dateDepart.value,
                      dateArrive.value,
                    );
                  },
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(
                      Size(
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
                    child: const Text("Télécharger"),
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: controller.obx(
            (state) {
              //
              String reponse = state!;
              //
              return Center(
                child: Card(
                  child: SizedBox(
                    height: 100,
                    width: 250,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text("Cool $reponse"),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
            onEmpty: Container(),
            onLoading: const Center(
              child: SizedBox(
                height: 40,
                width: 40,
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
