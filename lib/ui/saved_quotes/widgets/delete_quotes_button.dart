import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotez/bloc/saved_quotes_screen/saved_quote_cubit.dart';

/// IconButton deletes all quotes from box
class DeleteQuotesButton extends StatelessWidget {
  const DeleteQuotesButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        BlocProvider.of<SavedQuotesCubit>(context).deleteAllSavedQuotes();
      },
      icon: Icon(
        Icons.delete,
        size: 25,
        color: Theme.of(context).iconTheme.color,
      ),
    );
  }
}
