import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotez/bloc/home_screen/favorite_button/favorite_bloc.dart';
import 'package:quotez/bloc/home_screen/home_bloc.dart';
import 'package:quotez/bloc/home_screen/load_quote_button/quote_button_bloc.dart';
import 'package:quotez/bloc/home_screen/share_button/share_bloc.dart';

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
      children: [
        IconButton(
          onPressed: () {
            BlocProvider.of<FavoriteBloc>(context).add(AddQuoteToFavorites());
          },
          icon: Icon(
            Icons.favorite_border,
            size: 25,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            BlocProvider.of<HomeBloc>(context).add(GetRandomQuote());
          },
          child: Center(
            child: Icon(
              Icons.sync,
              size: 35,
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
        IconButton(
          onPressed: () {
            BlocProvider.of<ShareBloc>(context).add(ShareQuote());
          },
          icon: Icon(
            Icons.share,
            size: 25,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
      ],
    );
  }
}
