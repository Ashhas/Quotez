import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quotez/bloc/home_screen/bookmark_button/bookmark_cubit.dart';
import 'package:quotez/bloc/home_screen/home_cubit.dart';
import 'package:quotez/bloc/home_screen/load_quote_button/quote_button_cubit.dart';
import 'package:quotez/bloc/initialization/initialization_cubit.dart';
import 'package:quotez/bloc/network_connectivity/network_connectivity_cubit.dart';
import 'package:quotez/bloc/saved_quotes_screen/saved_quote_cubit.dart';
import 'package:quotez/data/repository/quote_repository.dart';
import 'package:quotez/ui/home/home_screen.dart';
import 'package:quotez/ui/home/widgets/home_no_network_widget.dart';
import 'package:quotez/ui/saved_quotes/saved_quotes_screen.dart';
import 'package:quotez/ui/splash/splash_screen.dart';
import 'package:quotez/utils/constants/theme_const.dart';
import 'package:quotez/utils/constants/ui_const.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //   SystemUiOverlayStyle(
    //     statusBarColor: Theme.of(context).backgroundColor,
    //     systemNavigationBarColor: Theme.of(context).backgroundColor,
    //     statusBarIconBrightness: Theme.of(context).brightness,
    //     statusBarBrightness: Theme.of(context).brightness,
    //   ),
    // );

    final QuoteRepository quoteRepository = QuoteRepository();

    return RepositoryProvider(
      create: (context) => quoteRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<InitializationCubit>(
            lazy: false,
            create: (context) => InitializationCubit(),
          ),
          BlocProvider(
            lazy: false,
            create: (context) => NetworkConnectivityCubit(),
          ),
          BlocProvider(
            create: (context) => HomeCubit(
              networkCubit: BlocProvider.of<NetworkConnectivityCubit>(context),
              quoteRepository: RepositoryProvider.of<QuoteRepository>(context),
            ),
          ),
          BlocProvider(
            create: (context) => SavedQuotesCubit(
              quoteRepository: RepositoryProvider.of<QuoteRepository>(context),
            ),
          ),
          BlocProvider(
            lazy: false,
            create: (context) => QuoteButtonCubit(
              homeCubit: BlocProvider.of<HomeCubit>(context),
            ),
          ),
          BlocProvider(
            create: (context) => BookmarkButtonCubit(
              quoteRepository: RepositoryProvider.of<QuoteRepository>(context),
            ),
          ),
        ],
        child: MaterialApp(
          title: UiConst.appName,
          theme: AppTheme.getDefaultTheme(),
          initialRoute: UiConst.splashScreenRoute,
          routes: {
            UiConst.splashScreenRoute: (context) => const SplashScreen(),
            UiConst.homeScreenRoute: (context) => const HomeScreen(),
            UiConst.savedQuotesScreenRoute: (context) =>
                const SavedQuotesScreen(),
            UiConst.homeNoNetworkWidgetRoute: (context) =>
                const HomeNoNetworkWidget(),
          },
        ),
      ),
    );
  }
}
