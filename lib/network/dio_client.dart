import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:quotez/data/model/quote.dart';

class DioClient {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://quotes.stormconsultancy.co.uk',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ),
  );

  Future<Quote?> getRandomQuote() async {
    Quote? newQuote;

    try {
      Response randomQuote = await _dio.get('/random.json');

      newQuote = Quote.fromJson(randomQuote.data);
    } on DioError catch (e) {
      if (e.response != null) {
        log('Dio error!');
        log('STATUS: ${e.response?.statusCode}');
        log('DATA: ${e.response?.data}');
        log('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        log('Error sending request!');
        log(e.message);
      }
    }

    return newQuote;
  }
}
