import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotez/bloc/saved_quotes_screen/saved_quote_bloc.dart';
import 'package:quotez/data/model/quote.dart';

/// ShareButton that shares saved quotes to other socialmedia
class SavedShareButton extends StatelessWidget {
  final Quote savedShareQuote;

  const SavedShareButton({Key? key, required this.savedShareQuote})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavedQuotesBloc, SavedQuoteState>(
      builder: (BuildContext context, state) {
        return IconButton(
          onPressed: () {
            if (state is SavedQuotesLoaded) {
              BlocProvider.of<SavedQuotesBloc>(context).add(
                ShareSavedQuote(savedQuote: savedShareQuote),
              );
            }
          },
          icon: Icon(
            Icons.share,
            size: 25,
            color: Theme.of(context).iconTheme.color,
          ),
        );
      },
    );
  }
}
