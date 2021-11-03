import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quotez/data/model/quote.dart';
import 'package:quotez/data/repository/quote_repository.dart';
import 'package:share_plus/share_plus.dart';

import '../../data/model/quote_response.dart';

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

    //Get Quote Response
    var newRandomQuote = await quoteRepository.getRandomQuote();

    //Check based on QuoteResponse
    if (newRandomQuote is SuccesResponse) {
      log("Successfully received a new quote");
      yield HomeLoaded(randomQuote: newRandomQuote.newQuote);
    } else if (newRandomQuote is ErrorResponse) {
      log("There has been an error");
      yield HomeLoaded(randomQuote: newRandomQuote.newQuote);
    }
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
