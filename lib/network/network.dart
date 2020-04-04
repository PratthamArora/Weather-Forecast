import 'dart:convert';

import 'package:http/http.dart';
import 'package:weatherme/model/weather_model.dart';
import 'package:weatherme/utils/Utility.dart';

class Network {
  Future<WeatherModel> getWeatherForecast({String cityName}) async {
    var baseUrl = "http://api.openweathermap.org/data/2.5/weather?q=" +
        cityName +
        "&APPID=" +
        Utils.appId +
        "&&units=metric";
    final response = await get(Uri.encodeFull(baseUrl));
    print("URL: ${Uri.encodeFull(baseUrl)}");

    if (response.statusCode == 200) {
      print("WeatherData: ${response.body}");
      return WeatherModel.fromJson(
          jsonDecode(response.body)); //we get the mapped model
    } else {
      throw Exception("Some error has occurred");
    }
  }
}
