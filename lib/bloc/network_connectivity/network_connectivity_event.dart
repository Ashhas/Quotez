part of 'network_connectivity_bloc.dart';

abstract class NetworkConnectivityEvent extends Equatable {
  const NetworkConnectivityEvent();
}

class UpdateNetworkConnectionFromStream extends NetworkConnectivityEvent {
  final ConnectivityResult connectivityResult;

  const UpdateNetworkConnectionFromStream({required this.connectivityResult});

  @override
  List<Object> get props => [];
}
