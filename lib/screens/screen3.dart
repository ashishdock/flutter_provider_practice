import 'package:flutter/material.dart';

import 'package:provider_practice/screens/screen4.dart';

class Screen3 extends StatelessWidget {
  const Screen3({Key? key}) : super(key: key);

  static var routeName = '/screen3';

  // final String url;

  @override
  Widget build(BuildContext context) {
    print("Screen3 built");
    // fetchPatientList();

    return Scaffold(
      appBar: AppBar(),
      body: ElevatedButton(
        onPressed: () {
          print("To Screen4");
          Navigator.pushNamed(context, Screen4.routeName);
        },
        child: Text("To Screen4"),
      ),
    );
  }
}
