import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:quotez/data/model/quote.dart';
import 'package:quotez/data/model/quote_response.dart';

/// [ApiClient] handles all API requests.
class ApiClient {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://quotes.stormconsultancy.co.uk',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ),
  );

  Future<QuoteResponse> getRandomQuote() async {
    try {
      final response = await _dio.get('/random.json');
      final randomQuote = Quote.fromJson(response.data);

      return SuccessResponse(randomQuote);
    } on DioError catch (e) {
      switch (e.type) {
        case DioErrorType.response:
          log('ERROR TYPE: ${e.type.toString()}');
          log('STATUS: ${e.response?.statusCode}');
          log('DATA: ${e.response?.data}');
          log('HEADERS: ${e.response?.headers}');
          return ErrorResponse(e.message);

        default:
          log('ERROR TYPE: ${e.type.toString()}');
          return ErrorResponse(e.message);
      }
    }
  }
}
