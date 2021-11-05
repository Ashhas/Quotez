part of 'quote_button_bloc.dart';

abstract class QuoteButtonEvent extends Equatable {
  const QuoteButtonEvent();
}

class AnimateQuoteButton extends QuoteButtonEvent {
  @override
  List<Object> get props => [];
}

class StopQuoteButtonAnimation extends QuoteButtonEvent {
  @override
  List<Object> get props => [];
}
