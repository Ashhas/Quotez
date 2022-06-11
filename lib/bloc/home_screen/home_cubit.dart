import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:quotez/bloc/network_connectivity/network_connectivity_cubit.dart';
import 'package:quotez/data/model/quote.dart';
import 'package:quotez/data/model/quote_response.dart';
import 'package:quotez/data/repository/quote_repository.dart';
import 'package:quotez/ui/home/home_screen.dart';
import 'package:quotez/utils/ui_strings.dart';

part 'home_state.dart';

/// [HomeCubit] handles quote requests shown in the [HomeScreen]
/// Also listens to connectivity states from [NetworkConnectivityCubit]
class HomeCubit extends Cubit<HomeState> {
  final QuoteRepository quoteRepository;
  final NetworkConnectivityCubit networkCubit;
  StreamSubscription? networkCubitSubscription;

  HomeCubit({required this.quoteRepository, required this.networkCubit})
      : super(HomeInit()) {
    networkCubitSubscription = networkCubit.stream.listen((networkState) {
      if (networkState is NoNetworkConnectionState) {
        emit(HomeNoNetwork());
      } else if (networkState is NetworkConnectionUpdatedState) {
        getRandomQuote();
      }
    });
  }

  /// [getRandomQuote] Returns a random quote.
  void getRandomQuote() async {
    emit(HomeLoading());

    final newRandomQuote = await quoteRepository.getRandomQuote();

    // Check based on QuoteResponse.
    if (newRandomQuote is SuccessResponse) {
      log(UiStrings.quoteRequestError);
      emit(HomeLoaded(randomQuote: newRandomQuote.newQuote));
    } else if (newRandomQuote is ErrorResponse) {
      log(UiStrings.generalError);
      emit(HomeRequestFailed());
    }
  }
}
