import 'package:weather/models/api_response.dart';
import 'package:weather/models/current_weather_model.dart';
import 'package:weather/models/forecast_model.dart';
import 'package:weather/respositories/weather_info_repository.dart';

class WeatherInfoRead {
  final WeatherInfoRepository _repository = WeatherInfoRepository.instance;

  Future<CurrentWeatherModel?> getCurrentLocationTemp(String lat, String lon) async {
    final itemsResult = await _repository.currentLocationTemp(lat, lon);
    if (itemsResult is Success) {
      final data = (itemsResult as Success).data;
      return data;
    }
    return null;
  }

  Future<FutureTempModel?> getFourDaysTemp(String lat, String lon) async {
    final itemsResult = await _repository.fourDaysTemp(lat, lon);
    if (itemsResult is Success) {
      final data = (itemsResult as Success).data;
      return data;
    }
    return null;
  }
}