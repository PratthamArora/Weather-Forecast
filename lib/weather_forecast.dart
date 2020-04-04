import 'package:flutter/material.dart';
import 'package:weatherme/model/weather_model.dart';
import 'package:weatherme/network/network.dart';

class WeatherForecast extends StatefulWidget {
  @override
  _WeatherForecastState createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  Future<WeatherModel> forecast;
  String _cityName = "Delhi";

  @override
  void initState() {
    super.initState();
    forecast = Network().getWeatherForecast(cityName: _cityName);
    forecast.then((weather) => {print(weather.main.feelsLike)});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Forecast'),
      ),
    );
  }
}
