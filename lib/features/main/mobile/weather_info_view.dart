import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:weather/configs/color_configs.dart';
import 'package:weather/configs/text_style_configs.dart';
import 'package:weather/resources/texts/texts.dart';
import 'package:weather/utils/resizable_utils.dart';
import 'package:weather/widgets/weather_info_widget.dart';

class WeatherInfoView extends StatelessWidget {
  const WeatherInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> forecast = [
      {"day": "Tuesday", "temp": "24°C"},
      {"day": "Wednesday", "temp": "21°C"},
      {"day": "Thursday", "temp": "28°C"},
      {"day": "Friday", "temp": "26°C"},
    ];
    return Scaffold(
        backgroundColor: ColorConfigs.bgColor,
        body: AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.easeInOut,
          child: Column(
            children: [
              SizedBox(height: Resizable.size(context, 56)),
              Text("20 ${Texts.weatherInfo.celsius}",
                  style: TextStyleConfigs.bigBoldBlackTextStyle(context)),
              Text("Bangalore",
                  style: TextStyleConfigs.normalBlueTextStyle(context)),
              SizedBox(height: Resizable.size(context, 65)),
              Expanded(
                  child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: Resizable.padding(context, 16)),
                          decoration: BoxDecoration(
                            color: ColorConfigs.whiteColor,
                            boxShadow: [
                              BoxShadow(
                                color: ColorConfigs.blackColor,
                                blurRadius: 5,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: Resizable.size(context, 16)),
                              ...forecast.map((e) => WeatherInfoRow(
                                    day: e['day'] ?? "",
                                    temperature: e['temp'] ?? "",
                                  ))
                            ],
                          ))
                      .animate()
                      .fadeIn(duration: 500.ms)
                      .slideY(
                          begin: 0.3, curve: Curves.easeOut, duration: 500.ms)),
            ],
          ),
        ));
  }
}
