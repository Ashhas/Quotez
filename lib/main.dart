import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotez/bloc/home_screen/favorite_button/favorite_bloc.dart';
import 'package:quotez/bloc/home_screen/home_bloc.dart';
import 'package:quotez/bloc/home_screen/load_quote_button/quote_button_bloc.dart';
import 'package:quotez/bloc/simple_bloc_observer.dart';
import 'package:quotez/data/repository/quote_repository.dart';
import 'package:quotez/ui/home.dart';
import 'package:quotez/ui/saved_quotes_screen.dart';
import 'package:quotez/utils/constants/theme_const.dart';
import 'package:quotez/utils/constants/ui_const.dart';

void main() {
  //Initialize Bloc Observer
  Bloc.observer = SimpleBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final QuoteRepository quoteRepository = QuoteRepository();

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<QuoteRepository>(
            create: (context) => quoteRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeBloc(
              quoteRepository: quoteRepository,
            ),
          ),
          BlocProvider(
            create: (context) => QuoteButtonBloc(
              homeBloc: BlocProvider.of<HomeBloc>(context),
            ),
          ),
          BlocProvider(
            create: (context) => FavoriteBloc(),
          )
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: AppTheme.getDefaultTheme(),
          initialRoute: UiConst.homeScreenRoute,
          routes: {
            UiConst.homeScreenRoute: (context) => HomeScreen(),
            UiConst.savedQuotesScreenRoute: (context) => SavedQuotesScreen(),
          },
        ),
      ),
    );
  }
}
