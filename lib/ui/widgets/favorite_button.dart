import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotez/bloc/home_screen/favorite_button/favorite_bloc.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      builder: (BuildContext context, state) {
        if (state is FavoriteUnpressed) {
          return IconButton(
            onPressed: () {
              BlocProvider.of<FavoriteBloc>(context).add(AddQuoteToFavorites());
            },
            icon: Icon(
              Icons.favorite_border,
              size: 25,
              color: Theme.of(context).iconTheme.color,
            ),
          );
        } else if (state is FavoritePressed) {
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
  }
}
