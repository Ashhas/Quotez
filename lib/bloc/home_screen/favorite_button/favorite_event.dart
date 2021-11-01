part of 'favorite_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class InitiateFavoriteButton extends FavoriteEvent {
  @override
  List<Object> get props => [];
}

class AddQuoteToFavorites extends FavoriteEvent {
  @override
  List<Object> get props => [];
}

class RemoveQuoteToFavorites extends FavoriteEvent {
  @override
  List<Object> get props => [];
}
