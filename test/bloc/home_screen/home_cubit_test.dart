import 'package:bloc_test/bloc_test.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:quotez/bloc/home_screen/home_cubit.dart';
import 'package:quotez/bloc/network_connectivity/network_connectivity_cubit.dart';
import 'package:quotez/data/model/quote.dart';
import 'package:quotez/data/model/quote_response.dart';
import 'package:quotez/data/repository/quote_repository.dart';
import '../../mocks.dart';

void main() {
  late HomeCubit homeCubit;
  late QuoteRepository quoteRepository;
  late NetworkConnectivityCubit networkConnectivityCubit;
  Quote testQuote = Quote(
    author: "author",
    id: 0,
    value: "value",
    permalink: "permalink",
  );
  QuoteResponse quoteSuccessResponse = SuccessResponse(testQuote);
  QuoteResponse quoteErrorResponse = ErrorResponse('error');

  group('HomeCubit', () {
    group('Calls homeCubit.getRandomQuote', () {
      group('Success response', () {
        setUp(() {
          quoteRepository = MockQuoteRepository();
          networkConnectivityCubit = MockNetworkCubit(
            stream: Stream.fromIterable(
              [
                NetworkConnectionUpdatedState(
                  connectivityResult: ConnectivityResult.wifi,
                ),
              ],
            ),
          );
          homeCubit = HomeCubit(
            quoteRepository: quoteRepository,
            networkCubit: networkConnectivityCubit,
          );

          when(() => quoteRepository.getRandomQuote()).thenAnswer(
            (_) => Future.value(quoteSuccessResponse),
          );
        });

        blocTest(
          'and emits [HomeLoaded] when successfully fetching a new quote',
          build: () => homeCubit,
          act: (HomeCubit cubit) {
            cubit.getRandomQuote();
          },
          expect: () => [
            HomeLoading(),
            HomeLoaded(randomQuote: testQuote),
          ],
        );
      });

      group('Failed response', () {
        setUp(() {
          quoteRepository = MockQuoteRepository();
          networkConnectivityCubit = MockNetworkCubit(
            stream: Stream.fromIterable(
              [
                NetworkConnectionUpdatedState(
                  connectivityResult: ConnectivityResult.wifi,
                ),
              ],
            ),
          );
          homeCubit = HomeCubit(
            quoteRepository: quoteRepository,
            networkCubit: networkConnectivityCubit,
          );

          when(() => quoteRepository.getRandomQuote()).thenAnswer(
            (_) => Future.value(quoteErrorResponse),
          );
        });

        blocTest(
          'and emits [HomeRequestFailed] when unsuccessfully fetching a new quote',
          build: () => homeCubit,
          act: (HomeCubit cubit) {
            cubit.getRandomQuote();
          },
          expect: () => [
            HomeLoading(),
            HomeRequestFailed(),
          ],
        );
      });
    });
  });
}
