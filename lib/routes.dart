import 'package:flutter/material.dart';
import 'package:weather/screens/weather_info_screen.dart';

class Routes {
  static const weatherInfo = "/";

  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.weatherInfo:
        return MaterialPageRoute(builder: (context) => MainScreen());
    }
    return null;
  }
}
