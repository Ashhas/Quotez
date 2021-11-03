import 'package:quotez/data/model/quote.dart';

abstract class QuoteResponse {
  final Quote? newQuote;
  final String? message;

  QuoteResponse(this.newQuote, this.message);
}

class SuccesResponse extends QuoteResponse {
  SuccesResponse(Quote? newQuote) : super(newQuote, null);
}

class ErrorResponse extends QuoteResponse {
  ErrorResponse(String message) : super(null, message);
}
