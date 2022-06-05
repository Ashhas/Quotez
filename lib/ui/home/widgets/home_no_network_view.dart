import 'package:flutter/material.dart';

import 'package:quotez/utils/constants/ui_const.dart';

/// [HomeNoNetworkView] shows if there is no internet connectivity while on the home screen.
class HomeNoNetworkView extends StatelessWidget {
  const HomeNoNetworkView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Center(
        child: Text(UiConst.noNetworkMessage),
      ),
    );
  }
}
