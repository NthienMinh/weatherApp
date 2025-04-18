class CurrentWeatherModel {
  final String location;
  final String temp;

  CurrentWeatherModel({required this.location, required this.temp});

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) {
    return CurrentWeatherModel(
        location: json['name'] ?? "...",
        temp: json['main']['temp'].toString(),
    );
  }
}