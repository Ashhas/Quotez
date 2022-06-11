import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:quotez/data/model/quote.dart';
import 'package:quotez/data/repository/quote_repository.dart';

part 'saved_quote_state.dart';

///Bloc handles the events and states in [SavedQuotesScreen]
///Currently this Bloc only fetches all quotes from the local database
class SavedQuotesCubit extends Cubit<SavedQuoteState> {
  QuoteRepository quoteRepository;

  SavedQuotesCubit({required this.quoteRepository}) : super(SavedQuoteInit());

  /// [getAllSavedQuotes] Loads all quotes from DB.
  void getAllSavedQuotes() async {
    emit(LoadingSavedQuotes());

    // Get Quote Response.
    final savedQuotes = await quoteRepository.getSavedQuotes();

    // Check if DB has any quotes stored.
    if (savedQuotes != null && savedQuotes.isNotEmpty) {
      emit(SavedQuotesLoaded(savedQuotes));
    } else {
      emit(NoSavedQuotes());
    }
  }

  /// Delete All Quotes.
  void deleteAllSavedQuotes() async {
    await quoteRepository.removeAllQuotes();
    emit(NoSavedQuotes());
  }
}
