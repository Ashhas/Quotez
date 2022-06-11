import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quotez/bloc/home_screen/bookmark_button/bookmark_cubit.dart';
import 'package:quotez/bloc/home_screen/home_cubit.dart';
import 'package:quotez/theme/app_dimens.dart';

/// [BookmarkButton] saves or removes quotes from the database on-pressed.
class BookmarkButton extends StatefulWidget {
  const BookmarkButton({Key? key}) : super(key: key);

  @override
  _BookmarkButtonState createState() => _BookmarkButtonState();
}

class _BookmarkButtonState extends State<BookmarkButton> {
  // Tracks if the favorite button has been pressed.
  bool bookmarkPressed = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listener: (BuildContext context, state) {
        if (state is HomeLoading) {
          BlocProvider.of<BookmarkButtonCubit>(context)
              .resetFavoriteButtonState();
        }
      },
      child: BlocListener<BookmarkButtonCubit, BookmarkState>(
        listener: (BuildContext context, state) {
          if (state is BookmarkNotPressed) {
            setState(() {
              bookmarkPressed = false;
            });
          } else if (state is BookmarkPressed) {
            setState(() {
              bookmarkPressed = true;
            });
          }
        },
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (BuildContext context, homeState) {
            return IconButton(
              onPressed: () {
                if (homeState is HomeLoaded) {
                  // Add or Remove the current quote from DB, based on the button state.
                  bookmarkPressed
                      ? BlocProvider.of<BookmarkButtonCubit>(context)
                          .removeBookmarkedQuote(homeState.randomQuote)
                      : BlocProvider.of<BookmarkButtonCubit>(context)
                          .bookmarkQuote(homeState.randomQuote);
                }
              },
              icon: Icon(
                bookmarkPressed ? Icons.bookmark : Icons.bookmark_add_outlined,
                size: AppDimens.iconSizeM,
                color: Theme.of(context).iconTheme.color,
              ),
            );
          },
        ),
      ),
    );
  }
}
