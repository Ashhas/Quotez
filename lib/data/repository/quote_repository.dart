import 'package:hive_flutter/hive_flutter.dart';

import 'package:quotez/data/model/quote.dart';
import 'package:quotez/data/model/quote_response.dart';
import 'package:quotez/network/dio_client.dart';
import 'package:quotez/utils/constants/var_const.dart';

class QuoteRepository {
  final DioClient _dioClient = DioClient();

  // Fetch random quote from API
  Future<QuoteResponse> getRandomQuote() async {
    return await _dioClient.getRandomQuote();
  }

  // Get all saved Quotes from local database
  Future<List<Quote>?> getSavedQuotes() async {
    Box _quotesDb = await Hive.openBox(VarConst.quoteBoxKey);

    if (_quotesDb.values.isNotEmpty) {
      return _quotesDb.values.toList().cast<Quote>();
    } else {
      return null;
    }
  }

  // Save Quote in local database
  Future<void> saveQuote(Quote? quote) async {
    Box _quotesDb = await Hive.openBox(VarConst.quoteBoxKey);
    _quotesDb.add(quote);
  }

  // Remove Quote from local database
  Future<void> removeQuote(Quote? quote) async {
    if (quote != null) {
      quote.delete();
    }
  }

  // Remove All Quotes from local database
  Future<void> removeAllQuotes() async {
    Box _quotesDb = await Hive.openBox(VarConst.quoteBoxKey);
    _quotesDb.clear();
  }
}
