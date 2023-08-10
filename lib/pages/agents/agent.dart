import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'agents.dart';
import 'formulaire_agent.dart';

class Agent extends StatelessWidget {
  //
  RxBool choix = true.obs;
  RxList<bool> options = [true, false].obs;
  //

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 50,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(5),
          //color: Colors.lightBlue.shade100,
          child: Obx(
            () => ToggleButtons(
              isSelected: options,
              onPressed: (int index) {
                if (index == 0) {
                  choix.value = true;
                  options[0] = true;
                  options[1] = false;
                } else {
                  choix.value = false;
                  options[1] = true;
                  options[0] = false;
                }
                //options[index] = !options[index];
              },
              color: Colors.black,
              //selectedColor: Colors.transparent,
              fillColor: Colors.transparent,
              borderColor: Colors.white,
              borderRadius: BorderRadius.circular(20),
              selectedBorderColor: Colors.red.shade900,
              children: const <Widget>[
                Text("  Nouvel Agent  "),
                Text("  Agents enregistrés  "),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Obx(
            () => choix.value ? FormulaireAgent() : Agents(),
          ),
        )
      ],
    );
  }
}
