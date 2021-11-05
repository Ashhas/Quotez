import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quotez/data/model/quote.dart';
import 'package:quotez/data/model/quote_response.dart';
import 'package:quotez/data/repository/quote_repository.dart';
import 'package:quotez/ui/home/home.dart';
import 'package:quotez/utils/constants/ui_const.dart';
import 'package:share_plus/share_plus.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'home_event.dart';

part 'home_state.dart';

///Bloc that maps the states and event of the [HomeScreen].
///This Bloc handles quote requests, share events & connectivity states
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  QuoteRepository quoteRepository;

  HomeBloc({required this.quoteRepository}) : super(HomeInit());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is GetRandomQuote) {
      yield* _mapGetRandomQuoteToState(state);
    } else if (event is ShareQuote) {
      yield* _mapShareQuoteToState(event);
    } else if (event is NoNetworkRequest) {
      yield* _mapHomeNoNetworkToState();
    } else if (event is ReloadHome) {
      yield* _mapReloadHomeToState();
    }
  }

  //Do random quote request
  Stream<HomeState> _mapGetRandomQuoteToState(HomeState state) async* {
    yield HomeLoading();

    //Get Quote Response
    var newRandomQuote = await quoteRepository.getRandomQuote();

    //Check based on QuoteResponse
    if (newRandomQuote is SuccesResponse) {
      log(UiConst.quoteRequestError);
      yield HomeLoaded(randomQuote: newRandomQuote.newQuote);
    } else if (newRandomQuote is ErrorResponse) {
      log(UiConst.generalError);
      yield HomeLoaded(randomQuote: newRandomQuote.newQuote);
    }
  }

  //Share current quote
  Stream<HomeState> _mapShareQuoteToState(ShareQuote event) async* {
    if (event.shareQuote != null) {
      Share.share(
          "\"${event.shareQuote!.quote}\"\n - ${event.shareQuote!.author}");
    } else {
      //Log if an error occurs
      log(UiConst.shareError);
    }
  }

  //Handle request when there is no network connectivity
  Stream<HomeState> _mapHomeNoNetworkToState() async* {
    yield HomeNoNetwork();
  }

  //Check to see if the HomeScreen can be reloaded
  Stream<HomeState> _mapReloadHomeToState() async* {
    //Connectivity check
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      yield ReloadedHome();
    } else {
      yield HomeNoNetwork();
    }
  }
}
