import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherme/model/weather_model.dart';
import 'package:weatherme/utils/Utility.dart';

Widget midView(AsyncSnapshot<WeatherModel> snapshot) {
  var forecastList = snapshot.data.main;
  var cityName = snapshot.data.name;
  var countryName = snapshot.data.sys.country;
  Container midView = Container(
    child: Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '$cityName,$countryName',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            '${Utils.getFormattedDate(
              new DateTime.fromMillisecondsSinceEpoch(snapshot.data.dt * 1000),
            )}',
            style: TextStyle(
              fontSize: 14.0,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Icon(
            Icons.wb_sunny,
            size: 150.0,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '${forecastList.temp.toStringAsFixed(0)}°C',
                  style: TextStyle(
                    fontSize: 34.0,
                  ),
                ),
                Text('${snapshot.data.weather[0].description.toUpperCase()}'),
              ],
            ),
          ),
        ],
      ),
    ),
  );
  return midView;
}
