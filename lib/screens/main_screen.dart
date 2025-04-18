import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/features/main/bloc/main_cubit.dart';
import 'package:weather/features/main/mobile/error_view.dart';
import 'package:weather/features/main/mobile/loading_view.dart';
import 'package:weather/features/main/mobile/main_view.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit()..loading(),
      child: BlocBuilder<MainCubit, int>(builder: (c, s) {
        var mainCubit = BlocProvider.of<MainCubit>(c);

        if (mainCubit.mainState == MainState.loading) return LoadingView();

        if (mainCubit.mainState == MainState.error) return ErrorView();

        return MainView();
      }),
    );
  }
}
