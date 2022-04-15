part of 'favorite_cubit.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();
}

class FavoriteUnpressed extends FavoriteState {
  @override
  List<Object> get props => [];
}

class FavoritePressed extends FavoriteState {
  @override
  List<Object> get props => [];
}
