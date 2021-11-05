import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quotez/bloc/home_screen/favorite_button/favorite_bloc.dart';
import 'package:quotez/bloc/home_screen/home_bloc.dart';
import 'package:quotez/bloc/home_screen/load_quote_button/quote_button_bloc.dart';
import 'package:quotez/bloc/simple_bloc_observer.dart';
import 'package:quotez/data/model/quote.dart';
import 'package:quotez/data/repository/quote_repository.dart';
import 'package:quotez/ui/home.dart';
import 'package:quotez/ui/saved_quotes_screen.dart';
import 'package:quotez/utils/constants/theme_const.dart';
import 'package:quotez/utils/constants/ui_const.dart';

import 'bloc/saved_quotes_screen/saved_quote_bloc.dart';

void main() {
  //Check for platform channels
  WidgetsFlutterBinding.ensureInitialized();

  //Initialize Bloc Observer
  Bloc.observer = SimpleBlocObserver();

  //Initializing Hive DB
  Hive.initFlutter();

  //Register Adapter to conver Quote Objects
  Hive.registerAdapter(QuoteAdapter());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final QuoteRepository quoteRepository = QuoteRepository();

    return RepositoryProvider(
      create: (context) => quoteRepository,
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<QuoteRepository>(
              create: (context) => quoteRepository),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => HomeBloc(
                quoteRepository:
                    RepositoryProvider.of<QuoteRepository>(context),
              ),
            ),
            BlocProvider(
              lazy: false,
              create: (context) => QuoteButtonBloc(
                homeBloc: BlocProvider.of<HomeBloc>(context),
              ),
            ),
            BlocProvider(
              create: (context) => FavoriteBloc(
                  quoteRepository:
                      RepositoryProvider.of<QuoteRepository>(context)),
            ),
            BlocProvider(
              create: (context) => SavedQuotesBloc(
                quoteRepository:
                    RepositoryProvider.of<QuoteRepository>(context),
              ),
            ),
          ],
          child: MaterialApp(
            title: UiConst.appName,
            theme: AppTheme.getDefaultTheme(),
            initialRoute: UiConst.homeScreenRoute,
            routes: {
              UiConst.homeScreenRoute: (context) => HomeScreen(),
              UiConst.savedQuotesScreenRoute: (context) => SavedQuotesScreen(),
            },
          ),
        ),
      ),
    );
  }
}
