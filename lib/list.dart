import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider_practice/Provider/patient_search_list.dart';
import './controllers/fetchList.dart';
import 'Provider/patient_individual.dart';

class PatientList extends StatelessWidget {
  const PatientList({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            FutureBuilder(
              future: fetchPatientList(url),
              builder:
                  (context, AsyncSnapshot<List<PatientIndividual>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                } else if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Text(snapshot.data![index].name);
                    },
                  );
                } else {
                  return const Text("No data to show");
                }
              },
            ),
            SizedBox(
              height: 19,
            ),
            TextButton.icon(
              onPressed: () {
                print("Added to 12 patients");
              },
              icon: Icon(Icons.graphic_eq_rounded),
              label: Text(
                "Add to 12 Pt array",
              ),
            ),
            TextButton.icon(
              onPressed: () {
                print("Added to 12 patients");
              },
              icon: Icon(Icons.graphic_eq_rounded),
              label: Text(
                "Remove from 12 Pt array",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                print("Navigated to next screen");
              },
              child: Text("Next Screen"),
            ),
          ],
        ),
      ),
    );
  }
}
