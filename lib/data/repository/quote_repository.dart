import 'package:quotez/data/model/quote_response.dart';
import 'package:quotez/network/dio_client.dart';

class QuoteRepository {
  final DioClient _dioClient = DioClient();

  Future<QuoteResponse> getRandomQuote() async {
    return await _dioClient.getRandomQuote();
  }
}
