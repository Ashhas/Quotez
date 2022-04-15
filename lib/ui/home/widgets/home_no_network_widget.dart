import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotez/bloc/home_screen/home_cubit.dart';
import 'package:quotez/utils/constants/color_const.dart';
import 'package:quotez/utils/constants/ui_const.dart';

/// [HomeNoNetworkWidget]
class HomeNoNetworkWidget extends StatelessWidget {
  const HomeNoNetworkWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(UiConst.noNetworkMessage),
            ElevatedButton(
              onPressed: () {
                // Check internet connection; Reload HomeScreen if it is possible
                BlocProvider.of<HomeCubit>(context).reloadHome();
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
