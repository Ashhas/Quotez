import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:quotez/data/model/quote.dart';
import 'package:quotez/data/model/quote_response.dart';

class DioClient {
  static const _quoteApiUrl = "http://quotes.stormconsultancy.co.uk";
  static const _quoteApiEndpointRandom = "/random.json";

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: _quoteApiUrl,
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ),
  );

  Future<QuoteResponse> getRandomQuote() async {
    try {
      Response randomQuote = await _dio.get(_quoteApiEndpointRandom);
      final newQuote = Quote.fromJson(randomQuote.data);

      return SuccessResponse(newQuote);
    } on DioError catch (e) {
      switch (e.type) {
        case DioErrorType.response:
          log('Dio Error Type: ${e.type.toString()}');
          log('STATUS: ${e.response?.statusCode}');
          log('DATA: ${e.response?.data}');
          log('HEADERS: ${e.response?.headers}');
          return ErrorResponse(e.message);

        default:
          log('Dio Error Type: ${e.type.toString()}');
          return ErrorResponse(e.message);
      }
    }
  }
}
