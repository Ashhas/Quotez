part of 'share_bloc.dart';

abstract class ShareEvent extends Equatable {
  const ShareEvent();
}

class ShareQuote extends ShareEvent {
  @override
  List<Object> get props => [];
}
