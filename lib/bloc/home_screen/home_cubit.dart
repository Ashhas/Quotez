import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quotez/data/model/quote.dart';
import 'package:quotez/data/model/quote_response.dart';
import 'package:quotez/data/repository/quote_repository.dart';
import 'package:quotez/ui/home/home_screen.dart';
import 'package:quotez/utils/constants/ui_const.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'home_state.dart';

/// Bloc that maps the states and event of the [HomeScreen].
/// This Bloc handles quote requests, share events & connectivity states
class HomeCubit extends Cubit<HomeState> {
  QuoteRepository quoteRepository;

  HomeCubit({required this.quoteRepository}) : super(HomeInit());

  /// [getRandomQuote] Returns a random quote
  void getRandomQuote() async {
    emit(HomeLoading());

    final newRandomQuote = await quoteRepository.getRandomQuote();

    // Check based on QuoteResponse
    if (newRandomQuote is SuccessResponse) {
      log(UiConst.quoteRequestError);
      emit(HomeLoaded(randomQuote: newRandomQuote.newQuote));
    } else if (newRandomQuote is ErrorResponse) {
      log(UiConst.generalError);
      emit(HomeRequestFailed());
    }
  }

  //Check to see if the HomeScreen can be reloaded based on network status
  /// [reloadHome]
  void reloadHome() async {
    //Connectivity check
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      emit(ReloadedHome());
    } else {
      emit(HomeNoNetwork());
    }
  }
}
