import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget getWeatherIcon({String weatherDescription, Color color, double size}) {
  switch (weatherDescription) {
    case 'clear sky':
      {
        return Icon(
          FontAwesomeIcons.sun,
          color: color,
          size: size,
        );
      }
      break;
    case 'few clouds':
      {
        return Icon(
          FontAwesomeIcons.cloud,
          color: color,
          size: size,
        );
      }
      break;
    case 'moderate rain':
      {
        return Icon(
          FontAwesomeIcons.cloudRain,
          color: color,
          size: size,
        );
      }
      break;
    case 'snow':
      {
        return Icon(
          FontAwesomeIcons.snowman,
          color: color,
          size: size,
        );
      }
      break;
    case 'haze':
      {
        return Icon(
          FontAwesomeIcons.mixcloud,
          color: color,
          size: size,
        );
      }
      break;
  }
}
