import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quotez/bloc/home_screen/favorite_button/favorite_cubit.dart';
import 'package:quotez/bloc/home_screen/home_cubit.dart';

/// Widget that saves or removes quotes from the database
class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key}) : super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  // Tracks if the favorite button has been pressed in
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listener: (BuildContext context, state) {
        if (state is HomeLoading) {
          BlocProvider.of<FavoriteButtonCubit>(context)
              .resetFavoriteButtonState();
        }
      },
      child: BlocListener<FavoriteButtonCubit, FavoriteState>(
        listener: (BuildContext context, state) {
          if (state is FavoriteUnpressed) {
            isPressed = false;
            setState(() {});
          } else if (state is FavoritePressed) {
            isPressed = true;
            setState(() {});
          }
        },
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (BuildContext context, homeState) {
            return IconButton(
              onPressed: () {
                if (homeState is HomeLoaded) {
                  // Add or Remove the current quote from DB, based on the button state
                  switch (isPressed) {
                    case true:
                      BlocProvider.of<FavoriteButtonCubit>(context)
                          .favoriteButtonUnpressed(homeState.randomQuote);
                      break;
                    case false:
                      BlocProvider.of<FavoriteButtonCubit>(context)
                          .favoriteButtonPressed(homeState.randomQuote);
                      break;
                  }
                }
              },
              icon: Icon(
                isPressed ? Icons.bookmark : Icons.bookmark_add_outlined,
                size: 25,
                color: Theme.of(context).iconTheme.color,
              ),
            );
          },
        ),
      ),
    );
  }
}
