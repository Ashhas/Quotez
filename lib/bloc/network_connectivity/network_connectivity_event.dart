part of 'network_connectivity_bloc.dart';

abstract class NetworkConnectionEvent extends Equatable {
  const NetworkConnectionEvent();
}

class UpdateNetworkConnection extends NetworkConnectionEvent {
  final ConnectivityResult connectivityResult;

  UpdateNetworkConnection({this.connectivityResult});

  @override
  List<Object> get props => [];
}

class UpdateNetworkConnectionFromStream extends NetworkConnectionEvent {
  final ConnectivityResult connectivityResult;

  UpdateNetworkConnectionFromStream({this.connectivityResult});

  @override
  List<Object> get props => [];
}
