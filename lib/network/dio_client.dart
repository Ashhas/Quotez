import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:quotez/data/model/quote.dart';
import 'package:quotez/data/model/quote_response.dart';

class DioClient {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://quotes.stormconsultancy.co.uk',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ),
  );

  Future<QuoteResponse> getRandomQuote() async {
    try {
      Response randomQuote = await _dio.get('/random.json');
      var newQuote = Quote.fromJson(randomQuote.data);

      return SuccesResponse(newQuote);
    } on DioError catch (e) {
      switch (e.type) {
        case DioErrorType.connectTimeout:
          log('Dio Error Type: ${e.type.toString()}');
          return ErrorResponse(e.message);

        case DioErrorType.sendTimeout:
          log('Dio Error Type: ${e.type.toString()}');
          return ErrorResponse(e.message);

        case DioErrorType.receiveTimeout:
          log('Dio Error Type: ${e.type.toString()}');
          return ErrorResponse(e.message);

        case DioErrorType.response:
          log('Dio Error Type: ${e.type.toString()}');
          log('STATUS: ${e.response?.statusCode}');
          log('DATA: ${e.response?.data}');
          log('HEADERS: ${e.response?.headers}');
          return ErrorResponse(e.message);

        case DioErrorType.cancel:
          log('Dio Error Type: ${e.type.toString()}');
          return ErrorResponse(e.message);

        case DioErrorType.other:
          log('Dio Error Type: ${e.type.toString()}');
          return ErrorResponse(e.message);
      }
    }
  }
}
