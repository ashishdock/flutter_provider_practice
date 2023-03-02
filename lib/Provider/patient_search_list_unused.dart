import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:io';
import 'patients_tab.dart';

part 'patient_search_list.g_unused.dart';

@JsonSerializable()
class PatientIndividual {
  int id;
  String name;
  String username;
  String email;
  Address address;
  String phone;
  String website;
  Company company;

  PatientIndividual({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  factory PatientIndividual.fromJson(Map<String, dynamic> json) =>
      _$PatientIndividualFromJson(json);

  Map<String, dynamic> toJson() => _$PatientIndividualToJson(this);

  static List<PatientIndividual> fromJsonList(dynamic jsonList) {
    // May be convert the type of this method to future and fetch data in the method
    final patientSearchResults = <PatientIndividual>[];
    if (jsonList == null) return patientSearchResults;
    if (jsonList is List<dynamic>) {
      for (final json in jsonList) {
        patientSearchResults.add(PatientIndividual.fromJson(json));
      }
    }
    //  else {
    //   throw Exception("Error converting the format of received data");
    // }
    // print(
    //     "patientSearchREsults is of type ${patientSearchResults.runtimeType}");
    // print(patientSearchResults);
    // print(
    //     "**************************************************************************************");
    // notify
    return patientSearchResults;
  }

  void addToOpenPtTabs(PatientIndividual pt) {
    PatientsTab().addPatientToOpenTabs(pt);
    // notifyListeners();
  }
}

@JsonSerializable()
class Address {
  String street;
  String suite;
  String city;
  String zipcode;
  Geo geo;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}

@JsonSerializable()
class Geo {
  String lat;
  String lng;

  Geo({
    required this.lat,
    required this.lng,
  });

  factory Geo.fromJson(Map<String, dynamic> json) => _$GeoFromJson(json);

  Map<String, dynamic> toJson() => _$GeoToJson(this);
}

@JsonSerializable()
class Company {
  String name;
  String catchPhrase;
  String bs;

  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}
