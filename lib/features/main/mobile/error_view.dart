import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/configs/color_configs.dart';
import 'package:weather/configs/text_style_configs.dart';
import 'package:weather/features/main/bloc/main_cubit.dart';
import 'package:weather/resources/texts/texts.dart';
import 'package:weather/utils/resizable_utils.dart';
import 'package:weather/widgets/button_widget.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    var mainCubit = BlocProvider.of<MainCubit>(context);
    return Scaffold(
        backgroundColor: ColorConfigs.errorBgColor,
        body: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Resizable.padding(context, 40)),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(Texts.main.errorText,
                      textAlign: TextAlign.justify,
                      style: TextStyleConfigs.errorTextStyle(context)),
                  SizedBox(height: Resizable.size(context, 44)),
                  ButtonWidget(onPressed: () {
                    mainCubit.reload();
                  })
                ])));
  }
}
