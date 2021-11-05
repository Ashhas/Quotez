import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'network_connectivity_event.dart';

part 'network_connectivity_state.dart';

class NetworkConnectionBloc
    extends Bloc<NetworkConnectionEvent, NetworkConnectionState> {
  StreamController<ConnectivityResult> connectionStatusController =
      StreamController<ConnectivityResult>();

  NetworkConnectionBloc() : super(InitialNetworkConnectionState()) {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      add(UpdateNetworkConnectionFromStream(connectivityResult: result));
    });
  }

  @override
  Stream<NetworkConnectionState> mapEventToState(
      NetworkConnectionEvent event) async* {
    if (event is UpdateNetworkConnection) {
      yield* _mapUpdateNetworkConnectionToState(event);
    } else if (event is UpdateNetworkConnectionFromStream) {
      yield* _mapUpdateNetworkConnectionFromStreamToState(event);
    }
  }

  Stream<NetworkConnectionState> _mapUpdateNetworkConnectionToState(
      UpdateNetworkConnection event) async* {
    yield CheckingNetworkConnectionState();

    //Network
    var connectivityResult = await (Connectivity().checkConnectivity());
    print("Bloc Result: " + connectivityResult.toString());

    if (connectivityResult == ConnectivityResult.none) {
      yield NoNetworkConnectionState(
        connectivityResult: connectivityResult,
      );
    } else if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      yield NetworkConnectionUpdatedState(
        connectivityResult: connectivityResult,
      );
    }
  }

  Stream<NetworkConnectionState> _mapUpdateNetworkConnectionFromStreamToState(
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

  @override
  Future<void> close() {
    connectionStatusController.close();
    return super.close();
  }
}
