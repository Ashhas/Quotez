import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quotez/data/model/quote.dart';
import 'package:quotez/data/repository/quote_repository.dart';

part 'bookmark_state.dart';

///Bloc that keeps track of the state the [FavoriteButton] widget currently has.
///Based on the given event, this bloc can: Save, Delete a [Quote] or Reset widget in UI
class BookmarkButtonCubit extends Cubit<BookmarkState> {
  QuoteRepository quoteRepository;

  BookmarkButtonCubit({required this.quoteRepository})
      : super(BookmarkNotPressed());

  /// Save Quote in Box
  void bookmarkQuote(Quote? quote) {
    emit(BookmarkPressed());
    quoteRepository.saveQuote(quote);
  }

  /// Remove current quote from box (after adding it)
  void removeBookmarkedQuote(Quote? quote) {
    emit(BookmarkNotPressed());
    quoteRepository.removeQuote(quote);
  }

  /// Set a new state to reset the widget in UI
  void resetFavoriteButtonState() {
    emit(BookmarkNotPressed());
  }
}
