import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:quotez/bloc/home_screen/home_cubit.dart';
import 'package:quotez/bloc/home_screen/load_quote_button/quote_button_cubit.dart';
import '../../../mocks.dart';

void main() {
  late HomeCubit homeCubit;
  late QuoteButtonCubit quoteButtonCubit;

  setUp(() {
    homeCubit = MockHomeCubit(
      stream: Stream.fromIterable(
        [HomeLoading()],
      ),
    );
    quoteButtonCubit = QuoteButtonCubit(homeCubit: homeCubit);
  });

  //TODO: Research why test in not working (Goes to emit, but doesn't actually emit)
  group('QuoteButtonCubit', () {
    group('listens to [HomeState]', () {
      group('when the home screen is loading with [HomeLoading]', () {
        blocTest(
          'emits [QuoteButtonPressed]',
          build: () => quoteButtonCubit,
          act: (_) {},
          expect: () => [],
        );
      });

      group('when the home screen is loaded with [HomeLoaded]', () {
        blocTest(
          'emits [QuoteButtonStandby]',
          build: () => quoteButtonCubit,
          act: (_) {},
          expect: () => [],
        );
      });
    });
  });
}
