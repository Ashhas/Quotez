import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotez/bloc/home_screen/favorite_button/favorite_bloc.dart';
import 'package:quotez/bloc/home_screen/home_bloc.dart';
import 'package:quotez/bloc/home_screen/load_quote_button/quote_button_bloc.dart';
import 'package:quotez/ui/widgets/quote_button.dart';
import 'package:quotez/ui/widgets/share_button.dart';

import 'favorite_button.dart';

class ActionButtonRow extends StatefulWidget {
  const ActionButtonRow({Key? key}) : super(key: key);

  @override
  _ActionButtonRowState createState() => _ActionButtonRowState();
}

class _ActionButtonRowState extends State<ActionButtonRow> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<QuoteButtonBloc>(context).add(InitiateQuoteButton());
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        FavoriteButton(),
        QuoteButton(),
        ShareButton(),
      ],
    );
  }
}
