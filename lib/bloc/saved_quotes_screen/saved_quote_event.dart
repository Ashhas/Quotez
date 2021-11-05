part of 'saved_quote_bloc.dart';

abstract class SavedQuoteEvent extends Equatable {
  const SavedQuoteEvent();
}

class GetAllSavedQuotes extends SavedQuoteEvent {
  @override
  List<Object> get props => [];
}
