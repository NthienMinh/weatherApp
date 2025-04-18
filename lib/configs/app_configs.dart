class AppConfigs {

  static String apiKey = '8be41624f0cbd9c1c635b4a9246be978';

  static String currentLocationTemp(String lat, String lon){
    return "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric";
  }

  static String fourDaysTemp(String lat, String lon){
    return "https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&appid=$apiKey&units=metric";
  }
}
