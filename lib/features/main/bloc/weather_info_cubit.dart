import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:weather/blocs/base_cubit.dart';
import 'package:weather/models/current_weather_model.dart';
import 'package:weather/models/forecast_model.dart';
import 'package:weather/services/weather_info/weather_info_services.dart';

enum WeatherInfoLoadingState { loading, success, error }

class WeatherInfoCubit extends BaseCubit<int> {
  WeatherInfoCubit() : super(0) {
    firstLoading();
  }

  LocationData? locationData;

  CurrentWeatherModel? currentWeather;

  WeatherInfoLoadingState mainState = WeatherInfoLoadingState.loading;

  FutureTempModel? fourDaysWeather;

  List<ForecastModel> listForecast = [];

  firstLoading() async {
    await getCurrentLocation();

    if (locationData == null) {
      mainState = WeatherInfoLoadingState.error;
    } else {
      currentWeather = await WeatherInfoServices.read.getCurrentLocationTemp(
          locationData!.latitude.toString(),
          locationData!.longitude.toString());
      fourDaysWeather = await WeatherInfoServices.read.getFourDaysTemp(
          locationData!.latitude.toString(),
          locationData!.longitude.toString());
      if (currentWeather == null || fourDaysWeather == null) {
        mainState = WeatherInfoLoadingState.error;
      } else {
        List<ForecastModel> listTemp = fourDaysWeather!.info
            .map((e) => ForecastModel(
                day: getDate(e['dt_txt'].toString()),
                temp: double.parse(e['main']['temp'].toString())))
            .toList();
        listForecast = getDailyAveragesList(listTemp);
        mainState = WeatherInfoLoadingState.success;
      }
    }
    baseEmit(state + 1);
  }

  Future<void> getCurrentLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        debugPrint("Dịch vụ vị trí chưa được bật.");
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        debugPrint("Không có quyền truy cập vị trí.");
        return;
      }
    }
    locationData = await location.getLocation();
  }

  List<ForecastModel> getDailyAveragesList(List<ForecastModel> data) {
    final Map<String, List<double>> groupedTemps = {};

    for (var entry in data) {
      final day = entry.day;
      final temp = entry.temp;

      groupedTemps.putIfAbsent(day, () => []);
      groupedTemps[day]!.add(temp);
    }

    List<ForecastModel> result = [];
    groupedTemps.forEach((day, temps) {
      final avg = temps.reduce((a, b) => a + b) / temps.length;
      result.add(ForecastModel(
          day: day, temp: double.parse(avg.toStringAsFixed(2))));
    });

    return result.sublist(0,4);
  }

  String getDate(String data) {
    DateTime date = DateTime.parse(data);
    return getWeekdayName(date.weekday);
  }

  String getWeekdayName(int weekday) {
    const weekdayNames = {
      1: 'Monday',
      2: 'Tuesday',
      3: 'Wednesday',
      4: 'Thursday',
      5: 'Friday',
      6: 'Saturday',
      7: 'Sunday',
    };
    return weekdayNames[weekday]!;
  }

  reload() async {
    mainState = WeatherInfoLoadingState.loading;
    baseEmit(state + 1);
    firstLoading();
  }
}
