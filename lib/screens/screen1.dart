import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    // fetchPatientList();

    return Scaffold(
      appBar: AppBar(),
      body: ElevatedButton(
        onPressed: () {
          print("Navigated to next screen");
        },
        child: Text("Next Screen"),
      ),
    );
  }
}

// Show details of the last selected patient here.