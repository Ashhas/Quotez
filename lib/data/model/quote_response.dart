import 'package:quotez/data/model/quote.dart';

/// Abstract Response class that contains a quote or error message
abstract class QuoteResponse {
  final Quote? newQuote;
  final String? message;

  QuoteResponse(this.newQuote, this.message);
}

// On Success -> return only quote
class SuccessResponse extends QuoteResponse {
  SuccessResponse(Quote? newQuote) : super(newQuote, null);
}

// On Error -> return only an error message
class ErrorResponse extends QuoteResponse {
  ErrorResponse(String message) : super(null, message);
}
