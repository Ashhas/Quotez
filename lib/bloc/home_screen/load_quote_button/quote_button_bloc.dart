import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quotez/bloc/home_screen/home_bloc.dart';
import 'package:quotez/ui/home/widgets/quote_button.dart';

part 'quote_button_event.dart';

part 'quote_button_state.dart';

///Bloc that keeps track of the state and events from the [QuoteButton] widget.
///This Bloc listens to [HomeBLoc] and changes states to control the animation in the UI
class QuoteButtonBloc extends Bloc<QuoteButtonEvent, QuoteButtonState> {
  final HomeBloc homeBloc;
  StreamSubscription? homeSubscription;

  QuoteButtonBloc({required this.homeBloc}) : super(QuoteButtonStandby()) {
    homeSubscription = homeBloc.stream.listen((homeState) {
      if (homeState is HomeLoading) {
        add(AnimateQuoteButton());
      } else if (homeState is HomeLoaded) {
        add(StopQuoteButtonAnimation());
      }
    });
  }

  @override
  Stream<QuoteButtonState> mapEventToState(QuoteButtonEvent event) async* {
    if (event is AnimateQuoteButton) {
      yield* _setButtonLoadingState();
    } else if (event is StopQuoteButtonAnimation) {
      yield* _setButtonStandbyState();
    }
  }

  Stream<QuoteButtonState> _setButtonLoadingState() async* {
    yield QuoteButtonPressed();
  }

  Stream<QuoteButtonState> _setButtonStandbyState() async* {
    yield QuoteButtonStandby();
  }
}
