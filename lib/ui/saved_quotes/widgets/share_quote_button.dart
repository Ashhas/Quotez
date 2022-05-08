import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quotez/bloc/saved_quotes_screen/saved_quote_cubit.dart';
import 'package:quotez/data/model/quote.dart';
import 'package:quotez/utils/share_util.dart';

/// [ShareQuoteButton] shares saved quotes to other social-media when pressed
class ShareQuoteButton extends StatelessWidget {
  final Quote quote;

  const ShareQuoteButton({
    required this.quote,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavedQuotesCubit, SavedQuoteState>(
      builder: (BuildContext context, state) {
        if (state is SavedQuotesLoaded) {
          return IconButton(
            onPressed: () {
              ShareUtil.shareQuote(quote);
            },
            icon: Icon(
              Icons.share,
              size: 25,
              color: Theme.of(context).iconTheme.color,
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
