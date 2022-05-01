import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:quotez/bloc/home_screen/bookmark_button/bookmark_cubit.dart';
import 'package:quotez/data/model/quote.dart';
import 'package:quotez/data/repository/quote_repository.dart';
import '../../../mocks.dart';

void main() {
  late QuoteRepository quoteRepository;
  late BookmarkButtonCubit bookmarkButtonCubit;
  Quote testQuote = Quote(
    author: "author",
    id: 0,
    value: "value",
    permalink: "permalink",
  );

  setUp(() {
    quoteRepository = MockQuoteRepository();
    bookmarkButtonCubit = BookmarkButtonCubit(quoteRepository: quoteRepository);
  });

  group('BookmarkButtonCubit', () {
    blocTest(
      'calls bookmarkButtonCubit.bookmarkQuote and emits [BookmarkPressed] when user presses bookmark button',
      build: () => bookmarkButtonCubit,
      act: (BookmarkButtonCubit cubit) {
        when(() => quoteRepository.saveQuote(testQuote))
            .thenAnswer((_) => Future.value());

        cubit.bookmarkQuote(testQuote);
      },
      expect: () => [BookmarkPressed()],
    );

    blocTest(
      'calls bookmarkButtonCubit.bookmarkQuote and emits [BookmarkNotPressed] when user unpressed the bookmark button',
      build: () => bookmarkButtonCubit,
      act: (BookmarkButtonCubit cubit) {
        when(() => quoteRepository.removeQuote(testQuote))
            .thenAnswer((_) => Future.value());

        cubit.removeBookmarkedQuote(testQuote);
      },
      expect: () => [BookmarkNotPressed()],
    );

    blocTest(
      'calls bookmarkButtonCubit.resetFavoriteButtonState and emits [BookmarkNotPressed]',
      build: () => bookmarkButtonCubit,
      act: (BookmarkButtonCubit cubit) {
        cubit.resetFavoriteButtonState();
      },
      expect: () => [BookmarkNotPressed()],
    );
  });
}
