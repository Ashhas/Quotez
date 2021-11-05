import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quotez/data/model/quote.dart';
import 'package:quotez/data/repository/quote_repository.dart';
import 'package:share_plus/share_plus.dart';

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
    } else if (event is ShareSavedQuote) {
      yield* _mapShareQuoteToState(event);
    }
  }

  Stream<SavedQuoteState> _mapGetAllSavedQuotesToState() async* {
    yield LoadingSavedQuotes();

    //Get Quote Response
    var savedQuotes = await quoteRepository.getSavedQuotes();

    yield SavedQuotesLoaded(savedQuotes);
  }

  //Share current quote
  Stream<SavedQuoteState> _mapShareQuoteToState(ShareSavedQuote event) async* {
    Share.share("\"${event.savedQuote.quote}\"\n - ${event.savedQuote.author}");
  }
}
