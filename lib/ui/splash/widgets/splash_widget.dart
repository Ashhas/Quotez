import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:quotez/theme/app_colors.dart';

/// [SplashWidget] default splash screen widget.
class SplashWidget extends StatelessWidget {
  const SplashWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: AppColors.mediumAquamarine,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: AppColors.mediumAquamarine,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: AppColors.mediumAquamarine,
        body: Center(
          child: Image(
            width: 100,
            height: 100,
            image: AssetImage(
              "assets/app_icon.png",
            ),
          ),
        ),
      ),
    );
  }
}
