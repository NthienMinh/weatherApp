

import 'package:flutter/cupertino.dart';
import 'package:weather/configs/color_configs.dart';
import 'package:weather/utils/resizable_utils.dart';

class TextStyleConfigs {

  static TextStyle errorTextStyle(BuildContext context){
    return TextStyle(
      color: ColorConfigs.whiteTextColor,
      fontSize: Resizable.font(context, 54),
      fontWeight: FontWeight.w100
    );
  }

  static TextStyle bigBoldBlackTextStyle(BuildContext context){
    return TextStyle(
        color: ColorConfigs.blackTextColor,
        fontSize: Resizable.font(context, 96),
        fontWeight: FontWeight.w900,
        height: 1.2,
        letterSpacing: 0
    );
  }

  static TextStyle normalBlueTextStyle(BuildContext context){
    return TextStyle(
        color: ColorConfigs.blueTextColor,
        fontSize: Resizable.font(context, 36),
        fontWeight: FontWeight.w100,
        height: 1.4,
        letterSpacing: 0
    );
  }

  static TextStyle smallBlackTextStyle(BuildContext context){
    return TextStyle(
        color: ColorConfigs.blackTextColor,
        fontSize: Resizable.font(context, 16),
        fontWeight: FontWeight.w400,
        height: 1.2,
        letterSpacing: 0
    );
  }

}