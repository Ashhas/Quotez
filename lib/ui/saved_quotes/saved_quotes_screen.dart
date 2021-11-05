import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotez/bloc/saved_quotes_screen/saved_quote_bloc.dart';
import 'package:quotez/ui/saved_quotes/widgets/quotes_delete_button.dart';
import 'package:quotez/utils/constants/ui_const.dart';

import 'widgets/saved_share_button.dart';

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

    BlocProvider.of<SavedQuotesBloc>(context).add(CheckSavedQuotesCount());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: const Text(
            UiConst.savedQuoteScreenTitle,
            style: TextStyle(color: Colors.black87),
          ),
          actions: const [
            QuotesDeleteButton(),
          ],
          elevation: 0,
          iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
          backgroundColor: Colors.white,
        ),
        body: BlocBuilder<SavedQuotesBloc, SavedQuoteState>(
          builder: (BuildContext context, state) {
            if (state is SavedQuotesLoaded) {
              return ListView.separated(
                padding: const EdgeInsets.all(8),
                itemCount: state.savedQuotes!.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(height: 1),
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(
                      state.savedQuotes![index].quote,
                      style: Theme.of(context).primaryTextTheme.bodyText2,
                    ),
                    subtitle: Text("- ${state.savedQuotes![index].author}",
                        style: Theme.of(context).primaryTextTheme.subtitle2),
                    trailing: Wrap(
                      spacing: 12, // space between two icons
                      children: <Widget>[
                        SavedShareButton(
                          savedShareQuote: state.savedQuotes![index],
                        ) // icon-1// icon-2
                      ],
                    ),
                  );
                },
              );
            } else if (state is NoSavedQuotes) {
              return const Center(
                child: Text(UiConst.savedQuoteScreenNoData),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
