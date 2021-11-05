import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotez/bloc/saved_quotes_screen/saved_quote_bloc.dart';

/// IconButton deletes all quotes from box
class QuotesDeleteButton extends StatelessWidget {
  const QuotesDeleteButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        BlocProvider.of<SavedQuotesBloc>(context).add(DeleteAllSavedQuotes());
      },
      icon: Icon(
        Icons.delete,
        size: 25,
        color: Theme.of(context).iconTheme.color,
      ),
    );
  }
}
