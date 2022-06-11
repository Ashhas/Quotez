import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hive/hive.dart';
import 'package:mocktail/mocktail.dart';

import 'package:quotez/bloc/home_screen/home_cubit.dart';
import 'package:quotez/bloc/home_screen/quote_button/quote_button_cubit.dart';
import 'package:quotez/bloc/network_connectivity/network_connectivity_cubit.dart';
import 'package:quotez/data/model/quote.dart';
import 'package:quotez/data/repository/quote_repository.dart';
import 'package:quotez/network/api_client.dart';

enum ConnectivityCase { caseError, caseSuccess }

class MockConnectivity extends Mock implements Connectivity {
  ConnectivityCase connectivityCase;

  MockConnectivity({required this.connectivityCase});

  @override
  Stream<ConnectivityResult> get onConnectivityChanged {
    if (connectivityCase == ConnectivityCase.caseSuccess) {
      return Stream.value(ConnectivityResult.wifi);
    } else {
      return Stream.value(ConnectivityResult.none);
    }
  }

  @override
  Future<ConnectivityResult> checkConnectivity() {
    if (connectivityCase == ConnectivityCase.caseSuccess) {
      return Future.value(ConnectivityResult.wifi);
    } else {
      return Future.value(ConnectivityResult.none);
    }
  }
}

class MockHomeCubit extends Mock implements HomeCubit {
  @override
  late Stream<HomeState> stream;

  MockHomeCubit({required this.stream});
}

class MockQuoteButtonCubit extends Mock implements QuoteButtonCubit {}

class MockNetworkCubit extends Mock implements NetworkConnectivityCubit {
  @override
  late Stream<NetworkConnectivityState> stream;

  MockNetworkCubit({required this.stream});
}

class MockQuoteRepository extends Mock implements QuoteRepository {}

class MockBox extends Mock implements Box {
  @override
  Iterable<Quote> values;

  MockBox({required this.values});
}

class MockDioClient extends Mock implements ApiClient {}
