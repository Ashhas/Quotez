import 'package:quotez/data/model/quote.dart';
import 'package:quotez/data/model/quote_response.dart';
import 'package:quotez/network/dio_client.dart';
import 'package:hive_flutter/hive_flutter.dart';

class QuoteRepository {
  final DioClient _dioClient = DioClient();

  Future<QuoteResponse> getRandomQuote() async {
    return await _dioClient.getRandomQuote();
  }

  Future<List<Quote>?> getSavedQuotes() async {
    Box _quotesDb = await Hive.openBox('quotesBox');

    if (_quotesDb.values.isNotEmpty) {
      return _quotesDb.values.toList().cast<Quote>();
    } else {
      return null;
    }
  }

  Future<void> saveQuote(Quote? quote) async {
    print(quote!.quote);
    Box _quotesDb = await Hive.openBox('quotesBox');
    _quotesDb.add(quote);
  }

  Future<void> removeQuote(Quote? quote) async {
    if (quote != null) {
      quote.delete();
    }
  }
}
