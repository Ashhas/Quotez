import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quotez/bloc/initialization/initialization_cubit.dart';
import 'package:quotez/ui/home/home_screen.dart';
import 'package:quotez/ui/splash/widgets/splash_loading_widget.dart';
import 'package:quotez/ui/splash/widgets/splash_no_network_view.dart';

/// [SplashScreen] determines what widget to show:
/// - [SplashLoadingWidget] is shown with [InitialState] and is always shown first
/// - [SplashNoNetworkView] is shown when there there is no connection with [NoNetworkOnStartup]
///   (Does not check if the connection actually provides internet-access)
/// - [HomeScreen] is shown on [InitializedState]
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).backgroundColor,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Theme.of(context).backgroundColor,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: BlocBuilder<InitializationCubit, InitializationState>(
        builder: (context, initState) {
          if (initState is InitialState) {
            return const SplashLoadingWidget();
          } else if (initState is NoNetworkOnStartup) {
            return const SplashNoNetworkView();
          } else if (initState is InitializedState) {
            return const HomeScreen();
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
