import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quotez/bloc/saved_quotes_screen/saved_quote_cubit.dart';
import 'package:quotez/ui/saved_quotes/widgets/delete_quotes_button.dart';
import 'package:quotez/ui/saved_quotes/widgets/saved_quotes_list.dart';
import 'package:quotez/utils/ui_strings.dart';

/// [SavedQuotesScreen] displays all saved quotes in a listview.
class SavedQuotesScreen extends StatefulWidget {
  const SavedQuotesScreen({Key? key}) : super(key: key);

  @override
  _SavedQuotesScreenState createState() => _SavedQuotesScreenState();
}

class _SavedQuotesScreenState extends State<SavedQuotesScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SavedQuotesCubit>(context).getAllSavedQuotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          UiStrings.savedQuoteScreenTitle,
          style: TextStyle(color: Colors.black87),
        ),
        actions: const [
          DeleteQuotesButton(),
        ],
        elevation: 0,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Theme.of(context).appBarTheme.backgroundColor,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: BlocBuilder<SavedQuotesCubit, SavedQuoteState>(
          builder: (BuildContext context, state) {
            if (state is SavedQuotesLoaded) {
              return SavedQuotesList(savedQuotes: state.savedQuotes!);
            } else if (state is NoSavedQuotes) {
              return const Center(
                child: Text(UiStrings.savedQuoteScreenNoData),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
