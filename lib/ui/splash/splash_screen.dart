import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quotez/bloc/initialization/initialization_cubit.dart';
import 'package:quotez/ui/home/home_screen.dart';
import 'package:quotez/ui/splash/widgets/splash_no_network_overlay.dart';
import 'package:quotez/ui/splash/widgets/splash_widget.dart';

/// [SplashScreen] determines what widget to show
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<InitializationCubit>(context).startApp();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InitializationCubit, InitializationState>(
      builder: (context, initState) {
        if (initState is InitialState) {
          return const SplashWidget();
        } else if (initState is NoNetworkOnStartup) {
          return const SplashNoNetworkOverlay();
        } else if (initState is InitializedState) {
          return const HomeScreen();
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
