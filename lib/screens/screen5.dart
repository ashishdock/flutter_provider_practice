import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:provider_practice/Provider/patients_tab.dart';
import 'package:provider_practice/screens/screen6.dart';

class Screen5 extends StatelessWidget {
  const Screen5({Key? key}) : super(key: key);

  static var routeName = '/screen5';

  // final String url;

  @override
  Widget build(BuildContext context) {
    final ptList = Provider.of<PatientsTab>(context, listen: true).patientList;
    print("Screen5 built");
    // fetchPatientList();
    print(ptList);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: ptList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                // onTap: ,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.circular(
                      9.0,
                    ),
                    // shape: BoxShape.rectangle,
                  ),
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(ptList[index].id.toString()),
                      Text(ptList[index].name),
                      Text(ptList[index].username),
                    ],
                  ),
                ),
              );
            },
          ), // Show all the 12 patients here. If any patient is removed this will be updated automatically.

          ElevatedButton(
            onPressed: () {
              // print("Navigated to next screen");
            },
            child: Text("Delete Patient from 12 patient array"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, Screen6.routeName);
            },
            child: Text("To Patient Tabs"),
          ),
        ],
      ),
    );
  }
}
