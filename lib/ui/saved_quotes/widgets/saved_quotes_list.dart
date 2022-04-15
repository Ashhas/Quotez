import 'package:flutter/material.dart';

import 'package:quotez/data/model/quote.dart';
import 'package:quotez/ui/saved_quotes/widgets/share_quote_button.dart';

class SavedQuotesList extends StatelessWidget {
  const SavedQuotesList({Key? key, required this.savedQuotes})
      : super(key: key);

  final List<Quote> savedQuotes;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: savedQuotes.length,
      separatorBuilder: (BuildContext context, int index) =>
          const Divider(height: 1),
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(
            savedQuotes[index].value,
            style: Theme.of(context).primaryTextTheme.bodyText2,
          ),
          subtitle: Text("- ${savedQuotes[index].author}",
              style: Theme.of(context).primaryTextTheme.subtitle2),
          trailing: ShareQuoteButton(
            quote: savedQuotes[index],
          ),
        );
      },
    );
  }
}
