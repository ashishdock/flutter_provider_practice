import 'package:flutter/material.dart';

class Screen5 extends StatelessWidget {
  const Screen5({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    // fetchPatientList();

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          // Show all the 12 patients here. If any patient is removed this will be updated automatically.
          ElevatedButton(
            onPressed: () {
              print("Navigated to next screen");
            },
            child: Text("Next Screen"),
          ),
        ],
      ),
    );
  }
}
