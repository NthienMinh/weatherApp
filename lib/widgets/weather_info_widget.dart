import 'package:flutter/material.dart';
import 'package:weather/configs/color_configs.dart';
import 'package:weather/resources/texts/texts.dart';
import 'package:weather/utils/resizable_utils.dart';

class WeatherInfoRow extends StatelessWidget {
  final String day;
  final String temperature;

  const WeatherInfoRow({
    super.key,
    required this.day,
    required this.temperature,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConfigs.whiteColor,
      height: Resizable.size(context, 80),
      child: Column(
        children: [
          Expanded(
              child: Row(
                children: [
                  Expanded(child: Text(day)),
                  Text("${temperature} ${Texts.weatherInfo.celsius}"),
                ],
              )),
          Container(
            height: 0.2,
            color: ColorConfigs.buttonBgColor,
          )
        ],
      ),
    );
  }
}