import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'network_connectivity_event.dart';

part 'network_connectivity_state.dart';

///Bloc listens to changes in the network connectivity
///Based on the [ConnectivityResult], the state will be update or changed
class NetworkConnectivityBloc
    extends Bloc<NetworkConnectivityEvent, NetworkConnectivityState> {
  NetworkConnectivityBloc() : super(InitialNetworkConnectionState()) {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      add(UpdateNetworkConnectionFromStream(connectivityResult: result));
    });
  }

  @override
  Stream<NetworkConnectivityState> mapEventToState(
      NetworkConnectivityEvent event) async* {
    if (event is UpdateNetworkConnectionFromStream) {
      yield* _mapUpdateNetworkConnectionFromStreamToState(event);
    }
  }

  Stream<NetworkConnectivityState> _mapUpdateNetworkConnectionFromStreamToState(
      UpdateNetworkConnectionFromStream event) async* {
    if (event.connectivityResult == ConnectivityResult.none) {
      yield NoNetworkConnectionState(
        connectivityResult: event.connectivityResult,
      );
    } else if (event.connectivityResult == ConnectivityResult.mobile ||
        event.connectivityResult == ConnectivityResult.wifi) {
      yield NetworkConnectionUpdatedState(
        connectivityResult: event.connectivityResult,
      );
    }
  }
}
