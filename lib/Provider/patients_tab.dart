// patient names will be added here
import 'package:flutter/material.dart';
// import 'package:provider_practice/Provider/patient_search_list.dart';
import '../new_models/new_user_model.dart';

var _openPatientTabs = <UserModel>[];

class PatientsTab with ChangeNotifier {
  void addPatientToOpenTabs(patient) {
    // Do not add if null /""
    _openPatientTabs.add(patient);

    notifyListeners();
  }

  List<UserModel> get patientList => _openPatientTabs.isEmpty
      ? [
          UserModel(
              id: "",
              name: "",
              username: "",
              email: "",
              address: Address(
                  street: "",
                  suite: "",
                  city: "",
                  zipcode: "",
                  geo: Geo(lat: "", lng: "")),
              phone: "",
              website: "",
              company: Company(name: "", catchPhrase: "", bs: ""))
        ]
      : [..._openPatientTabs];

  void deletePatient(String name) {
    print(name);
    _openPatientTabs.removeWhere((element) {
      print(element.name);
      return element.name == name;
    });
    // print(_openPatientTabs.map(
    //   (e) => print(e.name),
    // ));
    notifyListeners();
  }
}

// var _openPatientTabsNew = <Map<String, String>>[];

// class PatientsTabNew with ChangeNotifier {
//   void addPatientToOpenTabs(patient) {
//     // Do not add if null /""
//     _openPatientTabs.add(patient);

//     notifyListeners();
//   }

//   get patientList => [..._openPatientTabs];


// }
