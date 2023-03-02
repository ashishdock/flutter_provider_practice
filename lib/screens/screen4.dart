import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:provider_practice/Provider/patients_tab.dart';
import 'package:provider_practice/screens/screen5.dart';

class Screen4 extends StatelessWidget {
  const Screen4({Key? key}) : super(key: key);

  static var routeName = '/screen4';

  // final String url;

  @override
  Widget build(BuildContext context) {
    print("Screen4 built");
    // fetchPatientList();
    print('${context.watch<PatientsTab>().patientList}');

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          // Text('${context.watch<PatientsTab>().patientList}'),
          ElevatedButton(
            onPressed: () {
              print("To Screen5");
              Navigator.pushNamed(context, Screen5.routeName);
            },
            child: Text("To Screen5"),
          ),
        ],
      ),
    );
  }
}
