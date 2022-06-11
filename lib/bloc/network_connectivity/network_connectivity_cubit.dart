import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'network_connectivity_state.dart';

/// [NetworkConnectivityCubit] listens to changes in the network connectivity
/// Based on the [ConnectivityResult], the state will be update or changed.
class NetworkConnectivityCubit extends Cubit<NetworkConnectivityState> {
  NetworkConnectivityCubit({Connectivity? connectivityObject})
      : connectivityObject = connectivityObject ?? Connectivity(),
        super(InitialNetworkConnectionState()) {
    connectivityObject?.onConnectivityChanged.listen(
      (ConnectivityResult result) {
        updateNetworkConnection(result);
      },
    );
  }

  final Connectivity? connectivityObject;

  void updateNetworkConnection(ConnectivityResult result) {
    if (result == ConnectivityResult.none) {
      emit(NoNetworkConnectionState(connectivityResult: result));
    } else if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      emit(NetworkConnectionUpdatedState(connectivityResult: result));
    }
  }
}
