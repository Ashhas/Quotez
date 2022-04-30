import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:quotez/data/model/quote.dart';
import 'package:quotez/data/model/quote_response.dart';
import 'package:quotez/utils/constants/var_const.dart';

class DioClient {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: VarConst.quoteApiUrl,
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ),
  );

  Future<QuoteResponse> getRandomQuote() async {
    try {
      Response randomQuote = await _dio.get(VarConst.quoteApiEndpointRandom);
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
