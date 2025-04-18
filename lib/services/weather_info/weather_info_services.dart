import 'package:weather/services/weather_info/weather_info_read.dart';
import 'package:weather/services/weather_info/weather_info_write.dart';

class WeatherInfoServices {
  WeatherInfoServices._internal();

  static final WeatherInfoRead _read = WeatherInfoRead();
  static final WeatherInfoWrite _write = WeatherInfoWrite();

  static WeatherInfoRead get read => _read;
  static WeatherInfoWrite get write => _write;
}