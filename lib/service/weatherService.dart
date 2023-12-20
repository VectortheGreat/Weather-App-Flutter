import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weathers.dart';

class WeatherService {
  static get apiKey => null;

  Future<String?> getApiKey() async {
    await dotenv.load();
    return dotenv.env['API_KEY'];
  }

  final String url =
      "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/London,UK?key=";

  // Future getWeather() async {
  //   try {
  //     String? apiKey = await getApiKey();
  //     if (apiKey == null) {
  //       print("API key not found.");
  //       return [];
  //     }
  //     final response = await http.get(Uri.parse('$url$apiKey'));
  //     Map<String, dynamic> resp = jsonDecode(response.body);

  //     print("SONUÇ : ${resp}");
  //   } catch (e) {
  //     print("Error fetching weather: $e");
  //   }
  // }

  // Future<Days> getWeatherDays() async {
  //   try {
  //     String? apiKey = await getApiKey();
  //     if (apiKey == null) {
  //       print("API key not found.");
  //       return Days();
  //     }

  //     final response = await http.get(Uri.parse('$url$apiKey'));
  //     List<dynamic> resp = jsonDecode(response.body)["days"];

  //     print("RESULT: $resp");
  //     // return Days.fromJson(resp as Map<String, dynamic>);
  //     return Days.fromJson(resp as Map<String, dynamic>);
  //   } catch (e) {
  //     print("Error fetching weather: $e");
  //     return Days();
  //   }
  // }
  Future<CurrentConditions> getCurrentConditions() async {
    try {
      String? apiKey = await getApiKey();
      if (apiKey == null) {
        print("API key not found.");
        return CurrentConditions();
      }

      final response = await http.get(Uri.parse('$url$apiKey'));
      Map<String, dynamic> resp =
          jsonDecode(response.body)["currentConditions"];
      //TODO : Burada hata var
      // print("SONUÇ : ${resp}");
      return CurrentConditions.fromJson(resp);
    } catch (e) {
      print("Error fetching weather: $e");
      return CurrentConditions();
    }
  }
  // Future<Weathers> getWeather() async {
  //   try {
  //     String? apiKey = await getApiKey();
  //     if (apiKey == null) {
  //       print("API key not found.");
  //       return Weathers();
  //     }

  //     final response = await http.get(Uri.parse('$url$apiKey'));
  //     Map<String, dynamic> resp = jsonDecode(response.body);

  //     print(Weathers.fromJson(resp));
  //     return Weathers.fromJson(resp);
  //   } catch (e) {
  //     print("Error fetching weather: $e");
  //     return Weathers();
  //   }
  // }
}
