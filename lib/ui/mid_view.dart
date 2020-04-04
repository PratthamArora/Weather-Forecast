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
          Text('${Utils.getFormattedDate(
            new DateTime.fromMillisecondsSinceEpoch(snapshot.data.dt * 1000),
          )}'),
        ],
      ),
    ),
  );
  return midView;
}
