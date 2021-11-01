part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInit extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoading extends HomeState {
  @override
  List<String> get props => [];
}

class HomeLoaded extends HomeState {
  @override
  List<String> get props => [];
}

class HomeError extends HomeState {
  @override
  List<Object> get props => [];
}
