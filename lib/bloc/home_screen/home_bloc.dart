import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quotez/data/model/quote.dart';
import 'package:quotez/data/repository/quote_repository.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  QuoteRepository quoteRepository = QuoteRepository();

  HomeBloc({required this.quoteRepository}) : super(HomeInit());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is GetRandomQuote) {
      yield* _mapGetRandomQuoteToState(state);
    }
  }

  Stream<HomeState> _mapGetRandomQuoteToState(HomeState state) async* {
    yield HomeLoading();

    Quote? newRandomQuote = await quoteRepository.getRandomQuote();

    yield HomeLoaded(randomQuote: newRandomQuote);
  }
}
