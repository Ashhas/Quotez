import 'package:flutter/material.dart';

import 'package:quotez/utils/ui_strings.dart';

/// [HomeNoNetworkView] shows if there is no internet connectivity while on the home screen.
class HomeNoNetworkView extends StatelessWidget {
  const HomeNoNetworkView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text(
          UiStrings.noNetworkMessage,
          style: Theme.of(context).primaryTextTheme.headline5,
        ),
      ),
    );
  }
}
