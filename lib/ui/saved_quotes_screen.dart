import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotez/bloc/saved_quotes_screen/saved_quote_bloc.dart';

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

    BlocProvider.of<SavedQuotesBloc>(context).add(GetAllSavedQuotes());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: const Text(
            "Saved Quotes",
            style: TextStyle(color: Colors.black87),
          ),
          elevation: 0,
          iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
          backgroundColor: Colors.white,
        ),
        body: BlocBuilder<SavedQuotesBloc, SavedQuoteState>(
          builder: (BuildContext context, state) {
            if (state is SavedQuotesLoaded) {
              return ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: state.savedQuotes!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(state.savedQuotes![index].quote),
                      subtitle: Text(state.savedQuotes![index].author),
                    );
                  });
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
