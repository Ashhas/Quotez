import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInit());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is GetRandomQuote) {
      yield* _mapGetRandomQuoteToState(state);
    }
  }

  Stream<HomeState> _mapGetRandomQuoteToState(HomeState state) async* {
    yield HomeLoading();
    yield HomeLoaded();
  }
}
