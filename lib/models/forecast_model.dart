class ForecastModel {
  final String day;
  final double temp;

  ForecastModel({required this.day, required this.temp});

  Map<String, dynamic> toJson() =>
      {'day': day, 'temp': temp};
}

class FutureTempModel{
  final String location;
  final List info;
  FutureTempModel({required this.location, required this.info});

  factory FutureTempModel.fromJson(Map<String, dynamic> json) {
    return FutureTempModel(
      location: json['city']['name'] ?? "...",
      info: json['list'] ?? [],
    );
  }
}




