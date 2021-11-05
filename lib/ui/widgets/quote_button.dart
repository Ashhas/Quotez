import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotez/bloc/home_screen/home_bloc.dart';
import 'package:quotez/bloc/home_screen/load_quote_button/quote_button_bloc.dart';

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
    return BlocListener<QuoteButtonBloc, QuoteButtonState>(
      listener: (BuildContext context, state) {
        if (state is QuoteButtonPressed) {
          _controller.reset();
          _controller.forward();
        }
      },
      child: ElevatedButton(
        onPressed: () {
          BlocProvider.of<HomeBloc>(context).add(GetRandomQuote());
        },
        child: Center(
          child: RotationTransition(
            turns: Tween(begin: 0.5, end: 0.0).animate(_controller),
            child: const Icon(
              Icons.sync,
              size: 35,
            ),
          ),
        ),
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(80, 80),
          primary: Theme.of(context).primaryColor,
          shape: const CircleBorder(
            side: BorderSide.none,
          ),
        ),
      ),
    );
  }
}