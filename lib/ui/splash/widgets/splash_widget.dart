import 'package:flutter/material.dart';

import 'package:quotez/utils/constants/ui_const.dart';

/// [SplashWidget]
class SplashWidget extends StatelessWidget {
  const SplashWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: const Center(
        child: Text(UiConst.splashText),
      ),
    );
  }
}
