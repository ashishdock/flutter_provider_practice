import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/Provider/patients_tab.dart';
import 'package:provider_practice/screens/screen3.dart';

class Screen2 extends StatelessWidget {
  const Screen2({Key? key}) : super(key: key);

  static var routeName = '/screen2';

  // final String url;

  @override
  Widget build(BuildContext context) {
    print("Screen2 built");
    // fetchPatientList();

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              print("To Screen3");
              Navigator.pushNamed(context, Screen3.routeName);
            },
            child: Text("To Screen3"),
          ),
          ElevatedButton(
            onPressed: () {
              // print("Navigated to next screen");
              // context.watch<PatientsTab>().deletePatient(name);
            },
            child: Text("Delete Patient from 12 patient array"),
          ),
        ],
      ),
    );
  }
}
