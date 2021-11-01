import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quotez/bloc/home_screen/home_bloc.dart';

part 'quote_button_event.dart';

part 'quote_button_state.dart';

class QuoteButtonBloc extends Bloc<QuoteButtonEvent, QuoteButtonState> {
  late HomeBloc homeBloc;
  late StreamSubscription subscription;

  QuoteButtonBloc({required this.homeBloc}) : super(QuoteButtonStandby()) {
    subscription = homeBloc.stream.listen((state) {
      if (state is HomeLoading) {
        _setButtonLoadingState();
      } else if (state is HomeLoaded) {
        _setButtonStandbyState();
      }
    });
  }

  @override
  Stream<QuoteButtonState> mapEventToState(QuoteButtonEvent event) async* {}

  Stream<QuoteButtonState> _setButtonLoadingState() async* {
    yield QuoteButtonPressed();
  }

  Stream<QuoteButtonState> _setButtonStandbyState() async* {
    yield QuoteButtonStandby();
  }
}
