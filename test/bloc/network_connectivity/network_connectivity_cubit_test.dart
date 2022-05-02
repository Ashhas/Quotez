import 'package:bloc_test/bloc_test.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quotez/bloc/network_connectivity/network_connectivity_cubit.dart';

import '../../mocks.dart';

void main() {
  late Connectivity connectivityWithNetwork, connectivityNoNetwork;

  setUp(() {
    connectivityWithNetwork = MockConnectivity(
      connectivityCase: ConnectivityCase.caseSuccess,
    );
    connectivityNoNetwork = MockConnectivity(
      connectivityCase: ConnectivityCase.caseError,
    );
  });

  group('NetworkConnectivityCubit', () {
    group('listens to [Connectivity().onConnectivityChanged]', () {});
    blocTest(
      'with [ConnectivityResult.none] argument',
      build: () => NetworkConnectivityCubit(
        connectivityObject: connectivityNoNetwork,
      ),
      act: (_) {},
      expect: () => [
        NoNetworkConnectionState(connectivityResult: ConnectivityResult.none),
      ],
    );

    blocTest(
      'with [ConnectivityResult.none] argument',
      build: () => NetworkConnectivityCubit(
        connectivityObject: connectivityWithNetwork,
      ),
      act: (_) {},
      expect: () => [
        NetworkConnectionUpdatedState(
          connectivityResult: ConnectivityResult.wifi,
        ),
      ],
    );
  });
}
