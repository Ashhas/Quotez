import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quotez/data/model/quote.dart';
import 'package:quotez/data/repository/quote_repository.dart';

part 'favorite_state.dart';

///Bloc that keeps track of the state the [FavoriteButton] widget currently has.
///Based on the given event, this bloc can: Save, Delete a [Quote] or Reset widget in UI
class FavoriteButtonCubit extends Cubit<FavoriteState> {
  QuoteRepository quoteRepository;

  FavoriteButtonCubit({required this.quoteRepository})
      : super(FavoriteUnpressed());

  /// Save Quote in Box
  void favoriteButtonPressed(Quote? quote) {
    emit(FavoritePressed());
    quoteRepository.saveQuote(quote);
  }

  /// Remove current quote from box (after adding it)
  void favoriteButtonUnpressed(Quote? quote) {
    emit(FavoriteUnpressed());
    quoteRepository.removeQuote(quote);
  }

  /// Set a new state to reset the widget in UI
  void resetFavoriteButtonState() {
    emit(FavoriteUnpressed());
  }
}
