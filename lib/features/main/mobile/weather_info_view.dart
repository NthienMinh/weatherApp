import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/configs/color_configs.dart';
import 'package:weather/configs/text_style_configs.dart';
import 'package:weather/features/main/bloc/weather_info_cubit.dart';
import 'package:weather/resources/texts/texts.dart';
import 'package:weather/utils/resizable_utils.dart';
import 'package:weather/widgets/weather_info_widget.dart';

class WeatherInfoView extends StatelessWidget {
  const WeatherInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    var weatherInfoCubit = BlocProvider.of<WeatherInfoCubit>(context);
    return Scaffold(
        backgroundColor: ColorConfigs.bgColor,
        body: AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.easeInOut,
          child: Column(
            children: [
              SizedBox(height: Resizable.size(context, 56)),
              Text("${weatherInfoCubit.currentWeather!.temp} ${Texts.weatherInfo.celsius}",
                  style: TextStyleConfigs.bigBoldBlackTextStyle(context)),
              Text(weatherInfoCubit.currentWeather!.location,
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
                              ...weatherInfoCubit.listForecast.map((e) => WeatherInfoRow(
                                    day: e.day,
                                    temperature: e.temp.toString(),
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
