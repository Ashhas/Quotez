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
    Quote? quote;

    try {
      Response randomQuote = await _dio.get('/random.json');

      quote = Quote.fromJson(randomQuote.data);
    } on DioError catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }

    return quote;
  }
}
