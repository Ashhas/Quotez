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

class ResetFavoriteButton extends FavoriteEvent {
  @override
  List<Object> get props => [];
}

class AddQuoteToFavorites extends FavoriteEvent {
  final Quote? newQuote;

  const AddQuoteToFavorites({required this.newQuote});

  @override
  List<Object> get props => [];
}

class RemoveQuoteToFavorites extends FavoriteEvent {
  final Quote? quote;

  const RemoveQuoteToFavorites({required this.quote});

  @override
  List<Object> get props => [];
}
