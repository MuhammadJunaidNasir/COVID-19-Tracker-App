import 'dart:convert';
import 'package:covid_19_tracker_app/Services/Utilities/app_url.dart';
import 'package:http/http.dart' as http;
import 'package:covid_19_tracker_app/Model/WorldStatesModel.dart';

class countriesServices {
  Future<List<dynamic>> getcountriesList() async {
    final response = await http.get(Uri.parse(AppUrl.countriesList));
    var data;
    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      return data;
    }
     else{
      
     }
  }
}
