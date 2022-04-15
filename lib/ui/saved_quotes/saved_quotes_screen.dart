import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotez/bloc/saved_quotes_screen/saved_quote_cubit.dart';
import 'package:quotez/ui/saved_quotes/widgets/delete_quotes_button.dart';
import 'package:quotez/ui/saved_quotes/widgets/saved_quotes_list.dart';
import 'package:quotez/utils/constants/ui_const.dart';

import 'widgets/share_quote_button.dart';

///Screen that displays all saved quotes in a listview
class SavedQuotesScreen extends StatefulWidget {
  const SavedQuotesScreen({Key? key}) : super(key: key);

  @override
  _SavedQuotesScreenState createState() => _SavedQuotesScreenState();
}

class _SavedQuotesScreenState extends State<SavedQuotesScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SavedQuotesCubit>(context).checkAvailableQuotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: const Text(
          UiConst.savedQuoteScreenTitle,
          style: TextStyle(color: Colors.black87),
        ),
        actions: const [
          DeleteQuotesButton(),
        ],
        elevation: 0,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: BlocBuilder<SavedQuotesCubit, SavedQuoteState>(
          builder: (BuildContext context, state) {
            if (state is SavedQuotesLoaded) {
              return SavedQuotesList(savedQuotes: state.savedQuotes!);
            } else if (state is NoSavedQuotes) {
              return const Center(
                child: Text(UiConst.savedQuoteScreenNoData),
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
