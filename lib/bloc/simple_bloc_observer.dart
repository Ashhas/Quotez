import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    logMessage('onEvent', event!);
  }

  @override
  void onError(BlocBase blocBase, Object error, StackTrace stackTrace) {
    super.onError(blocBase, error, stackTrace);
    logMessage('onError', error);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    logMessage('onTransition',
        'currentState=${transition.currentState}\n\tnextState=${transition.nextState}');
  }

  void logMessage(String name, Object msg) {
    log('===== ${DateFormat("HH:mm:ss-dd MMM, yyyy").format(DateTime.now())}: $name\n\t$msg');
  }
}
