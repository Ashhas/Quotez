import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:quotez/data/model/quote.dart';
import 'package:quotez/ui/splash/splash_screen.dart';

part 'initialization_event.dart';

part 'initialization_state.dart';

///Bloc that initializes Hive db & does initial network check
///This Bloc executes during the [SplashScreen] and determines when to show a no network screen
class InitializationBloc
    extends Bloc<InitializationEvent, InitializationState> {
  InitializationBloc() : super(InitialState());

  @override
  Stream<InitializationState> mapEventToState(
      InitializationEvent event) async* {
    if (event is InitializeApp) {
      yield* _mapAppStartedEventToState();
    } else if (event is ReloadWithNetwork) {
      yield* _mapReloadWithNetworkToState();
    }
  }

  Stream<InitializationState> _mapAppStartedEventToState() async* {
    //Delay for Splash Screen
    await Future.delayed(const Duration(seconds: 1));

    //Initializing Hive DB
    Hive.initFlutter();

    //Register Adapter to convert Quote Objects
    Hive.registerAdapter(QuoteAdapter());

    //Connectivity check
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      yield InitializedState();
    } else {
      yield NoNetworkOnStartup();
    }
  }

  Stream<InitializationState> _mapReloadWithNetworkToState() async* {
    //Connectivity check
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      yield InitializedState();
    } else {
      yield NoNetworkOnStartup();
    }
  }
}
