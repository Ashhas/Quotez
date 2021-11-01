part of 'share_bloc.dart';

abstract class ShareState extends Equatable {
  const ShareState();
}

class ShareInitState extends ShareState {
  @override
  List<Object> get props => [];
}
