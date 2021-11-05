part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class GetRandomQuote extends HomeEvent {
  @override
  List<Object> get props => [];
}

class ShareQuote extends HomeEvent {
  final Quote? shareQuote;

  const ShareQuote({required this.shareQuote});

  @override
  List<Object> get props => [];
}

class NoNetworkRequest extends HomeEvent {
  @override
  List<Object> get props => [];
}

class ReloadHome extends HomeEvent {
  @override
  List<Object> get props => [];
}
