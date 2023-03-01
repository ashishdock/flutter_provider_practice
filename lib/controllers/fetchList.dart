import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:provider_practice/Provider/patient_search_list.dart';

Future<List<PatientIndividual>> fetchPatientList(String url) async {
  var response = await http.get(Uri.parse(url));
  // print(
  //     "********************************RAW RESPONSE BODY****************************");
  // print(response.body.runtimeType);
  // Before any decoding, the response.body is a pure string, not json. not object, just a String ofeten called JSON String, but a string nonetheless.

  // var result = jsonDecode(response.body);
  // print(result.runtimeType);
  // After decoding the String is converted to a List<dynamic>

  if (response.statusCode == 200) {
    // var decodedRes = jsonDecode(response.body);
    // var result = PatientIndividual.fromJsonList(jsonDecode(response.body));
    // print(
    //     "****************Result from fetchList************************************");
    // print(result);
    return PatientIndividual.fromJsonList(jsonDecode(response.body));
  } else {
    throw Exception("Unable to retreive data with the given parameters.");
  }
}
