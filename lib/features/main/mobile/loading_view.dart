import 'package:flutter/material.dart';
import 'package:weather/configs/color_configs.dart';
import 'package:weather/widgets/loading_icon_widget.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConfigs.bgColor,
      body: Center(
        child: LoadingIcon(),
      ),
    );
  }
}
