import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:statemanagement/domain/covid_model.dart';

class CovidApi {
  Future<CovidReport> getData(String date) async {
    try {
      Map<String, String> headers = {
        'X-RapidAPI-Key': 'f02c7294cbmshdba44773aba5dbap1f7c91jsn0ccc1099845d',
        'X-RapidAPI-Host': 'covid-19-statistics.p.rapidapi.com'
      };

      print('here');
      Uri endpoint =
          Uri.parse('https://covid-19-statistics.p.rapidapi.com/reports/total?date=$date');
           print(endpoint);
      http.Response response = await http.get(endpoint, headers: headers);
        print(response.statusCode);
      if (response.statusCode == 200) {

        print('success');
        CovidReport data = CovidReport.fromJson(jsonDecode(response.body)['data']);
        return data;
        print(data);

        //dynamic Data = jsonDecode(response.body);
        //print(data.active.toInt());

        //  CovidReport users =
        //  CovidReport.from(data.map((e) => CovidReport.fromJson(e)));

        // return users;
      }else{
        return CovidReport();
      }
      //return [];
    } catch (e) {
      throw e;
      // print(e.toString());
      // throw Exception('no');
    }
  }
}
