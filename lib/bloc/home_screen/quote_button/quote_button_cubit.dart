import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:quotez/bloc/home_screen/home_cubit.dart';
import 'package:quotez/ui/home/widgets/buttons/quote_button.dart';

part 'quote_button_state.dart';

/// [QuoteButtonCubit] emits states for [QuoteButton]
/// Listens to [HomeCubit] and updates state to control [QuoteButton]
class QuoteButtonCubit extends Cubit<QuoteButtonState> {
  final HomeCubit homeCubit;
  StreamSubscription? homeSubscription;

  QuoteButtonCubit({required this.homeCubit}) : super(QuoteButtonStandby()) {
    homeSubscription = homeCubit.stream.listen((homeState) {
      if (homeState is HomeLoading) {
        emit(QuoteButtonPressed());
      } else if (homeState is HomeLoaded) {
        emit(QuoteButtonStandby());
      }
    });
  }
}
