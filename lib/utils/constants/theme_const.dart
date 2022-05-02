import 'package:flutter/material.dart';

import 'package:quotez/utils/constants/color_const.dart';
import 'package:quotez/utils/constants/font_const.dart';

abstract class AppTheme {
  static ThemeData getDefaultTheme() {
    return ThemeData(
      primaryColor: ColorConst.kabisaMediumAquamarine,
      hintColor: ColorConst.kabisaLightGrey,
      backgroundColor: ColorConst.backgroundColor,
      canvasColor: ColorConst.kabisaDarkSlateGrey,
      iconTheme: const IconThemeData(color: ColorConst.defaultIconColor),
      errorColor: ColorConst.errorTextColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white
      ),
      primaryTextTheme: const TextTheme(
        bodyText2: FontConst.bodyListTile,
        subtitle2: FontConst.subtitleListTile,
        headline6: FontConst.quoteText,
        headline5: FontConst.quoteAuthor,
      ),
    );
  }
}
