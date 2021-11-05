import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotez/bloc/home_screen/favorite_button/favorite_bloc.dart';
import 'package:quotez/bloc/home_screen/home_bloc.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key}) : super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  var isPressed = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<FavoriteBloc, FavoriteState>(
      listener: (BuildContext context, state) {
        if (state is FavoriteUnpressed) {
          isPressed = false;
          setState(() {});
        } else if (state is FavoritePressed) {
          isPressed = true;
          setState(() {});
        }
      },
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (BuildContext context, homeState) {
          return IconButton(
            onPressed: () {
              if (homeState is HomeLoaded) {
                switch (isPressed) {
                  case true:
                    BlocProvider.of<FavoriteBloc>(context).add(
                        RemoveQuoteToFavorites(quote: homeState.randomQuote));
                    break;
                  case false:
                    BlocProvider.of<FavoriteBloc>(context).add(
                        AddQuoteToFavorites(newQuote: homeState.randomQuote));
                    break;
                }
              }
            },
            icon: Icon(
              isPressed ? Icons.favorite : Icons.favorite_border,
              size: 25,
              color: Theme.of(context).iconTheme.color,
            ),
          );
        },
      ),
    );
  }
}
