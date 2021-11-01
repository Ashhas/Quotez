import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favorite_event.dart';

part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteUnpressed());

  @override
  Stream<FavoriteState> mapEventToState(FavoriteEvent event) async* {
    if (event is AddQuoteToFavorites) {
      yield* _mapFavoriteButtonPressed(event, state);
    }
  }

  Stream<FavoriteState> _mapFavoriteButtonPressed(
      FavoriteEvent event, FavoriteState state) async* {
    print("in method");
  }
}
