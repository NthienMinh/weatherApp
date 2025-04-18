import 'package:flutter/material.dart';
import 'package:weather/screens/main_screen.dart';

class Routes {
  static const main = "/";

  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.main:
        return MaterialPageRoute(builder: (context) => MainScreen());
    }
    return null;
  }
}
