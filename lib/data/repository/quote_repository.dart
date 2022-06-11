import 'package:hive_flutter/hive_flutter.dart';

import 'package:quotez/data/model/quote.dart';
import 'package:quotez/data/model/quote_response.dart';
import 'package:quotez/network/api_client.dart';
import 'package:quotez/utils/constants.dart';

class QuoteRepository {
  final ApiClient _apiClient = ApiClient();

  /// Fetch random quote from API.
  Future<QuoteResponse> getRandomQuote() async {
    return await _apiClient.getRandomQuote();
  }

  /// Get all saved Quotes from local database.
  Future<List<Quote>?> getSavedQuotes() async {
    Box _quotesDb = await Hive.openBox(Constants.quoteBoxKey);

    return _quotesDb.values.isNotEmpty
        ? _quotesDb.values.toList().cast<Quote>()
        : null;
  }

  /// Save Quote in local database.
  Future<void> saveQuote(Quote? quote) async {
    Box _quotesDb = await Hive.openBox(Constants.quoteBoxKey);
    _quotesDb.add(quote);
  }

  /// Remove Quote from local database.
  Future<void> removeQuote(Quote? quote) async {
    if (quote != null) {
      quote.delete();
    }
  }

  /// Remove All Quotes from local database.
  Future<void> removeAllQuotes() async {
    Box _quotesDb = await Hive.openBox(Constants.quoteBoxKey);
    _quotesDb.clear();
  }
}
