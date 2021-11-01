import 'package:quotez/data/model/quote.dart';
import 'package:quotez/network/dio_client.dart';

class QuoteRepository {
  final DioClient _dioClient = DioClient();

  Future<Quote?> getRandomQuote() async {
    return await _dioClient.getRandomQuote();
  }
}
