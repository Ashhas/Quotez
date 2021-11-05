import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotez/bloc/initialization/initialization_bloc.dart';
import 'package:quotez/utils/constants/color_const.dart';
import 'package:quotez/utils/constants/ui_const.dart';

class SplashNoConnectivityScreen extends StatelessWidget {
  const SplashNoConnectivityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(UiConst.noNetworkMessage),
            BlocBuilder<InitializationBloc, InitializationState>(
              builder: (BuildContext context, state) {
                return ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<InitializationBloc>(context)
                        .add(ReloadWithNetwork());
                  },
                  child: const Text(UiConst.reloadButtonTitle),
                  style: ElevatedButton.styleFrom(
                    primary: ColorConst.kabisaMediumAquamarine,
                    textStyle: const TextStyle(fontSize: 15),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
