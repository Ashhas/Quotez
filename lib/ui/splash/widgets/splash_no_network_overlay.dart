import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quotez/bloc/initialization/initialization_cubit.dart';
import 'package:quotez/utils/constants/color_const.dart';
import 'package:quotez/utils/constants/ui_const.dart';

/// Screen that displays if there is no internet connectivity on app startup
class SplashNoNetworkOverlay extends StatelessWidget {
  const SplashNoNetworkOverlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(UiConst.noNetworkMessage),
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<InitializationCubit>(context).reloadStartup();
              },
              child: const Text(UiConst.reloadButtonTitle),
              style: ElevatedButton.styleFrom(
                primary: ColorConst.kabisaMediumAquamarine,
                textStyle: const TextStyle(fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
