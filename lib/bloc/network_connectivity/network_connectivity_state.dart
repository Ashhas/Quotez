part of 'network_connectivity_cubit.dart';

@immutable
abstract class NetworkConnectivityState extends Equatable {}

class InitialNetworkConnectionState extends NetworkConnectivityState {
  @override
  List<Object> get props => [];
}

class NetworkConnectionUpdatedState extends NetworkConnectivityState {
  final ConnectivityResult connectivityResult;

  NetworkConnectionUpdatedState({required this.connectivityResult});

  @override
  List<Object> get props => [];
}

class NoNetworkConnectionState extends NetworkConnectivityState {
  final ConnectivityResult connectivityResult;

  NoNetworkConnectionState({required this.connectivityResult});

  @override
  List<Object> get props => [];
}
