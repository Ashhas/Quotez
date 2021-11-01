import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'share_event.dart';

part 'share_state.dart';

class ShareBloc extends Bloc<ShareEvent, ShareState> {
  ShareBloc() : super(ShareInitState());

  @override
  Stream<ShareState> mapEventToState(ShareEvent event) async* {
    if (event is ShareQuote) {
      yield* _mapShareQuoteToState(event);
    }
  }

  Stream<ShareState> _mapShareQuoteToState(ShareEvent event) async* {}
}
