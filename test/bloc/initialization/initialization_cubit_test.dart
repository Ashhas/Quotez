import 'package:flutter/widgets.dart';

import 'package:bloc_test/bloc_test.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:quotez/bloc/initialization/initialization_cubit.dart';

enum ConnectivityCase { caseError, caseSuccess }

class MockConnectivity extends Mock implements Connectivity {
  ConnectivityCase connectivityCase;

  MockConnectivity({required this.connectivityCase});

  @override
  Future<ConnectivityResult> checkConnectivity() {
    if (connectivityCase == ConnectivityCase.caseSuccess) {
      return Future.value(ConnectivityResult.wifi);
    } else {
      return Future.value(ConnectivityResult.none);
    }
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late InitializationCubit initializationCubit;
  late Connectivity connectivity;

  setUp(() {
    connectivity = MockConnectivity(
      connectivityCase: ConnectivityCase.caseSuccess,
    );
    initializationCubit = InitializationCubit(
      connectivityObject: connectivity,
    );
  });

  group('InitializationCubit', () {
    group('With Network Connection', () {
      setUp(() {
        connectivity = MockConnectivity(
          connectivityCase: ConnectivityCase.caseSuccess,
        );
        initializationCubit = InitializationCubit(
          connectivityObject: connectivity,
        );
      });

      blocTest(
        'calls initializationCubit.checkNetworkStatus and emits [InitializedState] when there is a network connection',
        build: () => initializationCubit,
        act: (InitializationCubit cubit) {
          cubit.checkNetworkStatus();
        },
        expect: () => [InitializedState()],
      );
    });

    group('No Network Connection', () {
      setUp(() {
        connectivity = MockConnectivity(
          connectivityCase: ConnectivityCase.caseError,
        );
        initializationCubit = InitializationCubit(
          connectivityObject: connectivity,
        );
      });

      blocTest(
        'calls initializationCubit.checkNetworkStatus and emits [NoNetworkOnStartup] when there is a NO network connection',
        build: () => initializationCubit,
        act: (InitializationCubit cubit) {
          cubit.checkNetworkStatus();
        },
        expect: () => [NoNetworkOnStartup()],
      );
    });
  });
}
