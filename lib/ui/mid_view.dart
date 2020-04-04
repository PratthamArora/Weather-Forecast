import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weatherme/model/weather_model.dart';
import 'package:weatherme/utils/Utility.dart';
import 'package:weatherme/utils/convertIcon.dart';

Widget midView(AsyncSnapshot<WeatherModel> snapshot) {
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: getWeatherIcon(
                weatherDescription: snapshot.data.weather[0].description,
                color: Colors.pinkAccent.shade100,
                size: 150.0),
          ),
//          Icon(
//            FontAwesomeIcons.cloud,
//            size: 150.0,
//            color: Colors.pinkAccent.shade100,
//          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '${snapshot.data.main.temp.toStringAsFixed(0)}°C',
                  style: TextStyle(
                    fontSize: 34.0,
                  ),
                ),
                SizedBox(
                  width: 8.0,
                ),
                Text('${snapshot.data.weather[0].description.toUpperCase()}'),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                          '${snapshot.data.wind.speed.toStringAsFixed(1)} Km/h'),
                      Icon(
                        FontAwesomeIcons.wind,
                        size: 20.0,
                        color: Colors.brown,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                          '${snapshot.data.main.humidity.toStringAsFixed(0)} %'),
                      Icon(
                        FontAwesomeIcons.solidGrinBeamSweat,
                        size: 20.0,
                        color: Colors.brown,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                          '${snapshot.data.main.tempMax.toStringAsFixed(1)}°C'),
                      Icon(
                        FontAwesomeIcons.temperatureHigh,
                        size: 20.0,
                        color: Colors.brown,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
  return midView;
}
