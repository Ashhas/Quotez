import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotez/data/model/quote.dart';
import 'package:quotez/data/repository/quote_repository.dart';

part 'favorite_event.dart';

part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  QuoteRepository quoteRepository;

  FavoriteBloc({required this.quoteRepository}) : super(FavoriteUnpressed());

  @override
  Stream<FavoriteState> mapEventToState(FavoriteEvent event) async* {
    if (event is AddQuoteToFavorites) {
      yield* _mapFavoriteButtonPressed(event);
    } else if (event is RemoveQuoteToFavorites) {
      yield* _mapFavoriteButtonUnpressed(event);
    } else if (event is ResetFavoriteButton) {
      yield* _mapResetFavoriteButton();
    }
  }

  Stream<FavoriteState> _mapFavoriteButtonPressed(
      AddQuoteToFavorites event) async* {
    yield FavoritePressed();

    if (event.newQuote != null) {
      quoteRepository.saveQuote(event.newQuote);
    }
  }

  Stream<FavoriteState> _mapFavoriteButtonUnpressed(
      RemoveQuoteToFavorites event) async* {
    yield FavoriteUnpressed();

    if (event.quote != null) {
      quoteRepository.removeQuote(event.quote);
    }
  }

  Stream<FavoriteState> _mapResetFavoriteButton() async* {
    yield FavoriteUnpressed();
  }
}
