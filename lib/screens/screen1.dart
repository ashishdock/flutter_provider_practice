import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/Provider/patients_tab.dart';
import 'package:provider_practice/screens/screen2.dart';

class Screen1 extends StatelessWidget {
  const Screen1({Key? key}) : super(key: key);

  // final String url;
  static var routeName = '/screen1';

  @override
  Widget build(BuildContext context) {
    print("Screen1 built");
    // fetchPatientList();
    print('${context.watch<PatientsTab>().patientList}');

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(
            '${context.watch<PatientsTab>().patientList[0].name}',
            key: const Key('PatientinScreen1'),
          ),
          ElevatedButton(
            onPressed: () {
              print("Navigated to screen2");
              Navigator.pushNamed(context, Screen2.routeName);
            },
            child: Text("To Screen2"),
          ),
        ],
      ),
    );
  }
}

// Show details of the last selected patient here.