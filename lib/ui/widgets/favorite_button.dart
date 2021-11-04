import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotez/bloc/home_screen/favorite_button/favorite_bloc.dart';
import 'package:quotez/bloc/home_screen/home_bloc.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (BuildContext context, homeState) {
        if (homeState is HomeLoaded) {
          return BlocBuilder<FavoriteBloc, FavoriteState>(
            builder: (BuildContext context, favoriteState) {
              if (favoriteState is FavoriteUnpressed) {
                return IconButton(
                  onPressed: () {
                    BlocProvider.of<FavoriteBloc>(context).add(
                        AddQuoteToFavorites(newQuote: homeState.randomQuote));
                  },
                  icon: Icon(
                    Icons.favorite_border,
                    size: 25,
                    color: Theme.of(context).iconTheme.color,
                  ),
                );
              } else if (favoriteState is FavoritePressed) {
                return IconButton(
                  onPressed: () {
                    BlocProvider.of<FavoriteBloc>(context)
                        .add(RemoveQuoteToFavorites());
                  },
                  icon: Icon(
                    Icons.favorite,
                    size: 25,
                    color: Theme.of(context).iconTheme.color,
                  ),
                );
              } else {
                return Container();
              }
            },
          );
        } else {
          return IconButton(
            onPressed: () {
              BlocProvider.of<HomeBloc>(context)
                  .add(const ShareQuote(shareQuote: null));
            },
            icon: Icon(
              Icons.favorite_border,
              size: 25,
              color: Theme.of(context).iconTheme.color,
            ),
          );
        }
      },
    );
  }
}
