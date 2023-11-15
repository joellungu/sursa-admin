import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sursa_admin/pages/accueil.dart';
import 'package:sursa_admin/pages/extraction/extraction_controller.dart';
import 'package:sursa_admin/pages/splash.dart';
import 'package:window_manager/window_manager.dart';

import 'pages/agents/agent_controller.dart';
import 'pages/agents/details_agent.dart';
import 'pages/login/login_controller.dart';
import 'pages/recherche/recherche_controller.dart';
import 'utils/app_controller.dart';

void main() async {
  //
  //
  WidgetsFlutterBinding.ensureInitialized();
  // Must add this line.
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
    size: Size(1200, 800),
    center: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.normal,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
  //
  //
  LoginController loginController = Get.put(LoginController());
  AgentController agentController = Get.put(AgentController());
  AppController appController = Get.put(AppController());
  ExtractionController extractionController = Get.put(ExtractionController());
  RechercheController rechercheController = Get.put(RechercheController());
  //
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'SURSA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home:
          //DetailsAgent({}),
          //    Accueil(),
          Splash(),
    );
  }
}


/**
 *   child: DataTable(
              columns: const <DataColumn>[
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Name',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Age',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Role',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Name',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Age',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Role',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Name',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Age',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Role',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
              ],
              rows: const <DataRow>[
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Sarah')),
                    DataCell(Text('19')),
                    DataCell(Text('Student')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Janine')),
                    DataCell(Text('43')),
                    DataCell(Text('Professor')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('William')),
                    DataCell(Text('27')),
                    DataCell(Text('Associate Professor')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Sarah')),
                    DataCell(Text('19')),
                    DataCell(Text('Student')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Janine')),
                    DataCell(Text('43')),
                    DataCell(Text('Professor')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('William')),
                    DataCell(Text('27')),
                    DataCell(Text('Associate Professor')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Sarah')),
                    DataCell(Text('19')),
                    DataCell(Text('Student')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Janine')),
                    DataCell(Text('43')),
                    DataCell(Text('Professor')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('William')),
                    DataCell(Text('27')),
                    DataCell(Text('Associate Professor')),
                  ],
                ),
              ],
            ),
          
 */