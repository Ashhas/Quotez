import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quotez/bloc/initialization/initialization_cubit.dart';
import 'package:quotez/theme/app_colors.dart';
import 'package:quotez/utils/ui_strings.dart';

/// Widget that shows if there is no internet connectivity on app startup.
class SplashNoNetworkView extends StatelessWidget {
  const SplashNoNetworkView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              UiStrings.noNetworkMessage,
              style: Theme.of(context).primaryTextTheme.bodyText2,
            ),
            ElevatedButton(
              onPressed: () =>
                  BlocProvider.of<InitializationCubit>(context).reloadStartup(),
              child: const Text(UiStrings.reloadButtonTitle),
              style: ElevatedButton.styleFrom(
                primary: AppColors.mediumAquamarine,
                textStyle: Theme.of(context).primaryTextTheme.bodyText2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
