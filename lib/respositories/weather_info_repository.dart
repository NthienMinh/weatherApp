import 'dart:convert';

import 'package:weather/configs/app_configs.dart';
import 'package:weather/models/api_response.dart';
import 'package:http/http.dart' as http;
import 'package:weather/models/current_weather_model.dart';
import 'package:weather/models/forecast_model.dart';
class WeatherInfoRepository {
  WeatherInfoRepository._private();

  static final WeatherInfoRepository instance = WeatherInfoRepository._private();

  Future<ApiResponse<CurrentWeatherModel>> currentLocationTemp(String lat, String lon) async {
    try {
      var response = await http.get(Uri.parse(AppConfigs.currentLocationTemp(lat, lon)));
      var data = json.decode(response.body);
      if(response.statusCode == 200){
        return Success(data: CurrentWeatherModel.fromJson(data));
      }else{
        return Fail(message: data['message'], code: data['cod']);
      }

    } catch (e) {
      return Error(message: 'Error $e');
    }
  }

  Future<ApiResponse<FutureTempModel>> fourDaysTemp(String lat, String lon) async {
    try {
      var response = await http.get(Uri.parse(AppConfigs.fourDaysTemp(lat, lon)));
      var data = json.decode(response.body);
      if(response.statusCode == 200){
        return Success(data: FutureTempModel.fromJson(data));
      }else{
        return Fail(message: data['message'], code: data['cod']);
      }

    } catch (e) {
      return Error(message: 'Error $e');
    }
  }
}