import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:quotez/bloc/home_screen/home_cubit.dart';
import 'package:quotez/bloc/home_screen/quote_button/quote_button_cubit.dart';
import 'package:quotez/data/model/quote.dart';
import '../../../mocks.dart';

void main() {
  late HomeCubit homeCubitLoading, homeCubitLoaded;
  final testQuote = Quote(
    id: 0,
    author: 'author',
    value: 'value',
    permalink: 'permalink',
  );

  setUp(() {
    homeCubitLoading = MockHomeCubit(
      stream: Stream.value(
        HomeLoading(),
      ),
    );

    homeCubitLoaded = MockHomeCubit(
      stream: Stream.value(
        HomeLoaded(randomQuote: testQuote),
      ),
    );
  });

  QuoteButtonCubit _createQuoteButtonCubit(HomeCubit cubit) {
    return QuoteButtonCubit(homeCubit: cubit);
  }

  //TODO: Research why test in not working (Goes to emit, but doesn't actually emit)
  group('QuoteButtonCubit', () {
    group('listens to [HomeState]', () {
      group('when the home screen is loading with [HomeLoading]', () {
        blocTest(
          'emits [QuoteButtonPressed]',
          build: () {
            return _createQuoteButtonCubit(homeCubitLoading);
          },
          act: (_) {},
          expect: () => [QuoteButtonPressed()],
        );
      });

      group('when the home screen is loaded with [HomeLoaded]', () {
        blocTest(
          'emits [QuoteButtonStandby]',
          build: () => _createQuoteButtonCubit(homeCubitLoaded),
          act: (_) {},
          expect: () => [QuoteButtonStandby()],
        );
      });
    });
  });
}
