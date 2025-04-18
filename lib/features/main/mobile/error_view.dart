import 'package:flutter/material.dart';
import 'package:weather/configs/color_configs.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConfigs.errorBgColor,
      body: Container(),
    );
  }
}
