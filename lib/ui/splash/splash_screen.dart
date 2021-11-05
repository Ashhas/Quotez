import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotez/bloc/initialization/initialization_bloc.dart';
import 'package:quotez/ui/home/home.dart';
import 'package:quotez/ui/splash/widgets/splash_no_connectivity_screen.dart';
import 'package:quotez/ui/splash/widgets/splash_widget.dart';

/// Splash screen, determines what widget to show
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InitializationBloc, InitializationState>(
      builder: (context, initState) {
        if (initState is InitialState) {
          return const SplashWidget();
        } else if (initState is NoNetworkOnStartup) {
          return const SplashNoConnectivityScreen();
        } else if (initState is InitializedState) {
          return const HomeScreen();
        } else {
          return Container();
        }
      },
    );
  }
}
