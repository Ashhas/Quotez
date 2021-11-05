import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotez/bloc/home_screen/home_bloc.dart';
import 'package:quotez/utils/constants/color_const.dart';
import 'package:quotez/utils/constants/ui_const.dart';

class HomeNoConnectivityScreen extends StatefulWidget {
  const HomeNoConnectivityScreen({Key? key}) : super(key: key);

  @override
  _HomeNoConnectivityScreenState createState() =>
      _HomeNoConnectivityScreenState();
}

class _HomeNoConnectivityScreenState extends State<HomeNoConnectivityScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (BuildContext context, state) {
        if (state is ReloadedHome) {
          BlocProvider.of<HomeBloc>(context).add(GetRandomQuote());
        }
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(UiConst.noNetworkMessage),
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<HomeBloc>(context).add(ReloadHome());
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
    );
  }
}
