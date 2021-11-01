import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quotez/data/model/quote.dart';
import 'package:quotez/data/repository/quote_repository.dart';
import 'package:share_plus/share_plus.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  QuoteRepository quoteRepository = QuoteRepository();

  HomeBloc({required this.quoteRepository}) : super(HomeInit());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is GetRandomQuote) {
      yield* _mapGetRandomQuoteToState(state);
    } else if (event is ShareQuote) {
      yield* _mapShareQuoteToState(event);
    }
  }

  Stream<HomeState> _mapGetRandomQuoteToState(HomeState state) async* {
    yield HomeLoading();

    Quote? newRandomQuote = await quoteRepository.getRandomQuote();

    yield HomeLoaded(randomQuote: newRandomQuote);
  }

  Stream<HomeState> _mapShareQuoteToState(ShareQuote event) async* {
    if (event.shareQuote != null) {
      Share.share(
          "\"${event.shareQuote!.quote}\"\n - ${event.shareQuote!.author}");
    } else {
      log("No quote loaded yet!");
    }
  }
}
