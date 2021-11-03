import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotez/bloc/home_screen/home_bloc.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        builder: (BuildContext context, state) {
      if (state is HomeLoaded) {
        return IconButton(
          onPressed: () {
            BlocProvider.of<HomeBloc>(context).add(
              ShareQuote(
                shareQuote: state.randomQuote,
              ),
            );
          },
          icon: Icon(
            Icons.share,
            size: 25,
            color: Theme.of(context).iconTheme.color,
          ),
        );
      } else {
        return IconButton(
          onPressed: () {
            BlocProvider.of<HomeBloc>(context)
                .add(const ShareQuote(shareQuote: null));
          },
          icon: Icon(
            Icons.share,
            size: 25,
            color: Theme.of(context).iconTheme.color,
          ),
        );
      }
    });
  }
}
