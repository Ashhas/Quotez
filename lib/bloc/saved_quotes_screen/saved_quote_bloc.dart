import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quotez/data/model/quote.dart';
import 'package:quotez/data/repository/quote_repository.dart';
import 'package:quotez/ui/saved_quotes_screen.dart';

part 'saved_quote_event.dart';

part 'saved_quote_state.dart';

///Bloc handles the events and states in [SavedQuotesScreen]
///Currently this Bloc only fetches all quotes from the local database
class SavedQuotesBloc extends Bloc<SavedQuoteEvent, SavedQuoteState> {
  QuoteRepository quoteRepository;

  SavedQuotesBloc({required this.quoteRepository}) : super(SavedQuoteInit());

  @override
  Stream<SavedQuoteState> mapEventToState(SavedQuoteEvent event) async* {
    if (event is GetAllSavedQuotes) {
      yield* _mapGetAllSavedQuotesToState();
    }
  }

  Stream<SavedQuoteState> _mapGetAllSavedQuotesToState() async* {
    yield LoadingSavedQuotes();

    //Get Quote Response
    var savedQuotes = await quoteRepository.getSavedQuotes();

    yield SavedQuotesLoaded(savedQuotes);
  }
}
