import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

import 'package:quotez/data/model/quote.dart';
import 'package:quotez/ui/splash/splash_screen.dart';

part 'initialization_state.dart';

///Bloc that initializes Hive db & does initial network check
///This Bloc executes during the [SplashScreen] and determines when to show a no network screen.
class InitializationCubit extends Cubit<InitializationState> {
  InitializationCubit({this.connectivityObject}) : super(InitialState());

  final Connectivity? connectivityObject;

  void startApp() async {
    // Delay for Splash Screen.
    await Future.delayed(const Duration(seconds: 2));

    // Initializing Hive DB.
    Hive.initFlutter();

    // Register Adapter to convert Quote Objects.
    Hive.registerAdapter(QuoteAdapter());

    checkNetworkStatus();
  }

  void reloadStartup() async {
    checkNetworkStatus();
  }

  void checkNetworkStatus() async {
    // Connectivity check
    // We check to make sure if the connectivity really has been restored
    final connectivityResult =
        await (connectivityObject?.checkConnectivity()) ??
            await (Connectivity().checkConnectivity());

    if (connectivityResult != ConnectivityResult.none) {
      emit(InitializedState());
    } else {
      emit(NoNetworkOnStartup());
    }
  }
}
