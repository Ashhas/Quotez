import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quotez/data/model/quote.dart';
import 'package:quotez/data/repository/quote_repository.dart';
import 'package:quotez/ui/home/widgets/buttons/bookmark_button.dart';

part 'bookmark_state.dart';

/// [BookmarkButtonCubit] emits states for [BookmarkButton]
/// Can be used to save or remove [Quote] values in the database
class BookmarkButtonCubit extends Cubit<BookmarkState> {
  QuoteRepository quoteRepository;

  BookmarkButtonCubit({required this.quoteRepository})
      : super(BookmarkNotPressed());

  /// Save Quote in Box.
  void bookmarkQuote(Quote? quote) {
    emit(BookmarkPressed());
    quoteRepository.saveQuote(quote);
  }

  /// Remove current quote from box (after adding it).
  void removeBookmarkedQuote(Quote? quote) {
    emit(BookmarkNotPressed());
    quoteRepository.removeQuote(quote);
  }

  /// Set a new state to reset the widget in UI.
  void resetFavoriteButtonState() {
    emit(BookmarkNotPressed());
  }
}
