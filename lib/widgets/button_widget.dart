import 'package:flutter/material.dart';
import 'package:weather/configs/color_configs.dart';
import 'package:weather/resources/texts/texts.dart';
import 'package:weather/utils/resizable_utils.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key, required this.onPressed});

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorConfigs.buttonBgColor,
        foregroundColor: ColorConfigs.whiteTextColor,
        padding: EdgeInsets.symmetric(
            horizontal: Resizable.padding(context, 24),
            vertical: Resizable.padding(context, 12)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 4, // độ nổi
      ),
      child: Text(
        Texts.main.retry,
        style: TextStyle(
          fontSize: Resizable.font(context, 16),
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}
