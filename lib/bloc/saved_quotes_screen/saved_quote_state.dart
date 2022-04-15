part of 'saved_quote_cubit.dart';

abstract class SavedQuoteState extends Equatable {
  const SavedQuoteState();
}

class SavedQuoteInit extends SavedQuoteState {
  @override
  List<Object> get props => [];
}

class LoadingSavedQuotes extends SavedQuoteState {
  @override
  List<Object> get props => [];
}

class NoSavedQuotes extends SavedQuoteState {
  @override
  List<Object> get props => [];
}

class SavedQuotesLoaded extends SavedQuoteState {
  final List<Quote>? savedQuotes;

  const SavedQuotesLoaded(this.savedQuotes);

  @override
  List<Object> get props => [];
}
