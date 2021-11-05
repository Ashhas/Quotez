part of 'saved_quote_bloc.dart';

abstract class SavedQuoteEvent extends Equatable {
  const SavedQuoteEvent();
}

class GetAllSavedQuotes extends SavedQuoteEvent {
  @override
  List<Object> get props => [];
}

class ShareSavedQuote extends SavedQuoteEvent {
  final Quote savedQuote;

  const ShareSavedQuote({required this.savedQuote});

  @override
  List<Object> get props => [];
}
