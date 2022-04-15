import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotez/bloc/home_screen/home_cubit.dart';
import 'package:quotez/ui/home/home_screen.dart';
import 'package:quotez/utils/constants/color_const.dart';
import 'package:quotez/utils/constants/ui_const.dart';

/// Widget that is visible when there is no internet available in [HomeScreen]
class HomeNoConnectivityScreen extends StatefulWidget {
  const HomeNoConnectivityScreen({Key? key}) : super(key: key);

  @override
  _HomeNoConnectivityScreenState createState() =>
      _HomeNoConnectivityScreenState();
}

class _HomeNoConnectivityScreenState extends State<HomeNoConnectivityScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listener: (BuildContext context, state) {
        if (state is ReloadedHome) {
          BlocProvider.of<HomeCubit>(context).getRandomQuote();
        }
      },
      child: Expanded(
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
      ),
    );
  }
}
