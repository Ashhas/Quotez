import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quotez/bloc/saved_quotes_screen/saved_quote_cubit.dart';
import 'package:quotez/theme/app_dimens.dart';

/// [DeleteQuotesButton] deletes all quotes from box on pressed.
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
        size: AppDimens.iconSizeM,
        color: Theme.of(context).iconTheme.color,
      ),
    );
  }
}
