import 'package:flutter/material.dart';
import 'package:quotez/ui/home.dart';
import 'package:quotez/ui/saved_quotes_screen.dart';
import 'package:quotez/utils/constants/theme_const.dart';
import 'package:quotez/utils/constants/ui_const.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.getDefaultTheme(),
      initialRoute: UiConst.homeScreenRoute,
      routes: {
        UiConst.homeScreenRoute: (context) => HomeScreen(),
        UiConst.savedQuotesScreenRoute: (context) => SavedQuotesScreen(),
      },
    );
  }
}
