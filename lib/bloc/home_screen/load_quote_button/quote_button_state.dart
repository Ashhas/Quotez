part of 'quote_button_cubit.dart';

@immutable
abstract class QuoteButtonState extends Equatable {
  const QuoteButtonState();
}

class QuoteButtonPressed extends QuoteButtonState {
  @override
  List<Object> get props => [];
}

class QuoteButtonStandby extends QuoteButtonState {
  @override
  List<String> get props => [];
}
