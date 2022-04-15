import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quotez/bloc/home_screen/favorite_button/favorite_cubit.dart';
import 'package:quotez/bloc/home_screen/home_cubit.dart';
import 'package:quotez/bloc/home_screen/load_quote_button/quote_button_cubit.dart';
import 'package:quotez/bloc/network_connectivity/network_connectivity_cubit.dart';
import 'package:quotez/bloc/simple_bloc_observer.dart';
import 'package:quotez/data/repository/quote_repository.dart';
import 'package:quotez/ui/home/home_screen.dart';
import 'package:quotez/ui/home/widgets/home_no_network_widget.dart';
import 'package:quotez/ui/saved_quotes/saved_quotes_screen.dart';
import 'package:quotez/ui/splash/splash_screen.dart';
import 'package:quotez/utils/constants/theme_const.dart';
import 'package:quotez/utils/constants/ui_const.dart';
import 'bloc/initialization/initialization_cubit.dart';
import 'bloc/saved_quotes_screen/saved_quote_cubit.dart';

void main() {
  //Check for platform channels
  WidgetsFlutterBinding.ensureInitialized();

  BlocOverrides.runZoned(
    () => runApp(const App()),
    blocObserver: SimpleBlocObserver(),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            create: (context) => FavoriteButtonCubit(
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
