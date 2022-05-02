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
  late QuoteRepository quoteRepository;
  late NetworkConnectivityCubit networkConnectedCubit, networkNotConnectedCubit;
  Quote testQuote = Quote(
    author: "author",
    id: 0,
    value: "value",
    permalink: "permalink",
  );
  QuoteResponse quoteSuccessResponse = SuccessResponse(testQuote);
  QuoteResponse quoteErrorResponse = ErrorResponse('error');

  setUp(() {
    quoteRepository = MockQuoteRepository();
    networkConnectedCubit = MockNetworkCubit(
      stream: Stream.fromIterable(
        [
          NetworkConnectionUpdatedState(
            connectivityResult: ConnectivityResult.wifi,
          ),
        ],
      ),
    );

    networkNotConnectedCubit = MockNetworkCubit(
      stream: Stream.fromIterable(
        [
          NoNetworkConnectionState(
            connectivityResult: ConnectivityResult.none,
          ),
        ],
      ),
    );
  });

  group('HomeCubit', () {
    group('listens to [NetworkConnectivityState]', () {
      group('when [NoNetworkConnectionState]', () {
        blocTest(
          'emits [HomeNoNetwork]',
          build: () => HomeCubit(
            quoteRepository: quoteRepository,
            networkCubit: networkNotConnectedCubit,
          ),
          act: (_) {},
          expect: () => [HomeNoNetwork()],
        );
      });
    });
    group('Calls homeCubit.getRandomQuote', () {
      group('Success response', () {
        setUp(() {
          when(() => quoteRepository.getRandomQuote()).thenAnswer(
            (_) => Future.value(quoteSuccessResponse),
          );
        });

        blocTest(
          'and emits [HomeLoaded] when successfully fetching a new quote',
          build: () => HomeCubit(
            quoteRepository: quoteRepository,
            networkCubit: networkConnectedCubit,
          ),
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
          when(() => quoteRepository.getRandomQuote()).thenAnswer(
            (_) => Future.value(quoteErrorResponse),
          );
        });

        blocTest(
          'and emits [HomeRequestFailed] when unsuccessfully fetching a new quote',
          build: () => HomeCubit(
            quoteRepository: quoteRepository,
            networkCubit: networkConnectedCubit,
          ),
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
