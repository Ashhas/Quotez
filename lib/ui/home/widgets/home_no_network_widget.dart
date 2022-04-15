import 'package:flutter/material.dart';

import 'package:quotez/utils/constants/ui_const.dart';

/// [HomeNoNetworkWidget]
class HomeNoNetworkWidget extends StatelessWidget {
  const HomeNoNetworkWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Center(
        child: Text(UiConst.noNetworkMessage),
      ),
    );
  }
}
