import 'package:flutter/material.dart';
import 'package:weatherme/model/weather_model.dart';
import 'package:weatherme/network/network.dart';
import 'package:weatherme/ui/mid_view.dart';

class WeatherForecast extends StatefulWidget {
  @override
  _WeatherForecastState createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  Future<WeatherModel> forecast;
  String _cityName = "New Delhi";

  @override
  void initState() {
    super.initState();
    forecast = getWeather(cityName: _cityName);
//    forecast.then((weather) => {print(weather.main.feelsLike)});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          textFieldView(),
          Container(
            child: FutureBuilder<WeatherModel>(
              future: forecast,
              builder:
                  (BuildContext context, AsyncSnapshot<WeatherModel> snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: <Widget>[
                      midView(snapshot),
                    ],
                  );
                } else {
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget textFieldView() {
    return SafeArea(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Enter city name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              contentPadding: EdgeInsets.all(8.0),
            ),
            onSubmitted: (value) {
              setState(() {
                _cityName = value;
                forecast = getWeather(cityName: _cityName);
              });
            },
          ),
        ),
      ),
    );
  }

  Future<WeatherModel> getWeather({String cityName}) =>
      Network().getWeatherForecast(cityName: _cityName);
}
