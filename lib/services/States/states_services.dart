import 'dart:convert';
import 'package:covid_app/services/utilities/app_url.dart';
import 'package:http/http.dart' as http;
import 'package:covid_app/models/world_states.dart';

class StatesServices {
  Future<WorldStatesModel> fetchWorldStatesRecords() async {
    var response = await http.get(Uri.parse(AppUrl.worldStatesUrl));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return WorldStatesModel.fromJson(data);
    } else {
      throw Exception("Error");
    }
  }

  Future<dynamic> countriesListApi() async {
    var response = await http.get(Uri.parse(AppUrl.countriesList));
    if (response.statusCode == 200) {
      var data1 = jsonDecode(response.body);
      return data1;
    } else {
      throw Exception("Error");
    }
  }
}
