import 'package:flutter/material.dart';

import './new_models/new_user_model.dart';
import 'package:provider_practice/Provider/patients_tab.dart';
import 'package:provider_practice/screens/screen1.dart';
import 'package:provider_practice/controllers/fetchList.dart';

class PatientListArguments {
  PatientListArguments(this.url);

  final String url;
}

class PatientList extends StatefulWidget {
  const PatientList({Key? key}) : super(key: key);

  static var routeName = '/patient-list';

  @override
  State<PatientList> createState() => _PatientListState();
}

class _PatientListState extends State<PatientList> {
  UserModel? _selectedPatient;
  // bool _selectedTile = false;

  // late final StreamController<bool> boolController = StreamController<bool>();

  @override
  Widget build(BuildContext context) {
    print("List Page widget built");
    final args =
        ModalRoute.of(context)!.settings.arguments as PatientListArguments;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            FutureBuilder(
              future: fetchPatientList(args.url),
              builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
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
                      return ListTile(
                        title: Text(snapshot.data![index].name),
                        // selected: boolController.stream.listen((event) {
                        //   print(event);
                        // }),
                        //! TODO: interesting concept to explore and accomplish
                        onTap: () {
                          _selectedPatient = UserModel(
                            id: snapshot.data![index].id,
                            name: snapshot.data![index].name,
                            username: snapshot.data![index].username,
                            email: snapshot.data![index].email,
                            address: snapshot.data![index].address,
                            phone: snapshot.data![index].phone,
                            website: snapshot.data![index].website,
                            company: snapshot.data![index].company,
                          );
                          // boolController.add(!_selectedTile);
                        },
                      );
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
                print(_selectedPatient!.name);
// context.read()<PatientsTab>()..;
                PatientsTab().addPatientToOpenTabs(_selectedPatient!);
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
                print("Navigated to screen1");
                Navigator.pushNamed(context, Screen1.routeName);
              },
              child: Text("Next Screen"),
            ),
          ],
        ),
      ),
    );
  }
}
