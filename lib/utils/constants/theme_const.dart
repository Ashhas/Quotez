import 'package:flutter/material.dart';
import 'package:quotez/utils/constants/color_const.dart';

class AppTheme {
  static ThemeData getDefaultTheme() {
    return ThemeData(
        primaryColor: ColorConst.kabisaMediumAquamarine,
        hintColor: ColorConst.kabisaLightGrey,
        backgroundColor: ColorConst.backgroundColor,
        canvasColor: ColorConst.kabisaDarkSlateGrey,
        iconTheme: const IconThemeData(color: ColorConst.defaultIconColor),
        errorColor: ColorConst.errorTextColor);
  }
}
