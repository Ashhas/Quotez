import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:quotez/bloc/saved_quotes_screen/saved_quote_cubit.dart';
import 'package:quotez/data/model/quote.dart';
import 'package:quotez/data/repository/quote_repository.dart';

class MockQuoteRepository extends Mock implements QuoteRepository {}

void main() {
  late SavedQuotesCubit savedQuotesCubit;
  late QuoteRepository quoteRepository;
  List<Quote> testQuoteList = [
    Quote(author: "author", id: 0, value: "value", permalink: "permalink"),
    Quote(author: "author", id: 1, value: "value", permalink: "permalink")
  ];

  setUp(() {
    quoteRepository = MockQuoteRepository();
    savedQuotesCubit = SavedQuotesCubit(quoteRepository: quoteRepository);
  });

  group('SavedQuoteCubit', () {
    blocTest(
      'calls savedQuotesCubit.getAllSavedQuotes and emits [SavedQuotesLoaded] when there are saved quotes available',
      build: () => savedQuotesCubit,
      act: (SavedQuotesCubit cubit) {
        when(() => quoteRepository.getSavedQuotes()).thenAnswer(
          (_) => Future.value(testQuoteList),
        );

        cubit.getAllSavedQuotes();
      },
      expect: () => [LoadingSavedQuotes(), SavedQuotesLoaded(testQuoteList)],
    );

    blocTest(
      'calls savedQuotesCubit.getAllSavedQuotes and emits [NoSavedQuotes] when there are no quotes available',
      build: () => savedQuotesCubit,
      act: (SavedQuotesCubit cubit) {
        when(() => quoteRepository.getSavedQuotes()).thenAnswer(
          (_) => Future.value(List<Quote>.empty()),
        );

        savedQuotesCubit.getAllSavedQuotes();
      },
      expect: () => [LoadingSavedQuotes(), NoSavedQuotes()],
    );

    blocTest(
      'calls savedQuotesCubit.deleteAllSavedQuotes and emits [NoSavedQuotes] when all quotes are deleted',
      build: () => savedQuotesCubit,
      act: (SavedQuotesCubit cubit) {
        when(() => quoteRepository.removeAllQuotes())
            .thenAnswer((_) => Future.value());

        savedQuotesCubit.deleteAllSavedQuotes();
      },
      expect: () => [NoSavedQuotes()],
    );
  });
}
