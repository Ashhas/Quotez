part of 'home_cubit.dart';

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

class HomeRequestFailed extends HomeState {
  @override
  List<String> get props => [];
}

class HomeLoaded extends HomeState {
  final Quote? randomQuote;

  const HomeLoaded({required this.randomQuote});

  @override
  List<String> get props => [];
}

class HomeNoNetwork extends HomeState {
  @override
  List<Object> get props => [];
}
