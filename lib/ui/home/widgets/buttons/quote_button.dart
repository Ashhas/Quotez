import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quotez/bloc/home_screen/home_cubit.dart';
import 'package:quotez/bloc/home_screen/load_quote_button/quote_button_cubit.dart';
import 'package:quotez/bloc/network_connectivity/network_connectivity_cubit.dart';
import 'package:quotez/theme/app_dimens.dart';
import 'package:quotez/utils/ui_strings.dart';

/// [QuoteButton] executes request to fetch new random quote.
/// Also, it animates whenever it is pressed.
class QuoteButton extends StatefulWidget {
  const QuoteButton({Key? key}) : super(key: key);

  @override
  _QuoteButtonState createState() => _QuoteButtonState();
}

class _QuoteButtonState extends State<QuoteButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<QuoteButtonCubit, QuoteButtonState>(
      listener: (BuildContext context, state) {
        if (state is QuoteButtonPressed) {
          // Execute the icon rotation.
          _controller.reset();
          _controller.forward();
        }
      },
      child: BlocBuilder<NetworkConnectivityCubit, NetworkConnectivityState>(
        builder: (BuildContext context, state) {
          return ElevatedButton(
            onPressed: () {
              // Based on the network connection, do request to fetch quotes.
              if (state is NoNetworkConnectionState) {
                Navigator.pushReplacementNamed(
                  context,
                  UiStrings.homeNoNetworkWidgetRoute,
                );
              } else {
                BlocProvider.of<HomeCubit>(context).getRandomQuote();
              }
            },
            child: Center(
              child: RotationTransition(
                turns: Tween(
                  begin: AppDimens.beginTween,
                  end: AppDimens.endTween,
                ).animate(_controller),
                child: const Icon(
                  Icons.sync,
                  size: AppDimens.iconSizeXL,
                ),
              ),
            ),
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(
                AppDimens.buttonSizeXL,
                AppDimens.buttonSizeXL,
              ),
              primary: Theme.of(context).primaryColor,
              shape: const CircleBorder(
                side: BorderSide.none,
              ),
            ),
          );
        },
      ),
    );
  }
}
