import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'network_connectivity_state.dart';

///Bloc listens to changes in the network connectivity
///Based on the [ConnectivityResult], the state will be update or changed
class NetworkConnectivityCubit extends Cubit<NetworkConnectivityState> {
  NetworkConnectivityCubit() : super(InitialNetworkConnectionState()) {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      updateNetworkConnection(result);
    });
  }

  void updateNetworkConnection(ConnectivityResult result) {
    if (result == ConnectivityResult.none) {
      emit(NoNetworkConnectionState(connectivityResult: result));
    } else if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      emit(NetworkConnectionUpdatedState(connectivityResult: result));
    }
  }
}
