import 'package:flutter/material.dart';

import '../../../utils/constants/ui_const.dart';

class SplashWidget extends StatelessWidget {
  const SplashWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(UiConst.splashText),
      ),
    );
  }
}
