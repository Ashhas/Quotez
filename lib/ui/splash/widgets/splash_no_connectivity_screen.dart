import 'package:flutter/material.dart';

class SplashNoConnectivityScreen extends StatelessWidget {
  const SplashNoConnectivityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text("No network"),
      ),
    );
  }
}
