import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:quotez/bloc/home_screen/home_cubit.dart';
import 'package:quotez/ui/home/widgets/buttons/quote_button.dart';

part 'quote_button_state.dart';

///Bloc that keeps track of the state and events from the [QuoteButton] widget.
///This Bloc listens to [HomeBLoc] and changes states to control the animation in the UI
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
