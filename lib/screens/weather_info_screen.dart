import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/features/main/bloc/weather_info_cubit.dart';
import 'package:weather/features/main/mobile/error_view.dart';
import 'package:weather/features/main/mobile/loading_view.dart';
import 'package:weather/features/main/mobile/weather_info_view.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherInfoCubit(),
      child: BlocBuilder<WeatherInfoCubit, int>(builder: (c, s) {
        var mainCubit = BlocProvider.of<WeatherInfoCubit>(c);

        if (mainCubit.mainState == WeatherInfoLoadingState.loading) return LoadingView();

        if (mainCubit.mainState == WeatherInfoLoadingState.error) return ErrorView();

        return WeatherInfoView();
      }),
    );
  }
}
