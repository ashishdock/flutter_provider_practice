import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/Provider/patients_tab.dart';
// import 'package:provider_practice/screens/screen3.dart';

class Screen7 extends StatefulWidget {
  const Screen7({Key? key}) : super(key: key);

  static var routeName = '/screen2';

  @override
  State<Screen7> createState() => _Screen7State();
}

class _Screen7State extends State<Screen7> {
  TextEditingController textfieldcontroller = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    textfieldcontroller.dispose();
  }

  // final String url;
  @override
  Widget build(BuildContext context) {
    print("Screen2 built");
    // fetchPatientList();

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            controller: textfieldcontroller,
          ),
          ElevatedButton(
            onPressed: () {
              print("To Screen3");
              // Navigator.pushNamed(context, Screen3.routeName);
            },
            child: Text("To Screen3"),
          ),
          ElevatedButton(
            onPressed: () {
              // print("Navigated to next screen");
              context
                  .read<PatientsTab>()
                  .deletePatient(textfieldcontroller.text);
            },
            child: Text("Delete Patient from 12 patient array"),
          ),
        ],
      ),
    );
  }
}
